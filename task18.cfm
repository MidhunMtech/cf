<html>
	<head>
		<title>Task 18</title>
	</head>
	<body>
		<cfset task18CFC = createObject("component", "component.sql") />
		<cfset result = task18CFC.task18() />

		<cfdump var="#result#">
	</body>
</html>