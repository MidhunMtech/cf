<cfquery name="getPages" datasource="cfTask">
	SELECT * FROM page
</cfquery>	

<table border="1">
    <tr>
        <th>Page Name</th>
        <th>Actions</th>
    </tr>
    <cfoutput query="getPages">
        <tr>
            <td>#getPages.pageName#</td>
            <td>
                <a href="task28_edit.cfm?pageid=#pageid#">Edit</a>
                <a href="task28_delete.cfm?pageid=#pageid#">Delete</a>
            </td>
        </tr>
    </cfoutput>
</table>