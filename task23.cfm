<cfinclude template="task23Include.cfm">
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>task 23</title>
		<link rel="stylesheet" type="text/css" href="css/task23.css">
	</head>
	<body>
	<h2>Employment Application</h2>
	<h5 >Infinity Box Inc.</h5>
	<p class="dotted-line"></p>
		<form action="" method="post"  enctype="multipart/form-data">
			<label for="drop">Which position are you applying for? <span class="required">*</span></label><br>
			<select id="drop" name="position">
				<option value=""></option>		
				<cfloop query="positions">
					<cfoutput><option value="#positions.positions#" >#positions.positions#</option></cfoutput>
				</cfloop>
			</select><br><br>
			
			<label for="">Are you willing to relocate? <span class="required">*</span></label><br>
			<input type="radio" name="relocate" id="relocate1" value="Yes" checked>
			<label for="relocate1">Yes</label><br>
			<input type="radio" name="relocate" id="relocate2" value="No">
			<label for="relocate2">No</label><br><br>
			
			<label for="dateId">When can you start? <span class="required">*</span></label><br>
			<input type="date" name="datepicker" id="dateId"><br><br>
			
			<label for="Portfolio">Portfolio Web Site</label><br>
			<input type="text" id="Portfolio" name="Portfolio" value="http://"><br><br>
			
			<label for="resumeId">Attach a Copy of Your Resume</label><br>
			<input type="file" name="resume" id="resumeId"><br>
			<caption>Word or PDF Documents Only</caption><br><br>
			
			
			<label for="">Salary Requirements</label><br> $
				<label for="dollars">Dollars</label>
				<input type="text" id="dollars" name="dollars"> . 
				<label for="cents">Cents</label>
				<input type="text" id="cents" name="cents" ><br>

			<p class="dotted-line"></p>
			
			<p>Your Contact Information</p>
			
			<label for="">Name <span class="required">*</span></label><br>
			<label for="first">first</label>
			<input type="text" id="first" name="fname">
			<label for="cents">last</label>
			<input type="text" id="last" name="lname"><br><br>
			
			<label for="">Email Address <span class="required">*</span></label><br>
			<input type="email" id="emailId" name="emailId"><br><br>
			
			<label for="">Phone <span class="required">*</span></label><br>
			<input type="text" id="phone" name="phone"><br><br>
			
			<input type="submit" name="submit" value="submit"><br><br>
			
			
		</form>
		
		<p>This site is protected by reCAPTCHA Enterprise and the Google <a href="">Privacy Policy</a> and <a href="">Terms of Service apply</a>.</p>
		
		<script src="js/script.js"></script>
	</body>
</html>

<cftry>
	<cfif structKeyExists(form, "submit")>
		<cfset task23CFC = createObject("component", "component.taskTag") />
		<cfset result = task23CFC.task23(form.position, form.relocate, form.datepicker, form.Portfolio, form.resume, form.dollars, form.cents, form.fname, form.lname, form.emailId, form.phone) />
		
		<cfdump var="#result#" />
	</cfif>
<cfcatch><cfdump var="#cfcatch#" /></cfcatch>
</cftry>

