<cfcomponent>
	<cfscript>
		public string function test(
			required string imgName,
			required string imgDesc,
			required any imgFile) {
				
			local.fileType = "jpeg,png,gif";
			local.maxSize = 1048576;

			return local.maxSize;
		};







	public struct function imgValidationScript(
		required string imgName,
		required string imgDesc,
		required any imgFile) {

		local.fileType = "jpeg,png,gif";
		local.maxSize = 1048576;

		writeDump(local.maxSize) abort;
		if (#cgi.content_length# LTE local.maxSize) {
			cffile (
				action = "upload",
				destination = "C:\ColdFusion2021\cfusion\wwwroot\Task\uploads",
				fileField = "imgUpload",
				nameConflict = "makeunique" 
			);
			
			local.result = "success.";
			/*if (listFindNoCase(local.fileType, cffile.CONTENTSUBTYPE)) {
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
				//location (url="task14_page2script.cfm", addtoken="Yes");
			} else {
				local.result = "Invalid file type, Only jpeg, png and gif files are allowed.";
			};*/
		} else {
			local.result = "File size exceeds maximum limit of 1 MB.";
		};

		return local.maxSize;
	};


	public query listPage() {
		img = queryExecute (
			"SELECT 
				ID,
				imgName,
				imgDesc,
				imgPath
			FROM
				imgDetails",
			[],
			{"datasource=cfTask"}
		);

		return img;
	}
	


	</cfscript>


	<cffunction name="multiply" returnType="numeric" access="public">
		<cfargument name="num1" type="numeric" required="true">
		<cfargument name="num2" type="numeric" required="true">
		<cfargument name="num3" type="numeric" required="false" default="1">
		<cfargument name="num4" type="numeric" required="false" default="1">

		<cfreturn arguments.num1 * arguments.num2 * arguments.num3 * arguments.num4 />
	</cffunction>

</cfcomponent>