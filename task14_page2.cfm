<!DOCTYPE html>
<html>
	<head>
		<title>List Page</title>
		<link rel="stylesheet" type="text/css" href="css/task14.css">
	</head>
	<body>

		<cfset listPageCFC = createObject("component", "component.taskTag") />
		<cfset result = listPageCFC.listPage() />
		
		<cfif isQuery(result) AND result.recordCount GT 0>	
			<cfoutput query="result">
				<div>
					<a href="task14_page3.cfm?id=#ID#">
						<img src="uploads/#imgPath#" width="40" height="40">
						<p>#imgName#</p>
					</a>	
				</div>
			</cfoutput>
		<cfelse>
			<p>No images found.</p>
		</cfif>

	</body>
</html>

