<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Task 20 Sc</title>
	</head>
	<body>
		<cfscript>
			cap = createObject("component", "component.script");
			captchaText = cap.captcha(); 
			cfimage(action="captcha", text="#captchaText#", width="200", height="50",fontSize="24", fonts="Arial,Helvetica,sans-serif", difficulty="medium", name="captchaImage");
		</cfscript>

		<form action="" method="post">
			<label for="mailId">Enter Email: </label>
			<input type="text" id="mailId" name="mail" value=""><br><br>
			
			<cfimage action="writeToBrowser" source="#captchaImage#"><br>
			
			<label for="captchaInputId">Enter The Captcha: </label>
			<input type="text" id="captchaInputId" name="captchaInput" value=""><br>
			
			<input type="hidden" name="captcha" value="<cfoutput>#captchaText#</cfoutput>"><br>
			
			<input type="submit" value="Submit" name="submit">
		</form>
		
		<cfscript>
			if (structKeyExists(form, "submit")) {
				task20CFC = createObject("component", "component.script");
				result = task20CFC.task20Script(form.mail, form.captchaInput, form.captcha);
				
				writeOutput(result);
			}
		</cfscript>
	
	</body>
</html>