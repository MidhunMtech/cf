<cfscript>
	try {
		if (structKeyExists(url, "error") AND url.error EQ "1") {
			writeOutput("<p style='color: red;'>Invalid USERNAME or PASSWORD, please try again.</p>")
		}
	} catch (any e) {
		writeDump(var=e)
	}
</cfscript>