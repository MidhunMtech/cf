<!DOCTYPE html>
<html lang = "en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=0.1">
		<title> Task 1</title>
		<link rel="stylesheet" type="text/css" href="css/task1.css">
	</head>
	<body>
		
		<div class="container">
			<form action="task1.cfm" method="POST">
				<label for="numberId">ENTER NUMBER BETWEEN 1-5</label><br><br>
				<input type="number" id="numberId" name="numberInput" min="1" max="5" placeholder="Enter Number" required><br><br>
				<button type="submit">Submit</button>
			</form>

			<cfoutput>
				<cfif structKeyExists(form,"numberInput")>
					<cfset variables.number=form.numberInput>
						<cfif variables.number EQ 5>
							<p>You entered #variables.number#</p>
							<h3>Very good</h3>
						<cfelseif variables.number EQ 4>
							<p>You entered #variables.number#</p>
							<h3>Good</h3>
						<cfelseif variables.number EQ 3>
							<p>You entered #variables.number#</p>
							<h3>Fair</h3>
						<cfelseif variables.number EQ 1 OR variables.number EQ 2>
							<p>You entered #variables.number#</p>
							<h3>Ok</h3>
						<cfelse>
							<h3>PLEASE ENTER NUMBER BETWEEN 1-5</h3>
						</cfif>
				</cfif>
			</cfoutput>
		</div>

	</body>
</html>