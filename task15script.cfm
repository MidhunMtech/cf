<!DOCTYPE html>
<html>
	<head>
		<title>task 15</title>
	</head>
	<body>
		<h2>Using cfinvoke</h2>
		<cfscript>
    			result1 = 0;
    			result2 = 0;
    			result3 = 0;
    			
			byCfInvoke = createObject("component", "component.script");

			result1 = invoke(byCfInvoke, "multiply", {num1=1, num2=2});
			result2 = invoke(byCfInvoke, "multiply", {num1=1, num2=2, num3=3});
			result3 = invoke(byCfInvoke, "multiply", {num1=1, num2=2, num3=3, num4=4});
				
			writeOutput("multiply(1, 2) = #result1# <br>");
			writeOutput("multiply(1, 2, 3) = #result2# <br>");
			writeOutput("multiply(1, 2, 3, 4) = #result3# <br>");

    			writeOutput("<h2>Using createobject</h2>");
			cfObj = createObject("component", "component.script");
    			result4 = cfObj.multiply(1, 2);
    			result5 = cfObj.multiply(1, 2, 3);
    			result6 = cfObj.multiply(1, 2, 3, 4);
		
			writeOutput("multiply(1, 2) = #result4# <br>");
			writeOutput("multiply(1, 2, 3) = #result5# <br>");
			writeOutput("multiply(1, 2, 3, 4) = #result6# <br>");

		</cfscript>
	</body>
</html>