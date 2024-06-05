<!DOCTYPE html>
<html lang = "en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=0.1">
		<title> Task 2</title>
		<link rel="stylesheet" type="text/css" href="css/task1.css">
	</head>
	<body>
		
		<div class="container">
			<form action="task2.cfm" method="POST">
				<label for="numberId">ENTER NUMBER BETWEEN 1-5</label><br><br>
				<input type="number" id="numberId" name="numberInput" min="1" max="5" placeholder="Enter number" required><br><br>
				<button type="submit">Submit</button>
			</form>

			<cfoutput>
            			<cfif structKeyExists(form, "numberInput")>
					<cfset variables.number=form.numberInput>
					<cfswitch expression="#variables.number#">
						<cfcase value="5">
							<p>You entered #variables.number#</p>
							<h3>Very good</h3>
						</cfcase>
						<cfcase value="4">
							<p>You entered #variables.number#</p>
							<h3>Good</h3>
						</cfcase>
						<cfcase value="3">
							<p>You entered #variables.number#</p>
							<h3>Fair</h3>
						</cfcase>
						<cfcase value="1,2">
							<p>You entered #variables.number#</p>
							<h3>Ok</h3>
						</cfcase>
						<cfdefaultcase>
							<h3>PLEASE ENTER NUMBER BETWEEN 1-5</h3>
						</cfdefaultcase>
					</cfswitch>
				</cfif>
			</cfoutput>
		</div>

	</body>
</html>