<html>
	<head>
		<title>Welcome Page</title>
	</head>
	<body>
		<h2>Welcome Page</h2>
		<p>Welcome, you are logged in!</p>
		<button><a href="task27script_welcome.cfm?logout=true">Logout</a></button>
	</body>
</html>
<cfscript>
	if (structKeyExists(url, "logout") AND url.logout EQ "true") {
		structClear(session);
		location(url="task27script.cfm");
	}
</cfscript>