# Need to add selects/dropdowns to a basic asp.net MVC site?

The classic jquery plugin for this is [`Chosen`](https://harvesthq.github.io/chosen/) and its more up to date descendant, [`Select2`](https://select2.github.io/)  ([What are the differences?](http://stackoverflow.com/questions/13575531/what-are-the-differences-between-chosen-and-select2))

I'd forgotten all about these until I needed them today.

To use `Select2`:

Add the nuget package for `select2` (and `jquery` if you haven't already)

If it hasn't automatically added the `select2.css` and `select2.js` to your `_layout.cshtml` then do that manually. Like a primitive cave dweller.


Here's an example control group for a drop down list that is dynamically populated from a JSON service

    <div class="control-group">
        @Html.LabelFor(m => m.Responsible, new { @class = "control-label" })
        <div class="controls">
            @Html.DropDownListFor(m => m.Responsible, Model.CurrentResponsibleItem, new { @id = "Responsible", @style = "width:300px;" })
            @Html.ValidationMessageFor(m => m.Responsible, null, new { @class = "help-inline" })
            <a href='~/Help/Responsible' target="_blank">help <span class="glyphicon glyphicon-new-window"></span></a>
        </div>
    </div>


And here's the javascript to be called in document.ready:

    var personUrl = '/SomeUrl/GetPerson';
    var pageSize = 20;
    $('#TargetControlID').select2({
        placeholder: 'Responsible person',
        //Does the user have to enter any data before sending the ajax request:
        minimumInputLength: 3,
        allowClear: true,
        ajax: {
            //How long the user has to pause their typing before sending the next request
            quietMillis: 150,
            //The url of the json service
            url: personUrl,
            dataType: 'jsonp',
            //Our search term and what page we are on
            data: function (term, page) {
                return {
                    pageSize: pageSize,
                    pageNum: page,
                    searchTerm: term.term
                };
            },
            results: function (data, page) {
                //Used to determine whether or not there are more results available,
                //and if requests for more data should be sent in the infinite scrolling
                var more = (page * pageSize) < data.Total;
                return { results: data.Results, more: more };
            }
        }
    });


Note the part above where it says "term.term"  I discovered i needed that while debugging, like a primitive cave dweller.

These two DTO classes are used on the server, for sending json back to select2 in a form it expects.

    public class Select2OptionModel
    {
        public string id { get; set; }
        public string text { get; set; }
    }

    public class Select2PagedResult
    {
        public int total { get; set; }
        public IEnumerable<Select2OptionModel> results { get; set; }
    }

Here's the method which is called by the client-side ajax, when searching for an item.

(This is v ugly code, I didn't prepare it for re-use *at all*. This example fetches people records from a table, and projects them into `Select2OptionModel`s, which are then packed into a `Select2PagedResult` for use by `select2`. Ahhh... I have ignored the pageNum and pageSize too, by the looks of it. I didn't even need to worry about them for the size of my data (thousands not millions of rows))

        [HttpGet]
        public ActionResult GetPerson(string searchTerm, int pageSize, int? pageNum)
        {
            if (string.IsNullOrWhiteSpace(searchTerm) || searchTerm.Trim().Length < 3)
            {
                return new JsonpResult
                {
                    Data = null
                };
            }

            IEnumerable<Select2OptionModel> people;

            using (var connection = new ProfiledDbConnection(SqlConnectionString.GetOpenConnection("DB"), MiniProfiler.Current))
            {
                people = connection.SelectWhere<Person>("Name like @searchTerm and not ActiveDirectoryID is null",
                   new { searchTerm = "%" + searchTerm.Replace(" ", "%") + "%" })
                   .Select(p => new Select2OptionModel {
                        id = p.ActiveDirectoryID,
                        text = p.Name });
            }

            Select2PagedResult result = new Select2PagedResult { total = people.Count(), results = people };

            //Return the data as a jsonp result
            return new JsonpResult
            {
                Data = result
            };
        }


Here's some rough CSS I added to `site.css`, to make these fit in with Twitter Bootstrap a little better:

    .select2-container {
        font-size: 1.2em;
    }
    .select2-container--default .select2-selection--single {
        border-radius: 0;
    }


That is all so lengthy, so filled with ceremony... it's not the fun-filled code we were hoping for. Sorry.


## Source

 * http://blog.e-zest.net/tech-tutorial-select2-with-asp.net-mvc