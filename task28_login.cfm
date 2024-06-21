<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Login Page</title>
	</head>
	<body>
		<cfinclude template="task28_error.cfm" >
	
		<form action="" method="post">
			Username: <input type="text" name="username"><br><br>
			Password: <input type="text" name="pwd"><br><br>
			<input type="submit" name="submit" value="login">
		</form>
	</body>
</html>
<cftry>
	<cfif structKeyExists(form, "submit") >
		<cfset task28CFC = createObject("component", "component.taskTag") />
		<cfset result = task28CFC.task28Login(form.username, form.pwd) />
		
		<cfoutput>#result#</cfoutput>
	</cfif>
<cfcatch><cfdump var="#cfactch#" /></cfcatch>
</cftry>
