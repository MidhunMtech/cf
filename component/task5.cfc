<cfcomponent>

	<cffunction name="calculateAges" returnType="struct" access="public" output="false" >
		<cfargument name="userDOB" type="string" required="true">
		<cfargument name="motherDOB" type="string" required="true">

		<cfset result = {} />

		<cfset userDOB = parseDateTime(arguments.userDOB, "dd-mm-yyyy") />
		<cfset motherDOB = parseDateTime(arguments.motherDOB, "dd-mm-yyyy") />
		<cfset today = now() />

		<cfset result.userAge = dateDiff("yyyy", userDOB, today) />
		<cfset result.userAgeMonth = dateDiff("m", userDOB, today) % 12 />
		<cfset result.motherAge = dateDiff("yyyy", motherDOB, today) />
		<cfset result.motherAgeMonth = dateDiff("m", motherDOB, today) % 12 />
		<cfset result.motherDeliveryAge = result.motherAge - result.userAge />

        	<cfset result.userDayLeft = daysLeft(userDOB) />
        	<cfset result.motherDayLeft = daysLeft(motherDOB) />

		<cfreturn result />
	</cffunction>
	
    	<cffunction name="daysLeft" returntype="numeric" access="private">
        	<cfargument name="dob" type="date" required="true">
        
        	<cfset nextBirthYear = year(now())>
        	<cfif month(now()) GT month(arguments.dob) OR (month(now()) EQ month(arguments.dob) AND day(now()) GT day(arguments.dob))>
            		<cfset nextBirthYear = year(now()) + 1>
        	</cfif>
        	<cfset nextBirthDay = createDate(nextBirthYear, month(arguments.dob), day(arguments.dob))>
        
        	<cfreturn dateDiff("d", now(), nextBirthDay)>
    	</cffunction>

</cfcomponent>