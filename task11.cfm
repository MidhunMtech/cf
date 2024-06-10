<cffunction name="multiply" access="public" returnType="numeric" >
	<cfargument name="num1" type="numeric" required="true" />
	<cfargument name="num2" type="numeric" required="true" />
	<cfargument name="num3" type="numeric" default="1" />
	<cfargument name="num4" type="numeric" default="1" />

	<cfreturn num1 * num2 * num3 * num4 />
</cffunction>

<cfset result = multiply(1,2) />
<p>1x2 = <cfdump var = "#result#" /></p>
<cfset result = multiply(1,2,3) />
<p>1x2x3 = <cfdump var = "#result#" /></p>
<cfset result = multiply(1,2,3,4) />
<p>1x2x3x4 = <cfdump var = "#result#" /></p>
