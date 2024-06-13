<!DOCTYPE html>
<html>
	<head>
		<title>Task 16</title>
	</head>
	<body>

		<cfset task16CFC = createObject("component", "component.taskTag") />
		<cfset res=task16CFC.squarePattern(3) />
		<cfoutput>
			<p>#res#</p>
		</cfoutput>
	</body>
</html>
