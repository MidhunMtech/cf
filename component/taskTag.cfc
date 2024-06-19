<cfcomponent>
	<cffunction name="task6Tag" returnType="string" access="public">
		<cfargument name="text1" type="string" required="true" />
		<cfargument name="text2" type="string" required="true" />

		<cfset myStruct = structNew() />
		<cfset StructInsert(myStruct, arguments.text1, arguments.text2) />

		<cfdump var="#myStruct#" />
	</cffunction>

	
	<cffunction name="task7Tag" access="public" returnType="struct">
		<cfargument name="text1" type="string" required="true" />
		<cfargument name="text2" type="string" required="true" />

		<cfif NOT structKeyExists(session, "myStruct") >
			<cfset session.myStruct = structNew() />
		</cfif>
		<cfset session.myStruct[text1] = text2 />

		<cfreturn session.myStruct />
	</cffunction>


	<cffunction name="task9Tag" access="public" returnType="struct" >
		<cfargument name="text1" type="string" required="true" />
		<cfargument name="text2" type="string" required="true" />

		<cfif NOT structKeyExists(session, "myStruct")>
			<cfset session.myStruct = structNew() />
		</cfif>

		<cfif structKeyExists(session.myStruct, arguments.text1) >
			<p>Key already exists!</p><br/>
		<cfelse>
			<cfset session.myStruct[arguments.text1] = arguments.text2 />
		</cfif>
		
		<cfreturn session.myStruct />
	</cffunction>

	<cffunction name="oldImgValid" returnType="string" access="public" >
		<cfargument name="imgName" type="string" required="true" />
		<cfargument name="imgDesc" type="string" required="true" />
		<cfargument name="imgFile" type="any" required="true" />
		<cfset local.uploadDir = expandPath("./uploads") />
		<cffile action="upload" destination="#local.uploadDir#" fileField="imgFile" nameConflict="makeunique" >
		
		<cfset fileType = "png,jpeg,gif" />
		<cfset local.result = "" />
		<cfset local.file = [] />

		<cfif listFindNoCase(fileType, cffile.CONTENTSUBTYPE) >
			<cfif cffile.FILESIZE LTE 1000000>
				<cfset local.result = "Image uploaded successfully." />
			<cfelse>
				<cfset local.result = "File size exceeds maximum limit of 1 MB." />
			</cfif> 
		<cfelse>
			<cfset local.result = "Invalid file type, Only jpeg, png and gif files are allowed." />
		</cfif>
		 
		<cfreturn local.result >
	</cffunction>

	<cffunction name="imgValidation" access="public" returnType="string" >
		<cfargument name="imgName" type="string" required="true" />
		<cfargument name="imgDesc" type="string" required="true" />
		<cfargument name="imgFile" type="any" required="true" />
	
		<cfset local.allowedFileType = "jpeg,png,gif" />
		<cfset local.maxFileSize = 1048576 />

		<cfif cgi.CONTENT_LENGTH LTE local.maxFileSize>
			<cffile action="upload" destination="C:\ColdFusion2021\cfusion\wwwroot\Task\uploads" fileField="imgUpload" nameConflict="makeunique">

			<cfif listFindNoCase(local.allowedFileType, cffile.CONTENTSUBTYPE) >
				<!---<cfoutput>
					<p>Image uploaded successfully.</p>
					<img src="uploads/#cffile.SERVERFILE#">
					<p>Image name: #arugments.imgName#</p>
					<p>description: #arguments.imgDesc#</p>
				</cfoutput>--->
				<cfquery datasource="cfTask" name="form">
           				INSERT INTO imgDetails (imgName, imgDesc, imgPath)
           				VALUES (
               					<cfqueryparam value="#arguments.imgName#" cfsqltype="cf_sql_varchar">,
                				<cfqueryparam value="#arguments.imgDesc#" cfsqltype="cf_sql_varchar">,
               					<cfqueryparam value="#cffile.SERVERFILE#" cfsqltype="cf_sql_varchar">
           				)	
				</cfquery>
					
				<cflocation url="task14_page2.cfm" addtoken="Yes">
			<cfelse>
					<cfset local.result = "Invalid file type, Only jpeg, png and gif files are allowed." />
			</cfif>

		<cfelse>
				<cfset local.result = "File size exceeds maximum limit of 1 MB." />
		</cfif>

		<cfreturn local.result>
	</cffunction>

	<cffunction name="listPage" access="public" returnType="query">
		<cfquery datasource="cfTask" name="img">
			SELECT
				ID,
				imgName,
				imgDesc,
				imgPath
			FROM
				imgDetails
		</cfquery>
	
		<cfreturn img>
	</cffunction>

	<cffunction name="detailsPage" access="public" returnType="query">
		<cfquery datasource="cfTask" name="details">
    			SELECT * 
			FROM imgDetails 
			WHERE id = <cfqueryparam value="#url.id#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>

		<cfreturn details>
	</cffunction>

	<cffunction name="multiply" returnType="numeric" access="public">
		<cfargument name="num1" type="numeric" required="true">
		<cfargument name="num2" type="numeric" required="true">
		<cfargument name="num3" type="numeric" required="false" default="1">
		<cfargument name="num4" type="numeric" required="false" default="1">

		<cfreturn arguments.num1 * arguments.num2 * arguments.num3 * arguments.num4 />
	</cffunction>
	
	<cffunction name="squarePattern" returnType="string" access="public">
		<cfargument name="number" type="numeric" required="true">

		<cfset local.result = "" />
		<cfloop from="1" to="#arguments.number#" index="i">
			<cfset local.num = "#i#" />
			
			<cfloop from="1" to="#arguments.number#" index="j">
				<cfset local.result &= local.num />
				<cfset local.result &= " " />
				<cfset local.num += 3 />
			</cfloop>
			<cfset local.result &= "<br><br>" />
		</cfloop>
		<cfreturn local.result />
	</cffunction>
	
	
	<cffunction name="task17" type="string" access="public">
		<cfargument name="num" type="any" required="true">
			<cfset local.output = "" />
			<cfif isNumeric(arguments.num)>
				<cfloop from="1" to="#arguments.num#" index="i">
					<cfif #i# MOD 2 EQ 0>
						<cfset local.output &= "<span class='green' >#i#, </span>" />
					<cfelse>
						<cfset local.output &= "<span class='blue' >#i#, </span>" />
					</cfif>
				</cfloop>
			<cfelse>
				<cfset local.output &= "<p class='blue'>PLEASE ENTER A NUMBER!</p>" />
			</cfif>
		<cfreturn local.output />
	</cffunction>
	
	
	<cffunction name="task19Cookie" returnType="numeric" access="public">
		<cfif structKeyExists(cookie,"VisitsCounter")>
			<cfset local.cookieValue = cookie.VisitsCounter + 1 />
		<cfelse>
			<cfset local.cookieValue = 1 />
		</cfif>
		
		<cfset cookie.VisitsCounter = local.cookieValue />
		<cfset cookieExpiry = createTimeSpan(0, 0, 1, 0) />
		<cfcookie name="VisitsCounter" value="#local.cookieValue#" expires="#cookieExpiry#" />
		
		<cfreturn local.cookieValue />
	</cffunction>
	
	
	<cffunction name="task20" access="public" returnType="string" hint="Email and Captcha Validation">
		<cfargument name="mail" type="string" required="true">
		<cfargument name="captchaInput" type="string" required="true">
		<cfargument name="captchaText" type="string" required="true">
		
		<cfset local.output = "" />
		<cfif isValid("email", arguments.mail) >
			<cfif arguments.captchaInput EQ arguments.captchaText >
				<cflocation url="second.cfm" addtoken="Yes">
			<cfelse>
				<cfset local.output &= "<br><b>INVALID CAPTCHA</b>. Please try again." />
			</cfif>
		<cfelse>
			<cfset local.output &= "<br><b>INVALID EMAIL</b>. Please try again." />
		</cfif>
		
		<cfreturn local.output />
	</cffunction>
	
	<cffunction name="captcha" returnType="string" access="public">
		<cfset local.captchaText = "" />
		<cfloop from="1" to="6" index="i">
			<cfset local.captchaText &= chr(randRange(65,90)) />
		</cfloop>
		
		<cfreturn local.captchaText />
	</cffunction>
	
	
	<cffunction name="task21" returnType="string" access="public">
		<cfargument name="babyName" type="string" required="true" />
		<cfargument name="Email" type="string" required="true" />
		<cfargument name="birthdayWishes" type="string" required="true" />
		<cfargument name="greetingImage" type="any" required="true" />
		
		<cfset local.sender = "midhun.m@techversantinfotech.com" />
		<cffile action="upload" destination="C:\ColdFusion2021\cfusion\wwwroot\Task\uploads\task21" fileField="form.greetingImage" nameConflict="overwrite" >
		<cfset local.fileName = #cffile.SERVERFILE# />
		<cfset local.filePath = "C:\ColdFusion2021\cfusion\wwwroot\Task\uploads\task21\#local.fileName#" />
		<cfmail to="#arguments.Email#" from="#local.sender#" username="Midhun" password="Tech@123" port="25" subject="Happy Birthday #arguments.babyName#">
			<p>Dear #arguments.babyName#,</p>
			<p>#arguments.birthdayWishes#</p>
			<p>Best Wishes,</p>
			<cfmailparam file="#local.filePath#" />
		</cfmail>
		
		<cfreturn "Email sent successfully to #arguments.Email#." />
	</cffunction>
	
	
	<cffunction name="task23" returnType="string" access="public">
		<cfargument name="position" type="string" required="true">
		<cfargument name="relocate" type="string" required="true">
		<cfargument name="datepicker" type="any" required="true">
		<cfargument name="portfolio" type="string" required="true">
		<cfargument name="resume" type="string" required="true">
		<cfargument name="dollars" type="string" required="true">
		<cfargument name="cents" type="string" required="true">
		<cfargument name="fname" type="string" required="true">
		<cfargument name="lname" type="string" required="true">
		<cfargument name="emailId" type="string" required="true">
		<cfargument name="phone" type="string" required="true">
		
		<cfset local.uploadDir = expandPath("./uploads/task23") />
		<cffile action="upload" fileField="form.resume" nameConflict="makeunique" destination="#local.uploadDir#" />
		<cfset local.resumeName = cffile.SERVERFILE />
		<cfquery datasource="cfTask" name="local.task23">
			INSERT INTO task23 (positions, relocate, datepick, portfolio, resumePath, dollars, cents, fname, lname, emailId, phone)
			VALUES (
				<cfqueryparam value="#arguments.position#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.relocate#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.datepicker#" cfsqltype="cf_sql_date">,
				<cfqueryparam value="#arguments.Portfolio#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#local.resumeName#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.dollars#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.cents#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.fname#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.lname#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.emailId#" cfsqltype="cf_sql_varchar">,
				<cfqueryparam value="#arguments.phone#" cfsqltype="cf_sql_varchar">
			)
		</cfquery>
		
		<cfreturn "Saved successfully" />
	</cffunction>

</cfcomponent>


























