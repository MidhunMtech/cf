<cfscript>
	try{
		task28CFC = createObject("component", "component.script")
		result = task28CFC.task28ScriptDash()
	} catch (any e) {
		writeDump(var=e)
	}
</cfscript>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Dashboard</title>
	</head>
	<body>
		<h1>Welcome <cfoutput>#session.username#</cfoutput></h1>
		<a href="task28script_addPage.cfm">Add Page</a>
		<a href="task28script_dash.cfm?logout=true">logout</a><br><br>
		<cftry>
			<cfinclude template="task28script_pages.cfm" />
			<cfcatch><cfdump var="#cfcatch#" /></cfcatch>
		</cftry>
	</body>
</html>