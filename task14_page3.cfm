<!DOCTYPE html>
<html>
	<head>
		<title>Details</title>
	</head>
	<body>
	
		<cfset task14CFC = createObject("component","component.taskTag") />
		<cfset result = task14CFC.detailsPage() />

		<cfoutput>
			<img src="uploads/#result.imgPath#">
        		<h2>Name: #result.imgName#</h2>
        		<h3>Description: #result.imgDesc#</h3>
		</cfoutput>

	</body>
</html>