<cftry>
	<cfset task28CFC = createObject("component", "component.taskTag") />
	<cfset getPages = task28CFC.task28Delete() />	
<cfcatch>
	<cfdump var="#cfactch#" />
</cfcatch>
</cftry>

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
                <a href="task28_dash.cfm?pageid=#getPages.pageid#&delete=true">Delete</a>
            </td>
        </tr>
    </cfoutput>
</table>
