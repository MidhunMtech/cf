<!DOCTYPE html>
<html>
	<head>
    		<title>Task 6</title>
	</head>
	<body>

		<form method="post" action="">
    			<label for="textbox1">Key:</label>
    			<input type="text" id="textbox1" name="textbox1"><br><br>
    
    			<label for="textbox2">Value:</label>
    			<input type="text" id="textbox2" name="textbox2"><br><br>
    
    			<input type="submit" name="submit" value="Submit"><br><br>
		</form>

		<cfif structKeyExists(form, "submit") >
			<cfset task6CFC = createObject("component", "component.taskTag") />
			<cfset result = task6CFC.task6Tag(form.textbox1, form.textbox2) />
		</cfif>