<cfscript>

	try{
		positions =  queryExecute(
			"SELECT 
				ID, 
				positions
			FROM
				positions",
			[],
			{datasource="cfTask"}
		);
			writeDump(var=positions);
	} catch (any e) {
		writeDump(var=e);
	}
	
</cfscript>
