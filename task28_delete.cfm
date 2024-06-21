<cfquery datasource="cfTask">
    DELETE FROM page 
	WHERE 
		pageid = <cfqueryparam value="#url.pageid#" cfsqltype="cf_sql_integer">
</cfquery>
<cflocation url="task28_dash.cfm">
