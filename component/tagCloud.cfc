<cfcomponent>
	<cffunction name="task25" returnType="struct" access="public">
		<cfargument name="text" type="string" required="true" />
		
		<cfset local.wordArray = [] />
		<cfset local.result = structNew() />	
		<cfset local.wordArray = ListToArray(arguments.text, " ") />
		<cfset local.result.words = wordArray />
		
		<cfquery name="local.wordsTable" datasource="cfTask">
			SELECT
				words
			FROM
				task25_tag
		</cfquery>
		
		<cfloop array="#local.wordArray#" index="i" >
			<!--- Check if the word 'i' exists in local.wordsTable --->
			<cfquery name="checkWord" datasource="cfTask">
				SELECT 1
				FROM task25_tag
				WHERE words = <cfqueryparam value="#i#" cfsqltype="cf_sql_varchar">
			</cfquery>
			
			<!--- If the word doesn't exist, insert it into task25_tag --->
			<cfif checkWord.recordCount EQ 0>
				<cfquery name="local.insert" datasource="cfTask">
					INSERT INTO task25_tag (words)
					VALUES (<cfqueryparam value="#i#" cfsqltype="cf_sql_varchar">)
				</cfquery>
			</cfif>
		</cfloop>
	
		<cfreturn result />
	</cffunction>
	
	<cffunction name="task25B" returnType="string" access="public">
		<cfargument name="text" type="string" required="true" />
		
		<cfset local.result = "" />
		<cfset local.wordArray = ListToArray(arguments.text, " ") />
		<cfloop array="#local.wordArray#" index="i">
			<cfquery name="local.insert" datasource="cfTask">
				INSERT INTO task25_task2
					(words)
				VALUES(
					<cfqueryparam value="#i#" cfsqltype="cf_sql_varchar">
				)
			</cfquery>
		</cfloop>
		<cfquery name="local.table" datasource="cfTask">
			SELECT 
				words
			FROM
				task25_task2
		</cfquery>
		
		<cfset local.wordsArray = [] />
		<cfset local.uniqueWord = [] />
		<cfset local.myStruct = {} />
		
		<cfloop query="local.table">
			<cfset ArrayAppend(local.wordsArray, local.table.words) />
		</cfloop>
		
		<cfloop array="#local.wordsArray#" index="wordOne">
			<cfset count = 0 />
			<cfloop array="#local.wordsArray#" index="wordTwo">
				<cfif #wordOne# EQ #wordTwo# >
					<cfset count += 1 />
				</cfif>
			</cfloop>
			<cfif NOT ArrayContains(local.uniqueWord, #wordOne#) AND Len(#wordOne#) GTE 3>
				<cfset ArrayAppend(local.uniqueWord, #wordOne#) />
				<cfset local.result &= "<p>- #wordOne# (#count#)<br></p>" />
				<cfset local.myStruct["#wordOne#"] = #count# />
			</cfif>
		</cfloop>
		
		<cfreturn local.result />
	
	</cffunction>
	
	
		<cffunction name="task25C" returnType="string" access="public">
		<cfargument name="text" type="string" required="true" />
		
		<cfset local.result = "" />
		<cfset local.wordArray = ListToArray(arguments.text, " ") />
		<cfloop array="#local.wordArray#" index="i">
			<cfquery name="local.insert" datasource="cfTask">
				INSERT INTO task25_task2
					(words)
				VALUES(
					<cfqueryparam value="#i#" cfsqltype="cf_sql_varchar">
				)
			</cfquery>
		</cfloop>
		<cfquery name="local.table" datasource="cfTask">
			SELECT 
				words
			FROM
				task25_task2
		</cfquery>
		
		<cfset local.wordsArray = [] />
		<cfset local.uniqueWord = [] />
		<cfset local.myStruct = {} />
		
		<cfloop query="local.table">
			<cfset ArrayAppend(local.wordsArray, local.table.words) />
		</cfloop>
		
		<cfloop array="#local.wordsArray#" index="wordOne">
			<cfset count = 0 />
			<cfloop array="#local.wordsArray#" index="wordTwo">
				<cfif #wordOne# EQ #wordTwo# >
					<cfset count += 1 />
				</cfif>
			</cfloop>
			<cfif NOT ArrayContains(local.uniqueWord, #wordOne#) AND Len(#wordOne#) GTE 3>
				<cfset ArrayAppend(local.uniqueWord, #wordOne#) />
				<cfset fontSize = 16 + #count# />
				<cfif #count# MOD 2 EQ 0 >
					<cfset color = "green" />
				<cfelse>
					<cfset color = "red" />
				</cfif>
				<cfset local.result &= "<p style='font-size:#fontSize#px; color: #color#;'>- #wordOne# (#count#)<br></p>" />
				<cfset local.myStruct["#wordOne#"] = #count# />
			</cfif>
		</cfloop>
		
		<cfreturn local.result />
	
	</cffunction>
	
	
	<cffunction name="task26" returnType="any" access="public">
		<cfargument name="file" type="any" required="true" />
		<cfset local.result = "" />
		<!-- Read the uploaded file -->
		<cffile action="read" file="#arguments.file#" variable="fileContent">

		<!-- Process the text to extract individual words -->
		<cfset fileContent = rereplace(fileContent, "[^a-zA-Z0-9\s]", "", "all")>      <!---reg exp--->
		<cfset local.wordArray = listToArray(fileContent, " ")>
		
		<cfloop array="#local.wordArray#" index="i">
			<cfquery name="local.insert" datasource="cfTask">
				INSERT INTO task26
					(words)
				VALUES(
					<cfqueryparam value="#i#" cfsqltype="cf_sql_varchar">
				)
			</cfquery>
		</cfloop>
		<cfquery name="local.table" datasource="cfTask">
			SELECT 
				words
			FROM
				task26
		</cfquery>
		
		<cfset local.wordsArray = [] />
		<cfset local.uniqueWord = [] />
		<cfset local.myStruct = {} />
		
		<cfloop query="local.table">
			<cfset ArrayAppend(local.wordsArray, local.table.words) />
		</cfloop>
		
		<cfloop array="#local.wordsArray#" index="wordOne">
			<cfset count = 0 />
			<cfloop array="#local.wordsArray#" index="wordTwo">
				<cfif #wordOne# EQ #wordTwo# >
					<cfset count += 1 />
				</cfif>
			</cfloop>
			<cfif NOT ArrayContains(local.uniqueWord, #wordOne#) AND Len(#wordOne#) GTE 3>
				<cfset ArrayAppend(local.uniqueWord, #wordOne#) />
				<cfset fontSize = 16 + #count# />
				<cfif #count# MOD 2 EQ 0 >
					<cfset color = "green" />
				<cfelse>
					<cfset color = "red" />
				</cfif>
				<cfset local.result &= "<p style='font-size:#fontSize#px; color: #color#;'>- #wordOne# (#count#)<br></p>" />
				<cfset local.myStruct["#wordOne#"] = #count# />
			</cfif>
		</cfloop>
		
		<cfreturn local.result />
	
	</cffunction>
</cfcomponent>