<!DOCTYPE html>
<html>
	<head>
		<title>Detail Page</title>
	</head>
	<body>
		<cfinclude template="task28_editTable.cfm" />
		<cfoutput>
			<h1>#getPage.pagename#</h1>
			<p>#getPage.pageDesc#</p>
		</cfoutput>
		
		<button><a href="task28_index.cfm">Back to list</a></button>
	</body>
</html>