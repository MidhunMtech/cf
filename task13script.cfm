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

		<cfscript>
			if (structKeyExists(form, "submit")) {
				task13CFC = createObject("component", "component.sql");
				res = task13CFC.task13Script(form.word);

				writeOutput(res);
			}

		</cfscript>

	</body>

</html>