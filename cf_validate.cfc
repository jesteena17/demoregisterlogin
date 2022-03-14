<cfcomponent>
    <cffunction name="checkLogin" access="remote" returnType="string" returnformat="plain" output="false">
        <cfargument name="username" required="true">
        <cfargument name="password" required="true">
        <cfset var isUserLoggedIn = "">
            <cfquery  name="validateUser"   result="tmpResult">
                SELECT * FROM t28user WHERE username=<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar" maxlength="255"> 
                AND password=<cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar" maxlength="4000">
            </cfquery>
            <cfif validateUser.RecordCount EQ 1>      
             <cfset session.stLoggedInUser = {'loggedin'=true,'username' = validateUser.username, 'userID' = validateUser.userid,'userRole'=validateUser.userrole} />     
                <cfset isUserLoggedIn = true>
            <cfelse>
                <cfset isUserLoggedIn = false>
            </cfif>
        <cfreturn isUserLoggedIn>    
    </cffunction>   
     <cffunction name="displaydata" access="remote" returnType="query" output="false">
            <cfquery  name="getdata"     >
                select * from t28pages;
            </cfquery>
            <cfreturn getdata>    
        </cffunction>
</cfcomponent>


		