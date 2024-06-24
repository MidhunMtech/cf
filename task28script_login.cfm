<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Login Page</title>
	</head>
	<body>
		<cfinclude template="task28script_error.cfm" >
	
		<form action="" method="post">
			Username: <input type="text" name="username"><br><br>
			Password: <input type="Password" name="pwd"><br><br>
			<input type="submit" name="submit" value="login">
		</form>
	</body>
</html>

<cfscript>
	try{
		if (structKeyExists(form, "submit")) {
			task28CFC = createObject("component", "component.script");
			result = task28CFC.task28ScriptLogin(form.username, form.pwd);
		}
	} catch(any e) {
		writeDump(var=e)
	}
</cfscript>
