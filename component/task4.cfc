<cfcomponent>
	<cffunction name="dateDetails" returnType="struct" access="public" output="false" hint="This function for CF task 4" >
		<cfset var datesInfo = StructNew() />

		<cfset datesInfo.today = now() />
		<cfset datesInfo.currentMonth = month(datesInfo.today) />
		<cfset datesInfo.currentMonthInWords = dateFormat(datesInfo.today, "mmmm") />
		<cfset datesInfo.lastFriday = dateAdd("d", -(dayOfWeek(datesInfo.today)+1) % 7, datesInfo.today) />
		<cfset datesInfo.firstDayOfNextMonth = createDate(year(datesInfo.today), month(datesInfo.today) + 1, 1) />
		<cfset datesInfo.lastDayOfMonth = dateAdd("d", -1, datesInfo.firstDayOfNextMonth) />

		<cfset datesInfo.last5Days = arrayNew(1) />
		<cfloop from="1" to="5" index="i">
			<cfset arrayAppend(datesInfo.last5Days, dateAdd("d", -i, datesInfo.today)) />
		</cfloop>
		
		<cfreturn datesInfo />
	</cffunction>

	<cfscript>
		public struct function scriptDateDetails() {
			var datesInfoScript = {};

			datesInfoScript.today = now();
			datesInfoScript.currentMonth = month(datesInfoScript.today);
			datesInfoScript.currentMonthInWords = dateFormat(datesInfoScript.today, "mmmm");
			datesInfoScript.lastFriday = dateAdd("d", -(dayOfWeek(datesInfoScript.today) + 1) % 7, datesInfoScript.today);
			datesInfoScript.firstDayOfNextMonth = createDate(year(datesInfoScript.today), month(datesInfoScript.today) + 1, 1);
			datesInfoScript.lastDayOfMonth = dateAdd("d", -1, datesInfoScript.firstDayOfNextMonth);

			datesInfoScript.last5Days = [];
			for (i=1; i<=5; i++) {
				arrayAppend(datesInfoScript.last5Days, dateAdd("d", -i, datesInfoScript.today));
			}
			
			return datesInfoScript;
		}			
	
	</cfscript>
</cfcomponent>