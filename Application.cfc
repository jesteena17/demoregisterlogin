<cfcomponent output="false">
    
    <cfset this.name = "jqlogin">
    <cfset this.sessionManagement = true>
        
    <!--- Run before the request is processed --->
    <cffunction name="onRequestStart" returnType="boolean" output="false">
        <cfargument name="thePage" type="string" required="true">
        <cfset var page = listLast(arguments.thePage,"/")>
    
        <cfif not listFindNoCase("index.cfm,cf_validate.cfc",page)>        
            <cfif  session.stLoggedInUser.loggedin is false>
                <cflocation url="index.cfm" addToken="false">
            </cfif>
        </cfif>
        <cfreturn true>
    </cffunction>
    
    <!--- Runs when your session starts --->
    <cffunction name="onSessionStart" returnType="void" output="false">
        <cfset session.stLoggedInUser.loggedin = false>
    </cffunction>

</cfcomponent>