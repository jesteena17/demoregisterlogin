<cfset  request.dsn="mysqldsn">
<cfset request.un="root">
<cfset request.pw="Password@123">
<cfif (cgi.request_method IS "post") AND (structKeyExists(form, "registerbtn"))> 
    <cfif IsDefined("form.updatedata")>
            <cfquery name = "updateemployee" datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#" result="myupdateResult">
            update t28pages
            set  pagename= <cfqueryparam value = "#form.name#" cfsqltype = "cf_sql_varchar"/>,
            pagedescription=    <cfqueryparam value = "#form.description#" cfsqltype = "cf_sql_varchar"/>
            where pageid= <cfqueryparam value = "#form.updatedata#" cfsqltype = "cf_sql_integer" >
          </cfquery>
          <cfset getNumberOfRecords = listLen(#myupdateResult.RecordCount#)> 
        <cfif getNumberOfRecords GT 0>
          <cflocation url="main.cfm">
        </cfif>
    <cfelse>
          <cfquery name = "addemployee" datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#" result="myaddResult">
            insert into t28pages(pagename,pagedescription) 
            values (
            
            <cfqueryparam value = "#form.name#" cfsqltype = "cf_sql_varchar"/>,
            <cfqueryparam value = "#form.description#" cfsqltype = "cf_sql_varchar"/>    
                  ) 
        </cfquery>
        <cfset getNumberOfRecords = listLen(#myaddResult.generated_key#)>
        <cfif getNumberOfRecords GT 0>
            <cflocation url="main.cfm">
        </cfif>
    </cfif>
</cfif>