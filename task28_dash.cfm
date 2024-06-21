<cftry>
	<cfset task28CFC = createObject("component", "component.taskTag") />
	<cfset result = task28CFC.task28Dash() />
<cfcatch><cfdump var="#cfcatch#" /></cfcatch>
</cftry>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Dashboard</title>
	</head>
	<body>
		<h1>Welcome <cfoutput>#session.username#</cfoutput></h1>
		<a href="task28_addPage.cfm">Add Page</a>
		<a href="task28_dash.cfm?logout=true">logout</a><br><br>
		
		<cftry>
			<cfinclude template="task28_pages.cfm" />
		<cfcatch><cfdump var="#cfcatch#"/></cfcatch>
		</cftry>
	</body>
</html>