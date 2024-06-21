<cfquery name="getPages" datasource="cfTask">
    SELECT * FROM page
</cfquery>

<cftry>
	<cfset task28CFC = createObject("component", "component.taskTag") />
	<cfset result = task28CFC.task28Dash() />
<cfcatch><cfdump var="#cfcatch#" /></cfcatch>
</cftry>

<!DOCTYPE html>
<html>
	<head>
		<title>page List</title>
	</head>
	<body>
		<h1>Pages</h1>
		<a href="task28_dash.cfm?logout=true">logout</a><br><br>
		<ul>
			<cfoutput query="getPages">
				<li><a href="task28_detailPage.cfm?pageid=#pageid#">#pagename#</a></li>
			</cfoutput>
		</ul>
	</body>
</html>