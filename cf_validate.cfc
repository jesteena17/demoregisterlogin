<cfcomponent>
        <cfset request.dsn = "people_data">
      
<cffunction name="checkLogin" access="remote" returnType="string" returnformat="plain" output="false">
     <cfargument name="username" required="true">
    <cfargument name="password" required="true">
    <cfset var returnStg = "">
    
        <cfquery  name="validateUser"  datasource = "#request.dsn#"  result="tmpResult">
            SELECT name,phone FROM people_details WHERE name=<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar" maxlength="255"> 
            AND phone=<cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar" maxlength="4000">
        </cfquery>
         
        <cfif validateUser.RecordCount EQ 1>
            <cfset session.loggedin = true>

            <cfset returnStg = true>
        <cfelse>
            <cfset returnStg = false>
        </cfif>
        
    <cfreturn returnStg>    
</cffunction>
    
</cfcomponent>


		