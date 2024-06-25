<cfif NOT structKeyExists(session, "logIn")>
	<cflocation url="task27.cfm" />
</cfif>
<html>
	<head>
		<title>Welcome Page</title>
	</head>
	<body>
		<h2>Welcome Page</h2>
		<p>Welcome, you are logged in!</p>
		<button><a href="task27_welcome.cfm?logout=true">Logout</a></button>
	</body>
</html>

<cfif structkeyExists(url, "logout") >
	<cfset StructClear(session) />
	<cflocation url="task27.cfm" />
</cfif>

