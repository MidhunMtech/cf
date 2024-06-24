<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Task 25</title>
	</head>
	<body>
		<form action="" method="post">
			<textarea name="text" id="textId" rows="4" cols="50"></textarea> <br>
			<input type="submit" name="submit" >
		</form>
	</body>
</html>

<cftry>
	<cfif structkeyExists(form, "submit")>
		<cfset task25CFC = createObject("component", "component.tagCloud") />
		<cfset result = task25CFC.task25(form.text) />
		
		<cfdump var="#result#" />
	</cfif>	
<cfcatch>
	<cfdump var="#cfcatch#"></cfdump>
</cfcatch>
</cftry>