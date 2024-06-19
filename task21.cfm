<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Task 21</title>
	</head>
	<body>
		<h1>Send Birthday Wishes</h1>
		<form action="" method="post" enctype="multipart/form-data">
			<label for="nameId">Birthday Baby Name: </label>
			<input type="text" id="nameId" name="babyName"><br><br>
			
			<label for="emailId">His Email Id: </label>
			<input type="email" id="emailId" name="Email"><br><br>
			
			<label for="birthdayWishes">Birthday Wishes: </label>
			<textarea id="birthdayWishes" name="birthdayWishes" rows="4" cols="50"></textarea><br><br>
			
			<label for="greetingImage">Greeting Image: </label>
			<input type="file" id="greetingImage" name="greetingImage"><br><br>
			
			<input type="submit" name="submit"><br><br>
		</form>
	</body>
</html>
<cftry>
	<cfif structKeyExists(form, "submit")>
		<cfset task21CFC = createObject("component", "component.taskTag") />
		<cfset result = task21CFC.task21(form.babyName, form.Email, form.birthdayWishes, form.greetingImage) />
		
		<cfdump var="#result#" />
	</cfif>
<cfcatch><cfdump var="#cfcatch#"></cfdump></cfcatch>
</cftry>