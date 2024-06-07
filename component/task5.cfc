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


	<cfscript>
		public struct function calculateAgesScript (
			required string userDOB,
			required string motherDOB ) {
				
			result = {};
			userDOB = parseDateTime(arguments.userDOB, "dd-mm-yyy");
			motherDOB = parseDateTime(arguments.motherDOB, "dd-mm-yyy");
			today = now();
			
			result.userAge = dateDiff("yyyy", userDOB, today);
			result.motherAge = dateDiff("yyyy", motherDOB, today);
			result.motherDeliveryAge = result.motherAge - result.userAge;

			result.userDayLeft = daysLeftScript(userDOB);
			result.motherDayLeft = daysLeftScript(motherDOB);

			return result;
		}
		private numeric function daysLeftScript (
				required date dob) {
			
			nextBirthYear = year(now());
			if (month(now()) GT month(dob) OR (month(now()) EQ month(dob) AND day(now()) GT day(dob))) {
				nextBirthYear = year(now()) + 1;
			}
			nextBirthDay = createDate(nextBirthYear, month(dob), day(dob));

			return dateDiff("d", now(), nextBirthDay);
		}




		public string function keyValue(
			required string text1,
			required string text2) {
			
			myStruct = {};
			
			StructInsert(myStruct, text1, text2)
			
			writeDump(var = myStruct);
		};

	


		public struct function task7(
			required string text1,
			required string text2) 
		{
			if (!structKeyExists(session, "myStruct")) {
    				session.myStruct = structNew();
			}
			session.myStruct[text1] = text2;

			return session.myStruct;	
		};	




		public struct function task9(
			required string text1,
			required string text2)
		{
			if(!structKeyExists(session, "myStruct")) {
				session.myStruct = {};
			}
			
			if(structKeyExists(session.myStruct, text1)) {
				writeOutput("Key already exists! <br>");
			} else {
				session.myStruct[text1] = text2;
			}

			return session.myStruct;
		};



		public struct function task10(
			required string text1,
			required string text2) 
		{
			if (!structKeyExists(session, "myStruct")) {
    				session.myStruct = {};
				//session.myStruct = structNew("linked");
			}
			session.myStruct[text1] = text2;
			
			return session.myStruct;
		};

	</cfscript>

</cfcomponent>