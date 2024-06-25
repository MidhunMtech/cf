<cftry>
	<cfif structKeyExists(url, "pageid") >
		<cfset task28CFC = createObject("component", "component.taskTag") />
		<cfset getPage = task28CFC.task28PageDetails() />
	</cfif>
<cfcatch><cfdump var="#cfcatch#" abort/></cfcatch>
</cftry>
<!DOCTYPE html>
<html>
	<head>
		<title>Edit Page</title>
	</head>
	<body>
		<form action="" method="post">
			<input type="hidden" name="pageid" value="<cfoutput>#getPage.pageid#</cfoutput>">
			Page Name: <input type="text" name="pageName" value="<cfoutput>#getPage.pageName#</cfoutput>" required><br>
			Page Description: <textarea name="pageDesc"  required><cfoutput>#getPage.pageDesc#</cfoutput></textarea><br><br>
			<input type="submit" name="submit" value="Save Changes">
		</form>	
	</body>
</html>
<cftry>
	<cfif structKeyExists(form, "submit") >
		<cfset task28CFC = createObject("component", "component.taskTag") />
		<cfset result = task28CFC.task28Edit(form.pageName, form.pageDesc, form.pageid) />
		<cfdump var="#result#" />
	</cfif>
<cfcatch><cfdump var="#cfcatch#" abort/></cfcatch>
</cftry>
