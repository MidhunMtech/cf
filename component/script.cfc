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
}