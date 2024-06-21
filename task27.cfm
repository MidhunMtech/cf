<html>
	<head>
		<title>Login Page</title>
	</head>
	<body>
		<h2>Login Page</h2>
		<cftry>
		<cfif structKeyExists(form,"submit")>
			<cfset task27CFC = createObject("component", "component.taskTag") />
			<cfset result = task27CFC.task27(form.username, form.password) />
			<cfoutput>#result#</cfoutput>
		</cfif>
		<cfcatch><cfdump var="#cfcatch#" /></cfcatch>
		</cftry>
		<form method="post" action="">
			Username: <input type="text" name="username" ><br><br>
			Password: <input type="password" name="password"><br><br>
			<input type="submit" name="submit" value="Login">
		</form>
	</body>
</html>