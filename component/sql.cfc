<cfcomponent>

	<cffunction name="task12SQL" returnType="query" access="public">
		<cfargument name="num" type="numeric" required="true">


		<cfquery datasource="cfTask" name="person">
			SELECT * 
			FROM person
		</cfquery>
		<cfdump var="#person#">

		<cfquery name="nthRow" datasource="cfTask">
    			SELECT 
				firstname, lastname
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

		<cfreturn nthRow>

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


	<cfscript>
		public query function task12Script(number) {

			person = queryExecute (
				"SELECT * FROM person",
				[],
				{datasource = "cfTask"}
			);

			writeDump(person);

			nthRow = queryExecute (
				"SELECT firstname, lastname
				FROM ( 
					SELECT firstname, lastname, row_number() over() as RowNum
					FROM person 
					) AS NumberedRow
				WHERE RowNum = ?", 
				[arguments.number], 
				{datasource='cfTask'}		
			);

			return nthRow;
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

	</cfscript>

</cfcomponent>