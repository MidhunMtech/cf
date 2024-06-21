<cftry>
	<cfif structKeyExists(url, "error") AND url.error EQ "1" >
		<p style='color: red;'>Invalid USERNAME or PASSWORD, please try again.</p>
	</cfif>
<cfcatch><cfdump var="#cfcatch#"/></cfcatch>
</cftry>