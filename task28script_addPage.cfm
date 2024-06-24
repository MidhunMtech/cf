<cfscript>
	try{
		if(structKeyExists(form, "submit")) {
			task28CFC = createObject("component","component.script");
			result = task28CFC.task28ScriptAddPage(form.pagename, form.pagedesc);
		}
	} catch(any e) {
		writeDump(var=e);
	}
</cfscript>
<!DOCTYPE html>
<html>
	<head>
		<title>Add Page</title>
	</head>
	<body>
		<form action="" method="post">
			Page Name: <input type="text" name="pagename" required><br>
			Page Description: <textarea name="pagedesc" required></textarea><br><br>
			<input type="submit" name="submit" value="Add Page">
		</form>	
	</body>
</html>