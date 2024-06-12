<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Task 14</title>
	</head>
	<body>
		<form action="" method="post" enctype="multipart/form-data">
			<label for="imgName">Image Name: </label>
			<input type="text" id="imgName" name="imgName" required><br><br>

			<label for="imgDesc">Description: </label>
			<textarea id="imgDesc" name="imgDesc" rows="4" cols="50" required></textarea><br><br>

			<label for="imgUpload">Upload Image: </label>
			<input type="file" id="imgUpload" name="imgUpload" accept="image/jpeg, image/png, image/gif" required><br><br>

			<input type="submit" name="submit" value="Upload">
		</form>

		<cfif structKeyExists(form,"submit")>
			<cfset task14CFC = createObject("component", "component.taskTag") />
			<cfset result = task14CFC.imgValidation(form.imgName, form.imgDesc, form.imgUpload) />

			<cfdump var="#result#" />
		</cfif>

	</body>
</html>