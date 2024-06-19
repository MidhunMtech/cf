<cfset jsonData = '[{"Name":"saravanan","Age":27,"LOCATION":"dubai"},{"Name":"Ram","Age":26,"LOCATION":"Kovilpatti"}]'>

<cfset data = DeserializeJSON(jsonData)>
<cfdump var="#data#" />