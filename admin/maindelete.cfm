<cfinvoke component="admin" method="dltpage" returnvariable="result">
        <cfinvokeargument name="pid" value="#url.die#"/>  
</cfinvoke>
 <cfif result GT 0>  
    <cflocation url="main.cfm">
</cfif>



