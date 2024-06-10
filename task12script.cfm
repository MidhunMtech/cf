<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Task 12</title>
	</head>
	<body>
		<form action="" method="post">
			<label for="numId">Enter numeric value less than 11: </label>
			<input type="text" id="numId" name="num" min="1" max="10" ><br><br>
			<input type="submit" name="submit">
		</form>	
	
		<cfscript>
			if (structKeyExists(form,"num")) {
				task12CFC = createObject("component", "component.sql");
				result = task12CFC.task12Script(form.num);

				writeOutput("<p>#form.num#<sup>th</sup> record's First Name is: #result.firstname# </p>");
			}
		</cfscript>

		
	</body>
</html>