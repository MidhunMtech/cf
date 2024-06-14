<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Task 19 SC</title>
</head>
<body>
	<cfscript>
		task19CFC = createObject("component", "component.script");
		reslt = task19CFC.cookie();
	</cfscript>
	
    <h1>Visits Counter: <cfoutput>#reslt#</cfoutput></h1>
    <form method="post" action="">
        <button type="submit">Submit</button>
    </form>
</body>
</html>