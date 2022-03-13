<cfif (cgi.request_method IS "post") AND (structKeyExists(form, "registerbtn"))> 
    <cfif IsDefined("form.updatedata")>
          <cfinvoke component="admin" method="updatepage" returnvariable="result">
              <cfinvokeargument name="pname" value="#form.name#"/>  
              <cfinvokeargument name="pdesc" value="#form.description#"/>  
              <cfinvokeargument name="pid" value="#form.updatedata#"/>  
          </cfinvoke>
          <cfif result GT 0>
            <cflocation url="main.cfm">
          </cfif>
    <cfelse>
        <cfinvoke component="admin" method="addpage" returnvariable="result">
             <cfinvokeargument name="pname" value="#form.name#"/>  
             <cfinvokeargument name="pdesc" value="#form.description#"/>  
        </cfinvoke>
        <cfif result GT 0>
            <cflocation url="main.cfm">
        </cfif>
    </cfif>
</cfif>