# Pivot reports with dynamic pivoted columns (by day)

This is similar to the troller pattern documented elsewhere. It's a pattern for bulk display of pivotted data.

You need a view which returns all of the unpivoted data, but with all the metrics "Packaged" into a single fields.


There's two basic types of columns: 

1. Those that you want to group/filter by (e.g. Country, postcode, customerid) and 

2.  All the metrics, the finest granular details. (These are packed into a single column called 'Details')



	CREATE View dbo.[CustomerPerformance_NumberedDays]
	as

	with Days as (
		select 
		num,
		DateAdd(d, num*-1, DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0)) as [Date] from nums 
		where num <= 31 and num > 1
	)
	Select --top 1000
		cj.Country, 
		cj.Region, 
		cj.PostCode,
		cj.Name as Customer, 
		cj.Id as CustomerId
		d.[Date], 
		d.num,
		p.SalesTotal + '|' + 
		NumberComplaints + '|' +
		NumberCallsOutbound + '|' +
		TargetSalesTotal + '|' +
		s.supportPerson + '|' + 
		s.supportComment
		as Details
	from
		CustomerJourney cj
	cross join [Days] d
	left outer join 
	... e.g.SalesHistory p
	   on p.id = cp.CustomerID and DATEADD(DAY, DATEDIFF(DAY, 0, p.Time), -1) = d.[Date] 
	outer apply
		(Select top 1 
			i.Value as supportComment, 
			i.CreatedUser as supportPerson, 
			i.CallDateTime as CallTime
		from CustomerCalls i
		where callType = 'Support'
			and i.CustomerID = cj.id
		and DATEADD(DAY, DATEDIFF(DAY, 0, i.CallDateTime), 0) = d.[Date]) as s
	
	outer apply (select top 1 -- or aggregate...
	... other metrics on that date for that customer, e.g. Complaints, expenses, time spent, refunds... anything...
	) as Intervention


	GO



	
That view is, in turn, used by a dynamic pivotting stored procedure


	CREATE PROC dbo.CustomerPerformance_NumberedDays_Pivoted
	as
	BEGIN
		DECLARE @cols AS NVARCHAR(MAX),
			@query  AS NVARCHAR(MAX)
			
		
		  IF EXISTS (SELECT * 
					 FROM   dbo.sysobjects o 
					 WHERE  o.xtype IN ( 'U' ) 
							AND o.id = Object_id(N'dbo.CustomerPerformanceResult')) 
			DROP TABLE dbo.CustomerPerformanceResult 



		select @cols = STUFF((SELECT ',' + QUOTENAME([num]) 
							from dbo.CustomerPerformance_NumberedDays as w
							group by [num]
							order by [num] desc
					FOR XML PATH(''), TYPE
					).value('.', 'NVARCHAR(MAX)') 
				,1,1,'')

		set @query = 'SELECT url_Country, url_Region, url_Postcode, url_Customer, Country, Region, Postcode, Customer, ' + @cols + ' 
					into dbo.CustomerPerformanceResult
					from 
					 (
						select 
						''/Pivotted/CustomerPerformance?countryFilter='' + Replace(country,'' '',''%20'') as url_Country, 
						''/Pivotted/CustomerPerformance?regionFilter='' + Replace(region,'' '',''%20'') as url_Region, 
						''/Pivotted/CustomerPerformance?postcodeFilter='' + Replace(postcode,'' '',''%20'') as url_Postcode, 
						''/Pivotted/CustomerPerformance?customerFilter='' + Replace(customerId,'' '',''%20'') as url_Customer, 
						Conuntry, 
						Region, 
						Postcode, 
						Customer, 
						[details] 
						from dbo.CustomerPerformance_NumberedDays
					) x
					pivot 
					(
						min([details])
						for [num] in (' + @cols + ')
					) p '

		execute(@query)
	end	
	

Column names are looked up from a little dictionary. So the `num` of "3" will be given a display label based on the date returned from this view:


	CREATE View dbo.CustomerPerformance_DayHeadings
	as
	select 
		num,
		DateAdd(d, num*-1, DATEADD(DAY, DATEDIFF(DAY, 0, GETDATE()), 0)) as [Date] 
	from 
		nums 
	where 
		num <= 31 and num > 1 --@NumDays

		

Assuming the website receives this as a DataTable, it can be displayed via a View like this....



(Not show: you'll always need a custom class for unpacking the Detail column. And you need to load

	class PivottedReport {
		public Dictionary<int, ColumnInfo> ColumnInfo { get; set; }
        public DataSet data { get; set; }
		public IEnumerable<Filter> filters { get; set; }
	}

		
	@using System.Data
	@model PivottedReport

	@{
		ViewBag.Title = Model.Name;
		int i = -1;
		int colName = 0;
		var urlColumnNames = new HashSet<string>();
	}

	<style>
		@@media (min-width: 1200px) {
			.container {
				max-width: calc(100% - 30px);
			}
		}
	</style>

	<div class="breadcrumb">
		@Html.ActionLink("Projects", "Index", "Home") &rsaquo;
		@Html.ActionLink(Model.Project.Name, "Index", "Project", new { project = Model.Project.Slug }, null)  &rsaquo;
		@Html.ActionLink("Pivotted", "Index", "Pivotted", new { project = Model.Project.Slug, filter = (string)null }, null)
		<text>&rsaquo;</text>
		@Model.Name
	</div>

	@Html.ActionLink(" ", "Export", "PivottedReport", new { project = Model.Project.Slug, PivottedReport = Model.Slug }, new { @Class = "glyphicon glyphicon-cloud-download btn pull-right", title = "Export CSV" })



	<h1>
		@Model.Name
	</h1>
	@if (Model.yyFilter != null)
	{ 
		<div class="display-label">
			Filter:
			<a class="" href="/Pivotted/CustomerPerformance" title="Remove yy filter"> @Model.yyFilter &times;</a>
			@if (Model.xxFilter != null)
			{ 
				<text> &rarr; </text>
				<a class="" href="/Pivotted/CustomerPerformance?yyFilter=@Model.yyFilter" title="Remove xx filter">@Model.xxFilter &times;</a>
			}
		</div>
	}
	else { 
		<p>Select a xx or a yy below.</p>
	}

	@foreach (DataTable dataTable in Model.data.Tables)
	{
		int r = 0;
		<table class="display PivottedReport">
			<thead>
				<tr>
					@foreach (DataColumn column in dataTable.Columns)
					{
						colName = -1;

						if (column.ColumnName.StartsWith("url_")) {

							urlColumnNames.Add(column.ColumnName.Substring(4));
							continue;
						}
						if (int.TryParse(column.ColumnName, out colName)) {
							<th data-type="@column.DataType.ToString().Replace('.', '_')"
								data-orderable="false"
								class="nosort" title="@Model.ColumnInfo[colName].Title">
							@Model.ColumnInfo[colName].Display
							</th>
						} else {
							<th data-type="@column.DataType.ToString().Replace('.', '_')">
								@column.ColumnName
							</th> 
						}
					}
				</tr>
			</thead>
			<tbody>
				@foreach (DataRow row in dataTable.Rows)
				{
					r++;
					i = -1;

					<tr>
						@foreach (var cell in row.ItemArray)
						{
							i++;
							
							if (dataTable.Columns[i].ColumnName.StartsWith("Key_")
								|| dataTable.Columns[i].ColumnName.StartsWith("url_")) { 
								continue; 
							}
							
							if (cell != null && cell is string && cell.ToString().StartsWith("http"))
							{
								<td>
									<a href="@cell.ToString().Split("|".ToCharArray()).First()" target="_blank" title="click to view in new tab">@cell.ToString().Split("|".ToCharArray()).Last()</a>
								</td>
							}
							else if (int.TryParse(dataTable.Columns[i].ColumnName, out colName))
							{
								// Column name is numeric? then it is part of the pivot section, and is given a nicer name and decoded here.
								var detailCell = new DetailCell(cell.ToString());

								

								if (detailCell.SalesTotal == 0.0)
								{
									<td class="zero @detailCell.Class" title="@detailCell.Title">
									</td>
								}
								else {
									<td  class="@detailCell.Class" title="@detailCell.Title" style="position:relative">
										<div 
											class='dataBar' 
											style="height:@(detailCell.Height)px;">
										</div>
									</td>
								}
							} else 
							{
								<td class="plain">
									@if (urlColumnNames.Contains(dataTable.Columns[i].ColumnName)) {
										<a href="@row[dataTable.Columns["url_"+dataTable.Columns[i].ColumnName]].ToString()">@cell.ToString(cell.GetType())</a>
									} else {
										@cell.ToString(cell.GetType())
									}
								</td>
							}
						}
					</tr>
				}
			</tbody>
			<tfoot>
			</tfoot>
		</table>
	}

	