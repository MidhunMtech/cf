<cfcomponent>

	<cffunction name="task12SQL" returnType="query" access="public">
		<cfargument name="num" type="numeric" required="true">


		<cfquery datasource="cfTask" name="local.person">
			SELECT * 
			FROM person
		</cfquery>
		<cfdump var="#local.person#">

		<cfquery name="local.nthRow" datasource="cfTask">
    			SELECT 
				firstname,
				lastname
    			FROM (
        			SELECT 
					firstname, 
					lastname,
					ROW_NUMBER() OVER () AS RowNum
        			FROM person
    				) AS NumberedRows
    			WHERE 
				RowNum = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.num#">
		</cfquery>

		<cfreturn local.nthRow>

	</cffunction>

	<cffunction name="task13" returnType="string" access="public">
		<cfargument name="word" type="string" required="true" />

		<cfset sentence = "the quick brown fox jumps over the lazy dog" />
		<cfset arrayWords = ListToArray(sentence, " ") />
		<cfset num = 0 />
		<cfloop array="#arrayWords#" index="i">
			<cfif trim(i) EQ arguments.word >
				<cfset num = num + 1 />
			</cfif>
		</cfloop>
		<cfif num GT 0 >
			<cfset result= "<p>Found the keyword <b>'#arguments.word#'</b> <b>#num#</b> times - 'the quick brown fox jumps over the lazy dog'</p>" />
		<cfelse>
			<cfset result= "<p>The keyword <b>'#arguments.word#'</b> was not found in the sentence try another word</p>" />
		</cfif>

		<cfreturn result />

	</cffunction>


	<cffunction name="task18" returnType="query" access="public">
		<cfset myQuery = QueryNew("ID, Name, email","Integer, Varchar, Varchar") />

		<cfset QueryAddRow(myQuery, 3) />

		<cfset QuerySetCell(myQuery, "ID", 1, 1) />
		<cfset QuerySetCell(myQuery, "Name", "Midhun M", 1) />
		<cfset QuerySetCell(myQuery, "email", "midhun@gmail.com", 1) />

		<cfset QuerySetCell(myQuery, "ID", 2, 2) />
		<cfset QuerySetCell(myQuery, "Name", "Ajay", 2) />
		<cfset QuerySetCell(myQuery, "email", "ajay@gmail.com", 2) />

		<cfset QuerySetCell(myQuery, "ID", 3, 3) />
		<cfset QuerySetCell(myQuery, "Name", "prajwal", 3) />
		<cfset QuerySetCell(myQuery, "email", "prajwal@gmail.com", 3) />
		
		<cfreturn myQuery>
	</cffunction>

	<cfscript>
		public query function task12Script(number) {

			local.person = queryExecute (
				"SELECT * FROM person",
				[],
				{datasource = "cfTask"}
			);

			writeDump(local.person);

			local.nthRow = queryExecute (
				"SELECT firstname, lastname
				FROM ( 
					SELECT firstname, lastname, row_number() over() as RowNum
					FROM person 
					) AS NumberedRow
				WHERE RowNum = ?", 
				[arguments.number], 
				{datasource='cfTask'}		
			);

			return local.nthRow;
		}

		
		public string function task13Script(word) {
			
			var sentence = "the quick brown fox jumps over the lazy dog";
			var arrayWords = ListToArray(sentence, " ");
			var num = 0;

			for (var i in arrayWords) {
				if( i EQ arguments.word) {
					num += 1;
				}
			}

			if (num GT 0) {
				result= "<p>Found the keyword <b>'#arguments.word#'</b> <b>#num#</b> times - 'the quick brown fox jumps over the lazy dog'</p>"
			} else {
				result= "<p>The keyword <b>'#arguments.word#'</b> was not found in the sentence try another word</p>"
			}

			return result;
		}
		
		public query function task18Script() {
		
			myQuery = QueryNew("ID, Name, email", "Integer, Varchar, Varchar");
			
			QueryAddRow(myQuery, 3);
			
			QuerySetCell(myQuery, "ID", 1, 1);
			QuerySetCell(myQuery, "Name", "ColdFusion", 1);
			QuerySetCell(myQuery, "email", "coldfusion@gmail.com", 1);
			
			QuerySetCell(myQuery, "ID", 2, 2);
			QuerySetCell(myQuery, "Name", "React", 2);
			QuerySetCell(myQuery, "email", "react@gmail.com", 2);
			
			QuerySetCell(myQuery, "ID", 3, 3);
			QuerySetCell(myQuery, "Name", "Python", 3);
			QuerySetCell(myQuery, "email", "python@gmail.com", 3);
			
			return myQuery;
		}

	</cfscript>

</cfcomponent>