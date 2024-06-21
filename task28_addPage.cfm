<cftry>
	<cfif structKeyExists(form, "submit") >
		<cfset task28CFC = createObject("component", "component.taskTag") />
		<cfset result = task28CFC.task28AddPage(form.pagename, form.pagedesc) />
		<cfdump var="#result#" />
	</cfif>
<cfcatch><cfdump var="#cfcatch#" abort/></cfcatch>
</cftry>

<!DOCTYPE html>
<html>
	<head>
		<title>Add Page</title>
	</head>
	<body>
		<form action="" method="post">
			Page Name: <input type="text" name="pagename" required><br>
			Page Description: <textarea name="pagedesc" required></textarea><br><br>
			<input type="submit" name="submit" value="Add Page">
		</form>	
	</body>
</html>


