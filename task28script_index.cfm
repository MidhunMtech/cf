<cfscript>

	getPages = queryExecute(
		"SELECT * FROM page",
		[],
		{datasource = "cfTask"}
	);
	
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
		<title>page List</title>
	</head>
	<body>
		<h1>Pages</h1>
		<a href="task28script_dash.cfm?logout=true">logout</a><br><br>
		<ul>
			<cfoutput query="getPages">
				<li><a href="task28script_detailPage.cfm?pageid=#pageid#">#pagename#</a></li>
			</cfoutput>
		</ul>
	</body>
</html>