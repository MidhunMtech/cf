<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Task 26</title>
	</head>
	<body>
		<form action="" method="post" enctype="multipart/form-data">
			<input type="file" name="file" > <br>
			<input type="submit" name="submit" >
		</form>
	</body>
</html>
<cftry>
	<cfif structKeyExists(form, "submit") >
		<cfset task26CFC = createObject("component", "component.tagCloud") />
		<cfset result = task26CFC.task26(form.file) />
		
		<cfoutput>#result#</cfoutput>
	</cfif>
<cfcatch><cfdump var="#cfcatch#" /></cfcatch>
</cftry>