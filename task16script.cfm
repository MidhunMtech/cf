<!DOCTYPE html>
<html>
	<head>
		<title>Task 16</title>
	</head>
	<body>

		<cfscript>
			task16CFC = createObject("component", "component.script");
			res = task16CFC.squarePattern(3);
			
			writeOutput(res)
		</cfscript>
		
	</body>
</html>
