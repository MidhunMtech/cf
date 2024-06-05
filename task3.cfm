<!DOCTYPE html>
<html lang = "en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=0.1">
		<title> Task 3</title>
		<link rel="stylesheet" type="text/css" href="css/task1.css">
	</head>
	<body>
		
		<div class="container">
			<form action="task3.cfm" method="POST">
				<label for="numberId">ENTER NUMBERS SEPARATED BY COMMAS.</label><br><br>
				<input type="text" id="numberId" name="numberInput" placeholder="Enter number" required><br><br>
				<button type="submit">Submit</button>
			</form>

			<cfif structKeyExists(form, "numberInput")>
				<cfset variables.numbers = ListToArray(form.numberInput)>
				<cfset variables.new = arrayNew(1)>
				<cfloop array="#variables.numbers#" index="i">
					<cfif i MOD 3 EQ 0>
						<cfset arrayAppend(variables.new, i)>
					<cfelse>
						<cfcontinue>
					</cfif>
				</cfloop>
				<cfoutput>
					<h3>#ArrayToList(variables.new)#</h3>
				</cfoutput>
			</cfif>




<!---
			<cfscript>
				if (structKeyExists(form, "numberInput")) {
            				variables.numbers = ListToArray(form.numberInput);
					variables.new = arrayNew(1);
					for (i in variables.numbers) {
						if (i MOD 3 EQ 0) {
							arrayAppend(variables.new, i);
						} else {
							continue;
						}
					}
					writeOutput("<h3>#ArrayToList(variables.new)#</h3>");
				}
			</cfscript>
--->
		</div>

	</body>
</html>