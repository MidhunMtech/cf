<cfcomponent>

	<cffunction name="calculateAges" returnType="struct" access="public" output="false" >
		<cfargument name="userDOB" type="string" required="true">
		<cfargument name="motherDOB" type="string" required="true">

		<cfset local.result = {} />

		<cfset local.userDOB = parseDateTime(arguments.userDOB, "dd-mm-yyyy") />
		<cfset local.motherDOB = parseDateTime(arguments.motherDOB, "dd-mm-yyyy") />
		<cfset today = now() />

		<cfset local.result.userAge = dateDiff("yyyy", local.userDOB, today) />
		<cfset local.result.userAgeMonth = dateDiff("m", local.userDOB, today) % 12 />
		<cfset local.result.motherAge = dateDiff("yyyy", local.motherDOB, today) />
		<cfset local.result.motherAgeMonth = dateDiff("m", local.motherDOB, today) % 12 />
		<cfset local.result.motherDeliveryAge = local.result.motherAge - local.result.userAge />

        	<cfset local.result.userDayLeft = daysLeft(local.userDOB) />
        	<cfset local.result.motherDayLeft = daysLeft(local.motherDOB) />

		<cfreturn local.result />
	</cffunction>
	
    	<cffunction name="daysLeft" returntype="numeric" access="private">
        	<cfargument name="dob" type="date" required="true">
        
        	<cfset local.nextBirthYear = year(now())>
        	<cfif month(now()) GT month(arguments.dob) OR (month(now()) EQ month(arguments.dob) AND day(now()) GT day(arguments.dob))>
            		<cfset local.nextBirthYear = year(now()) + 1>
        	</cfif>
        	<cfset local.nextBirthDay = createDate(local.nextBirthYear, month(arguments.dob), day(arguments.dob))>
        
        	<cfreturn dateDiff("d", now(), local.nextBirthDay)>
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




		public struct function keyValue(
			required string text1,
			required string text2) {
			
			local.myStruct = {};
			
			StructInsert(local.myStruct, text1, text2)
			
			return local.myStruct;
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