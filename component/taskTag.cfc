<cfcomponent>
	<cffunction name="task6Tag" returnType="string" access="public">
		<cfargument name="text1" type="string" required="true" />
		<cfargument name="text2" type="string" required="true" />

		<cfset myStruct = structNew() />
		<cfset StructInsert(myStruct, arguments.text1, arguments.text2) />

		<cfdump var="#myStruct#" />
	</cffunction>

	
	<cffunction name="task7Tag" access="public" returnType="struct">
		<cfargument name="text1" type="string" required="true" />
		<cfargument name="text2" type="string" required="true" />

		<cfif NOT structKeyExists(session, "myStruct") >
			<cfset session.myStruct = structNew() />
		</cfif>
		<cfset session.myStruct[text1] = text2 />

		<cfreturn session.myStruct />
	</cffunction>


	<cffunction name="task9Tag" access="public" returnType="struct" >
		<cfargument name="text1" type="string" required="true" />
		<cfargument name="text2" type="string" required="true" />

		<cfif NOT structKeyExists(session, "myStruct")>
			<cfset session.myStruct = structNew() />
		</cfif>

		<cfif structKeyExists(session.myStruct, arguments.text1) >
			<p>Key already exists!</p><br />
		<cfelse>
			<cfset session.myStruct[arguments.text1] = arguments.text2 />
		</cfif>
		
		<cfreturn session.myStruct />
	</cffunction>
</cfcomponent>