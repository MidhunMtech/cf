<cfscript>
	try {
		if (structkeyExists(form, "submit")) {
			task27CFC = createObject("component", "component.script");
			result = task27CFC.task27Script(form.username, form.password);
			writeOutput(#result#);
		}
	} catch (any e){
		writeDump(var=e)
	}
</cfscript>

<html>
	<head>
		<title>task 27</title>
	</head>
	<body>
		<h2>Login Page</h2>
		<form method="post" action="">
			Username: <input type="text" name="username" ><br><br>
			Password: <input type="password" name="password"><br><br>
			<input type="submit" name="submit" value="Login">
		</form>
	</body>
</html>