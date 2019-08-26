# Wiql Editor


## Key bindings:

 * Shift + Enter : Run
 * Alt + Shift + F or Ctr + Shift + F : Format
 * Alt + R : Apply focus to first result



	SELECT
		[System.Id],
		[Microsoft.VSTS.Common.StackRank],
		[Microsoft.VSTS.Common.Priority],
		[System.AssignedTo],
		[Microsoft.VSTS.Scheduling.RemainingWork],
		[Microsoft.VSTS.Scheduling.CompletedWork],
		[System.Title],
		[System.BoardColumn],
		[System.BoardColumnDone],
		[System.BoardLane],
		[Microsoft.VSTS.CodeReview.AcceptedBy],
		[Microsoft.VSTS.Common.ActivatedDate],
		[Microsoft.VSTS.Common.Activity],
		[Microsoft.VSTS.CodeReview.Context],
		[System.ChangedDate],
		[System.CreatedDate],
		[Microsoft.VSTS.TCM.QueryText],
		[System.State],
		[Microsoft.VSTS.Common.StateCode],
		[Microsoft.VSTS.Common.StateChangeDate]
	FROM workitems
	WHERE
		[System.TeamProject] = @project
		AND [System.WorkItemType] = 'User Story'
		AND NOT [System.State] CONTAINS 'Removed'
		AND NOT [System.State] CONTAINS 'Closed'
	ORDER BY [System.BoardColumn]

# Avoiding Sock Exceptions when using WorkItemTrackingHttpClient

When writing a C# asp.net MVC app that queries azure devops with the `WorkItemTrackingHttpClient` -- I found I was receiving 

	SocketException: A connection attempt failed because the connected party did not properly respond after a period of time, or established connection failed because connected host has failed to respond 11.111.11.11:443

(IP Addresses have been changed here)

...even though the exact same code worked from a C# Console app. 

The fix was to specify the proxy information, in the `web.config` file

    <system.net>
      <defaultProxy useDefaultCredentials="true" enabled="true">
        <proxy bypassonlocal="true" proxyaddress="http://PROXYADDRESS:8080" />
      </defaultProxy>
      <settings>
        <ipv6 enabled="true"/>
      </settings>
    </system.net>


...where PROXYADDRESS is the actual address of the company's proxy.
