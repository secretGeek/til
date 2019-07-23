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