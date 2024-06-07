<!DOCTYPE html>
<html lang="en">
	<head>	
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>task 7</title>
	</head>
	<body>
		<cfapplication name="Application7CFC"
               		sessionmanagement="yes"
               		sessiontimeout="#createTimeSpan(0, 0, 2, 0)#">

		<form action="" method="POST">
			<label for="textbox1">Key: </label>
			<input type="text" id="textbox1" name="textbox1" required><br><br>

			<label for="textbox2">Value: </label>
			<input type="text" id="textbox2" name="textbox2" required><br><br>

			<input type="submit" name="submit" value="submit"><br><br>
		</form>

		<cfscript>
			if (structKeyExists(form, "submit")) {
				task7CFC = createObject("component", "component.task5");
				result = task7CFC.task7(form.textbox1, form.textbox2);

				writeDump(var=result);
			}
		</cfscript>

	</body>
</html>







