<cfscript>
	deleteData = queryExecute(
		"DELETE FROM page
		WHERE 
			pageId = ?",
		[{value: url.pageid, cfsqltype: "cf_sql_integer"}],
		{datasource = "cfTask"}
	);
	location("task28script_dash.cfm");
</cfscript>