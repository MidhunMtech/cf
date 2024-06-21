<cfquery name="getPage" datasource="cfTask">
    SELECT * 
	FROM 
		page 
	WHERE 
		pageid = <cfqueryparam value="#url.pageid#" cfsqltype="cf_sql_integer">
</cfquery>