<!DOCTYPE html>
<html>
	<head>
		<title>task 15</title>
	</head>
	<body>
		<h2>Using cfinvoke</h2>
    		<cfset result1 = 0>
    		<cfset result2 = 0>
    		<cfset result3 = 0>
    
    		<cfinvoke component="component.taskTag" method="multiply" num1="1" num2="2" returnvariable="result1">
    		<cfinvoke component="component.taskTag" method="multiply" num1="1" num2="2" num3="3" returnvariable="result2">
    		<cfinvoke component="component.taskTag" method="multiply" num1="1" num2="2" num3="3" num4="4" returnvariable="result3">

    		<cfoutput>
    			<p>multiply(1, 2) = #result1#</p>
    			<p>multiply(1, 2, 3) = #result2#</p>
    			<p>multiply(1, 2, 3, 4) = #result3#</p>
		</cfoutput>

    		<h2>Using cfobject</h2>
    		<cfobject component="component.taskTag" name="mathObj">
    		<cfset result4 = mathObj.multiply(1, 2)>
    		<cfset result5 = mathObj.multiply(1, 2, 3)>
    		<cfset result6 = mathObj.multiply(1, 2, 3, 4)>
    
		<cfoutput>
    			<p>multiply(1, 2) = #result4#</p>
    			<p>multiply(1, 2, 3) = #result5#</p>
    			<p>multiply(1, 2, 3, 4) = #result6#</p>
		</cfoutput>

    		<h2>Using createobject</h2>
    		<cfset mathObject = createObject("component", "component.taskTag")>
		<cfset result7 = mathObj.multiply(1, 2)>
    		<cfset result8 = mathObj.multiply(1, 2, 3)>
    		<cfset result9 = mathObj.multiply(1, 2, 3, 4)>
    
		<cfoutput>
    			<p>multiply(1, 2) = #result7#</p>
    			<p>multiply(1, 2, 3) = #result8#</p>
    			<p>multiply(1, 2, 3, 4) = #result9#</p>
		</cfoutput>
	</body>
</html>