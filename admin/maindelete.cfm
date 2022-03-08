
<cfset  request.dsn="mysqldsn">
<cfset request.un="root">
<cfset request.pw="Password@123">


<cfquery name = "dltEmployee" datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#" result="deleteresults">
    delete from  t28pages where pageid=<cfqueryparam value="#URL.die#"  cfsqltype="cf_sql_integer">
    
    </cfquery>
     <cfset getNumberOfRecords = listLen(#deleteresults.RecordCount#)>
 <cfif getNumberOfRecords GT 0>
    
  <cflocation url="main.cfm">
</cfif>



