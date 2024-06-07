<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Task 5</title>
		<link rel="stylesheet" type="text/css" href="css/task5.css">
	</head>
	<body>

		<form action="task5script.cfm" method="POST">
			<label for="userDOB"> Your Age: </label>
			<input type="text" id="userDOB" name="userDOB" placeholder="DD-MM-YYYY" required><br><br>
			<label for="motherDOB">Mother's Age: </label>
			<input type="text" id="motherDOB" name="motherDOB" placeholder="DD-MM-YYYY" required><br><br>
			<button type="submit">Submit</button>
		</form>

		<cfif structKeyExists(form, "userDOB") AND structKeyExists(form, "motherDOB") >
			<cfset task5script = createObject("component", "component.task5") />
			<cfset result = task5script.calculateAgesScript(form.userDOB, form.motherDOB) />

			<cfoutput>
				<p>User age is <span>#result.userAge#</span> </p>
				<p>Mother's age is <span>#result.motherAge#</span> </p>
				<p>Age of mother when user was born is <span>#result.motherDeliveryAge#</span> </p>
				<p>Remaining days to User's Birthday is <span>#result.userDayLeft#</span></p>
				<p>Remaining days to Mother's Birthday is <span>#result.motherDayLeft#</span></p>
			</cfoutput>
		</cfif>

	</body>
</html>