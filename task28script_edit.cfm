<cfscript>
	try{
		if(structKeyExists(form, "submit")) {
			task28CFC = createObject("component","component.script");
			result = task28CFC.task28ScriptEdit(form.pageName, form.pageDesc, form.pageid);
		}
	} catch(any e) {
		writeDump(var=e);
	}
</cfscript>

<cfinclude template="task28_editTable.cfm" />

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