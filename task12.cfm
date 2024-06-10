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

		<cfif structKeyExists(form,"num") >
			<cfset task12CFC = createObject("component", "component.sql") />
			<cfset reslt = task12CFC.task12SQL(form.num) />
			<cfoutput>
    				<p>#form.num#<sup>th</sup> record's Name is: #reslt.firstname# #reslt.lastname#</p>
			</cfoutput>
		</cfif>
	</body>
</html>