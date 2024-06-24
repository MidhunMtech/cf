<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Task 24</title>
		<script src="js/jquery.min.js"></script>
		<script src="js/task24.js"></script>
	</head>
	<body>
	
		<form action="" method="post">
			<label for="firstName">First Name:</label>
			<input type="text" id="firstName" name="firstName" required><br><br>

			<label for="email">Email ID:</label>
			<input type="email" id="email" name="email" required>
			<button type="button" id="checkEmailButton" name="checked">Check</button><br><br>

			<button type="submit" id="submitButton" name="submit" disabled>Submit</button>
		</form>
		
	</body>
</html>

<cfscript>
	try {
		if (structKeyExists(form, "submit")) {
			task24CFC = createObject("component", "component.script");
			result = task24CFC.task24Script(form.firstName, form.email);
			
			writeOutput(result);
		}
	} catch(any e) {
		writedump(var=e);
	}
</cfscript>