component {

		public string function task14Script(
			required string imgName,
			required string imgDesc,
			required any imgFile) {
				
			local.fileType = "jpeg,png,gif";
			local.maxSize = 1048576;		
			try {
			if (#cgi.content_length# LTE local.maxSize) {
				cffile (
					action = "upload",
					destination = "C:\ColdFusion2021\cfusion\wwwroot\Task\uploads",
					fileField = "imgUpload",
					nameConflict = "makeunique"
				);
				local.result = "success.";
					if (listFindNoCase(local.fileType, cffile.CONTENTSUBTYPE)) {
					queryExecute(
							sql = "INSERT INTO imgDetails (imgName, imgDesc, imgPath)
								VALUES (?, ?, ?)",
							params = [
								{value: arguments.imgName, cfsqltype: "cf_sql_varchar"},
								{value: arguments.imgDesc, cfsqltype: "cf_sql_varchar"},
								{value: cffile.SERVERFILE, cfsqltype: "cf_sql_varchar"}
						],
							options = {datasource: "cfTask"}
					);
					local.result = "success.";
					location (url="task14script_page2.cfm", addtoken="Yes");
				} else {
					local.result = "Invalid file type, Only jpeg, png and gif files are allowed.";
				};
			} else {
			local.result = "File size exceeds maximum limit of 1 MB.";
			};
			} catch(any e) {
				writeDump(var=e)
			}
			return local.result;
		}
		
		
		public query function listPage() {
			local.img = queryExecute(
				"SELECT 
					ID,
					imgName,
					imgDesc,
					imgPath
				FROM
					imgDetails",
				[],
				{datasource = "cftask"}
			);
			
			return local.img
		}
		
		
		public query function detailsPage(){
			local.details = queryExecute(
				"SELECT *
				FROM 
					imgDetails
				WHERE
					ID = ?",
				[{value: #url.id#, cfsqltype: "cf_sql_integer"}],
				{datasource ="cfTask"}
			);
			return local.details;
		}




		public numeric function multiply (
			required numeric num1,
			required numeric num2,
			numeric num3="1",
			numeric num4="1") {
			
			return arguments.num1 * arguments.num2 * arguments.num3 * arguments.num4;
		}
		
		
		
		public string function squarePattern (
			required numeric number) {
				
			local.result = "";
			for (i=1; i <= #arguments.number#; i++) {
				local.num = "#i#";
				for (j=1; j <=#arguments.number#; j++) {
					local.result &= num;
					local.num += 3;
					local.result &= " ";
				}
				local.result &= "<br><br>";
			}
			return local.result;
		}
		
		
		public string function task17Script (
			required any num) {
			
			local.output = "";
			if (isNumeric(arguments.num)) {
				for (i = 1; i <= #arguments.num#; i++) {
					if (#i# MOD 2 EQ 0) {
						local.output &= "<span class='green'>#i#, </span>";
					} else {
						local.output &= "<span class='blue'>#i#, <span>" ;
					}
				}
			} else {
				local.output &= "<p class='blue'>Enter Only Numeric Values</p>"
			}
			
			return local.output;
		}
		
		public numeric function cookie () {
			if (structKeyExists(cookie, "VisitsCounter")) {
				local.cookieValue = Cookie.VisitsCounter + 1;
			} else {
				local.cookieValue = 1;
			}
			Cookie.VisitsCounter = local.cookieValue;
			
			cookieExpiry = createTimeSpan(0,0,1,0);
			cfcookie(name="VisitsCounter", value=local.cookieValue, expires=cookieExpiry);
			
			return local.cookieValue;
		}
		
		public string function task20Script (
			required string mail,
			required string captchaInput,
			required string captchaText) {
			
			param arguments.mail = "";
			param arguments.captchaInput = "";
			param arguments.captchaText = "";  
			local.output = "";
			if (isValid("email", arguments.mail)) {
				if (arguments.captchaInput EQ arguments.captchaText) {
					location(url="second.cfm", addtoken="Yes");
				} else {
					local.output &= "<br><b>INVALID CAPTCHA</b>. Please try again.";
				}
			} else {
				local.output &= "<br><b>INVALID EMAIL</b>. Please try again.";
			}
				
			return local.output;
		}
		
		public string function captcha() {
			local.captchaText = "" ;
			for ( i = 1; i <= 6; i++ ) {
				local.captchaText &= chr(randRange(65,90));
			}
			
		return local.captchaText;
		}
		
		
		
		public string function task21Script (
			required string babyName,
			required string Email,
			required string birthdayWishes,
			required any greetingImage) {
			
			local.sender = "midhun.m@techversantinfotech";
			cffile (action="upload",
				destination="C:\ColdFusion2021\cfusion\wwwroot\Task\uploads\task21",
				fileField="form.greetingImage",
				nameConflict="overwrite"
				);
			local.fileName = #cffile.SERVERFILE#;
			local.filePath = "C:\ColdFusion2021\cfusion\wwwroot\Task\uploads\task21\#local.fileName#";
			
			emailTo = arguments.Email;
			emailFrom = local.sender;
			emailUsername = "Midhun";
			emailPassword = "Tech@123";
			emailPort = 25;
			emailSubject = "Happy Birthday " & arguments.babyName;

			emailBody = "
				<p>Dear " & arguments.babyName & ",</p>
				<p>" & arguments.birthdayWishes & "</p>
				<p>Best Wishes,</p>
			";

			mail = new mail()
				.setTo(emailTo)
				.setFrom(emailFrom)
				.setUsername(emailUsername)
				.setPassword(emailPassword)
				.setPort(emailPort)
				.setSubject(emailSubject)
				.setBody(emailBody);

			if (structKeyExists(local, "local.filePath")) {
				mail.addAttachment(local.filePath);
			}

			mail.send();

			return "Email sent successfully to #arguments.Email#."; 	
		}

		public string function task23Script (
			required string position,
			required string relocate,
			required any datepicker,
			required string portfolio,
			required string resume,
			required string dollars,
			required string cents,
			required string fname,
			required string lname,
			required string emailId,
			required string phone) {
			
			local.res = "Saved successfully";
			local.uploadDir = expandPath("./uploads/task23");
			cffile( 
				action="upload",
				fileField="form.resume",
				nameConflict="makeunique",
				destination="#local.uploadDir#"
				);
			local.resumeName = cffile.SERVERFILE;

			local.task23 = queryExecute(
				"INSERT INTO task23 
					(positions, relocate, datepick, portfolio, resumePath, dollars, cents, fname, lname, emailId, phone)
				VALUES 
					(?,?,?,?,?,?,?,?,?,?,?)",
				[
					{value: arguments.position, cfsqltype: "cf_sql_varchar"},
					{value: arguments.relocate, cfsqltype: "cf_sql_varchar"},
					{value: arguments.datepicker, cfsqltype: "cf_sql_date"},
					{value: arguments.portfolio, cfsqltype: "cf_sql_varchar"},
					{value: local.resumeName, cfsqltype: "cf_sql_varchar"},
					{value: arguments.dollars, cfsqltype: "cf_sql_varchar"},
					{value: arguments.cents, cfsqltype: "cf_sql_varchar"},
					{value: arguments.fname, cfsqltype: "cf_sql_varchar"},
					{value: arguments.lname, cfsqltype: "cf_sql_varchar"},
					{value: arguments.emailId, cfsqltype: "cf_sql_varchar"},
					{value: arguments.phone, cfsqltype: "cf_sql_varchar"}
				],
				{datasource = "cfTask"}
			);
			
		return local.res;

		}
		
		
		public string function task24Script (
			required string firstName,
			required string email
			) {
			
			local.result = "" ;
			local.task24 = queryExecute (
				"SELECT 
					email
				FROM	
					task24",
				[],
				{datasource = "cfTask"}
			)
			
			if (NOT structKeyExists(local.task24, "arguments.email")) {
				local.insertSubscriber = queryExecute(
					"INSERT INTO task24 
						(firstName, email)
					VALUES (?,?)",
					[
						{value: arguments.firstName, cfsqltype: "cf_sql_varchar"},
						{value: arguments.email, cfsqltype: "cf_sql_varchar"}
					],
					{datasource = "cfTask"}
				);
				local.fName = ucase(arguments.firstName);
				local.result = "<p>Subscription successful! Thank you, <b>#local.fName#</b>.</p>";
			} else {
				local.result = "<p>email is already Exists</p>"
			}
			
			return local.result;
		}
		
		
		public any function task27Script (
			required string username,
			required string password ) {
			
			local.errorMessage = "";
			if (arguments.username EQ "admin" AND arguments.password EQ "password"){
				session.logIn = true;
				location(url="task27script_welcome.cfm");
			} else {
				local.errorMessage = "<p style='color: red;' >Invalid username or password. Please try again.</p>"
			}
			return local.errorMessage;
		}
		
		
		
		
		public void function task28ScriptLogin(
			required string username,
			required string pwd) {
		
			local.getUser = queryExecute(
				"SELECT *
				FROM 
					user
				WHERE
					username = ?
					AND pwd = ?",
				[
					{value: arguments.username, cfsqltype: "cf_sql_varchar"},
					{value: arguments.pwd, cfsqltype: "cf_sql_varchar"}
				],
				{datasource = "cfTask"}
			);
			
			if (local.getUser.recordCount EQ 1) {
				session.userid = local.getUser.userId;
				session.username = local.getUser.userName;
				session.role = local.getUser.role;
				location(url="task28script_dash.cfm", addtoken="false");
			} else if (arguments.username EQ "user123" AND arguments.pwd EQ "password") {
				session.userid = "3";
				location(url="task28script_index.cfm");
			} else {
				location(url="task28script_login.cfm?error=1", addtoken="false");
			}
		}
		
		public void function task28ScriptDash() {
			if (NOT structKeyExists(session, "userid")) {
				location(url="task28script_login.cfm");
			}
			if (structKeyExists(url, "logout") AND url.logout EQ "true") {
				location(url="task28script_login.cfm");
			}
		}
		
		public void function task28ScriptAddPage(
			required string pageName,
			required string pageDesc) {
			
			if (NOT structKeyExists(session, "userid")) {
				location(url="task28script_login.cfm");
			}
			
			local.insertPage = queryExecute(
				"INSERT INTO page	
					(pageName, pageDesc)
				VALUES
					(?,?)",
				[
					{value: arguments.pageName, cfsqltype: "cf_sql_varchar"},
					{value: arguments.pageDesc, cfsqltype: "cf_sql_varchar"}
				],
				{datasource = "cfTask"}
			);
			location(url="task28script_dash.cfm", addToken="false");
		}
		
		public void function task28ScriptEdit (
			required string pageName,
			required string pageDesc,
			required string pageId) {
			
			if (NOT structKeyExists(session, "userid")) {
				location(url="task28script_login.cfm");
			}
			
			local.updateTable = queryExecute (
				"UPDATE page
				SET 
					pageName = ?,
					pageDesc = ?
				WHERE 
					pageId = ?",
				[
					{value: arguments.pageName, cfsqltype: "cf_sql_varchar"},
					{value: arguments.pageDesc, cfsqltype: "cf_sql_varchar"},
					{value: arguments.pageId, cfsqltype: "cf_sql_varchar"}
				],
				{datasource = "cfTask"}
			);
			location(url="task28script_dash.cfm");
		}

}
