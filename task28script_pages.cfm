<cfscript>
	getPages = queryExecute (
		"SELECT * FROM page",
		[],
		{datasource ="cfTask"}
	);
</cfscript>

<table border="1">
    <tr>
        <th>Page Name</th>
        <th>Edit</th>
		<th>Delete</th>
    </tr>
    <cfoutput query="getPages">
        <tr>
            <td>#getPages.pageName#</td>
            <td>
                <a href="task28script_edit.cfm?pageid=#pageid#">Edit</a>
            </td>
			<td>
				<a href="task28script_delete.cfm?pageid=#pageid#">Delete</a>
			</td>
        </tr>
    </cfoutput>
</table>