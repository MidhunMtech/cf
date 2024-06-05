<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Task 4</title>
		<link rel="stylesheet" type="text/css" href="css/task4.css">
	</head>
	<body>

		<cfscript>
			Task4CFC = createObject("component", "component.task4");
			datesInfoScript = Task4CFC.scriptDateDetails();
		</cfscript>
		<cfoutput>
			<div class = "content-1">
				<h1>Date Informations</h1>
				<p>Today's Date: <span>#dateFormat(datesInfoScript.today,"dd-mmm-yyyy")#</span></p>
				<p>Current Month (Numeric): <span>#datesInfoScript.currentMonth#</span></p>
				<p>Current Month (Words): <span>#datesInfoScript.currentMonthInWords#</span></p>
				<p>Last Friday: <span>#dateFormat(datesInfoScript.lastFriday,"dd-mmm-yyyy")#</span></p>
				<p>Last Day of the Month: <span>#dateFormat(datesInfoScript.lastDayOfMonth, "dd-mmm-yyyy")#</span></p>
			</div>
			<div class="content-2">
				<h1>Last 5 Days</h1>
				<cfscript>
					for (i in #datesInfoScript.last5Days#) {
						Days = dayOfWeekAsString(dayOfWeek(i));
						writeOutput("<p class=#lcase(Days)#>#dateFormat(i, "dd-mmm-yyyy")# - #ucase(Days)#</p>");
					}
				</cfscript>
			</div>
		</cfoutput>
			
	</body>
</html>