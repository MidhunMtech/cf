<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Task 25_2</title>
	</head>
	<body>
		<form action="" method="post">
			<textarea name="text" id="textId" rows="4" cols="50"></textarea> <br>
			<input type="submit" name="submit" >
		</form>
	</body>
</html>
<cftry>
	<cfif structKeyExists(form, "submit") >
		<cfset task25CFC = createObject("component", "component.tagCloud") />
		<cfset result = task25CFC.task25C(form.text) />
		
		<cfoutput>#result#</cfoutput>
	</cfif>
<cfcatch>
	<cfdump var="#cfcatch#" />
</cfcatch>
</cftry>