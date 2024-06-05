<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Task 4</title>
		<link rel="stylesheet" type="text/css" href="css/task4.css">
	</head>
	<body>

		<cfset task4CFC = createObject("component", "component.task4") />
		<cfset datesInfo = task4CFC.dateDetails() />

		<cfoutput>
			<div class="content-1">
				<h1>Dates information</h1>
				<p class="day"> Today's date : <span>#dateFormat(datesInfo.today,"dd-mm-yyyy")#</span> </p>
				<p class="day"> Current Month (Numeric): <span>#datesInfo.currentMonth#</span> </p>
				<p class="day"> Current Month (Words) : <span>#datesInfo.currentMonthInWords#</span> </p>
				<p class="day"> Last Friday : <span>#dateFormat(datesInfo.lastFriday, "dd-mm-yyyy")#</span> </p>
				<p class="day"> Last day of the Month : <span>#dateFormat(datesInfo.lastDayOfMonth, "dd-mm-yyyy")# [#dateFormat(datesInfo.lastDayOfMonth,"dddd")#]</span> </p>
			</div>
			<div class="content-2">
				<h1>Last 5 Days</h1>
				<cfloop array="#datesInfo.last5Days#" index="i">
					<cfset Days = dayOfWeekAsString(dayOfWeek(i)) />
					<p class=#lcase(Days)#>#dateFormat(i, "dd-mmm-yyyy")# - #ucase(Days)#</p>
				</cfloop>
			</div>
		</cfoutput>	

	</body>
</html>