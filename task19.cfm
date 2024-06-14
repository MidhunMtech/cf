<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Task 19 SC</title>
</head>
<body>

		<cfset task19CFC = createObject("component", "component.taskTag") />
		<cfset reslt = task19CFC.task19Cookie() />
	
    <h1>Visits Counter: <cfoutput>#reslt#</cfoutput></h1>
    <form method="post" action="">
        <button type="submit">Submit</button>
    </form>
</body>
</html>