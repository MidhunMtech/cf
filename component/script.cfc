component {

		public string function test(
		required string imgName,
			required string imgDesc,
			required any imgFile) {
				
			local.fileType = "jpeg,png,gif";
			local.maxSize = 1048576;		
			
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
					location (url="task14_page2script.cfm", addtoken="Yes");
				} else {
					local.result = "Invalid file type, Only jpeg, png and gif files are allowed.";
				};
			} else {
			local.result = "File size exceeds maximum limit of 1 MB.";
			};
			return local.result;
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
		
}