<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" >
		<meta name="viewport" content="width=device-width, initail-scale=1.0">
		<title> Task 13 </title>
	</head>
	<body>
		<form action="" method="post">
			<label for="words">Enter words: </label>
			<input type="text" name="word" id="words" >
			<input type="submit" name="submit"><br><br>
		</form>

		<cfif structKeyExists(form, "submit") >
			<cfset task13CFC = createObject("component", "component.sql") />
			<cfset res = task13CFC.task13(form.word) />
			<cfoutput>#res#</cfoutput>
		</cfif>
	</body>

</html>