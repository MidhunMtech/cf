<cfinclude template="task22Include.cfm">
<html>
<head>
    <title>Task 22</title>
</head>
<body>
    <table border="1">
        <thead>
            <tr>
                <th>Name</th>
                <th>Age</th>
                <th>Location</th>
            </tr>
        </thead>
        <tbody>
		<cfoutput>
            <cfloop array="#data#" index="item">
                <tr>
                    <td>#item.Name#</td>
                    <td>#item.Age#</td>
                    <td>#item.LOCATION#</td>
                </tr>
            </cfloop>
		</cfoutput>
        </tbody>
    </table>
</body>
</html>