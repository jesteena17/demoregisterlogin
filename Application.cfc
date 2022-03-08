<cfcomponent output="false">  
    <cfset this.name = "jqlogin">
   	<cfset this.sessionManagement = true />
	<cfset this.sessionTimeout = createTimespan(0,0,30,0) />
  	<cffunction name="onApplicationStart" returntype="boolean" >
<cfreturn true />
	</cffunction>
<cffunction name="onRequestStart" returntype="boolean" >
 <cfreturn true />
</cffunction>
 <!--- Runs when your session starts --->
 <cffunction name="onSessionStart" returnType="void" output="false">
  <cfset session.stLoggedInUser.loggedin = false>
</cffunction>
</cfcomponent>