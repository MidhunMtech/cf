<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Task 26</title>
	</head>
	<body>
		<form action="" method="post" enctype="multipart/form-data">
			<input type="file" name="file" > <br>
			<input type="submit" name="submit" >
		</form>
	</body>
</html>

<cfscript>
	try {
		if(structKeyExists(form, "submit")) {
			task26CFC = createObject("component", "component.tagCloud");
			result = task26CFC.task26Script(form.file);
			
			writeOutput(#result#);
		}
	} catch (any e) {
		writeDump(var=e)
	}
</cfscript>