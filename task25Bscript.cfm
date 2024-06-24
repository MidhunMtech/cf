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

<cfscript>
	try {
		if(structKeyExists(form, "submit")) {
			task25BCFC = createObject("component", "component.tagCloud");
			result = task25BCFC.task25BScript(form.text);
			
			writeOutput(#result#);
		}
	} catch (any e) {
		writeDump(var=e)
	}
</cfscript>