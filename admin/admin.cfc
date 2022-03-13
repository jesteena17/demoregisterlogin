<cfcomponent>
    <cffunction name="dltpage" access="remote" returnType="string" returnformat="plain" output="false">
        <cfargument name="pid" required="true">
        <cfquery name = "dltpage" datasource = "mysqldsn" result="deleteresults">
                  delete from  t28pages where pageid=<cfqueryparam value="#arguments.pid#"  cfsqltype="cf_sql_integer">
        </cfquery>
        <cfset getNumberOfRecords = listLen(#deleteresults.RecordCount#)>
        <cfreturn getNumberOfRecords>    
    </cffunction>  
    <cffunction name="updatepage" access="remote" returnType="string" returnformat="plain" output="false">
        <cfargument name="pid" required="true">
        <cfargument name="pname" required="true">
        <cfargument name="pdesc" required="true">
        <cfquery name = "updatepage" datasource = "mysqldsn"  result="myupdateResult">
            update t28pages
            set  pagename= <cfqueryparam value = "#arguments.pname#" cfsqltype = "cf_sql_varchar"/>,
                 pagedescription=    <cfqueryparam value = "#arguments.pdesc#" cfsqltype = "cf_sql_varchar"/>
                 where pageid= <cfqueryparam value = "#arguments.pid#" cfsqltype = "cf_sql_integer" >
          </cfquery>
          <cfset getNumberOfRecords = listLen(#myupdateResult.RecordCount#)> 
        <cfreturn getNumberOfRecords>    
    </cffunction>  
    <cffunction name="addpage" access="remote" returnType="string" returnformat="plain" output="false">
        <cfargument name="pname" required="true">
        <cfargument name="pdesc" required="true">
        <cfquery name = "addpage" datasource = "mysqldsn" result="myaddResult">
            insert into t28pages(pagename,pagedescription) 
            values (
                     <cfqueryparam value = "#arguments.pname#" cfsqltype = "cf_sql_varchar"/>,
                     <cfqueryparam value = "#arguments.pdesc#" cfsqltype = "cf_sql_varchar"/>    
                  ) ;
        </cfquery>
        <cfset getNumberOfRecords = listLen(#myaddResult.generated_key#)>
        <cfreturn getNumberOfRecords>    
    </cffunction> 
    <cffunction name="displaydata" access="remote" returnType="query" output="false">
        <cfargument name="editid" required="true">
        <cfquery name = "getpagebyid" datasource = "mysqldsn" >
            select *  from t28pages where pageid=<cfqueryparam value="#arguments.editid#"  cfsqltype="cf_sql_integer">      
        </cfquery>
        <cfreturn getpagebyid>    
    </cffunction>
    <cffunction name="displayalldata" access="remote" returnType="query" output="false">      
        <cfquery name = "getpages" datasource = "mysqldsn" >
             select * from t28pages order by pageid desc;
        </cfquery>
        <cfreturn getpages>    
    </cffunction>
</cfcomponent>


		 