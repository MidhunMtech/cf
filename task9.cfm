<!DOCTYPE html>
<html lang="en">
	<head>	
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>task 9</title>
	</head>
	<body>
		<cfapplication name="Application9CFCTag"
               		sessionmanagement="yes"
               		sessiontimeout="#createTimeSpan(0, 0, 20, 0)#">

		<form action="" method="POST">
			<label for="textbox1">Key: </label>
			<input type="text" id="textbox1" name="textbox1" required><br><br>

			<label for="textbox2">Value: </label>
			<input type="text" id="textbox2" name="textbox2" required><br><br>

			<input type="submit" name="submit" value="submit"><br><br>
		</form>

		<cfif structKeyExists(form, "submit") >
			<cfset task9cfc = createObject("component", "component.taskTag") />
			<cfset result = task9cfc.task9Tag(form.textbox1, form.textbox2) />

			<cfdump var="#result#" />
		</cfif>

	</body>
</html>







