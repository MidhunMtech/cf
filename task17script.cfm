<!DOCTYPE html>
<html>
	<head>
		<title>Task 17</title>
		<link rel="stylesheet" type="text/css" href="css/task17.css" >
	</head>
	<body>
		<form action="" method="post" >
			<label for="numberId">Enter Number: </label>
			<input type="text" id="numberId" name="number" required><br><br>
			
			<input type="submit" name="submit"><br><br>
		</form>
		<cfif structKeyExists(form,"number")>
			<cfset task17CFC = createObject("component", "component.script") />
			<cfset result = task17CFC.task17Script(form.number) />
			
			<cfoutput>#result#</cfoutput>
		</cfif>
	</body>
</html>