<cfscript>

	public numeric function multiply (
		required numeric no1,
		required numeric no2,
		numeric no3=1,
		numeric no4=1) {
		
		return no1 * no2 * no3 * no4;
	};

	res = multiply(1, 2);
	writeDump(res);
	writeOutput("<br>");
	res = multiply(1, 2, 3);
	writeDump(res);
	writeOutput("<br>");
	res = multiply(1, 2, 3, 4);
	writeDump(res);

</cfscript>