<html>
	<head>
		<title>Task 18 SC</title>
	</head>
	<body>
		<cfscript>

			task18CFC = createObject("component", "component.sql");
			result = task18CFC.task18Script();
			
			writeDump(result);
		
		</cfscript>
	</body>
</html>
