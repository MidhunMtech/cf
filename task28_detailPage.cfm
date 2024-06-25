<cftry>
	<cfif structKeyExists(url, "pageid") >
		<cfset task28CFC = createObject("component", "component.taskTag") />
		<cfset getPage = task28CFC.task28PageDetails() />
	</cfif>
<cfcatch><cfdump var="#cfcatch#" abort/></cfcatch>
</cftry>
<!DOCTYPE html>
<html>
	<head>
		<title>Detail Page</title>
	</head>
	<body>
		<cfoutput>
			<h1>#getPage.pagename#</h1>
			<p>#getPage.pageDesc#</p>
		</cfoutput>
		
		<button><a href="task28_index.cfm">Back to list</a></button>
	</body>
</html>
