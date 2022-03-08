<CFIF session.stLoggedInUser.loggedin EQ false >
<cflocation URL="logout.cfm">
</CFIF>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <title>Document</title>     
        <cfinclude template="common.cfm" >
    </head>
    <body>
        <div class="container text-right pt-5">
	            <div id="login-row" class="row justify-content-center align-items-center">
	                <div id="login-column" class="col-md-12">
	                    <div id="login-box" class="col-md-12">
	                       <form class="form-signout">
								<!---<cfdump var="#session.loggedin#" >--->
	    						<sapn class="text-center text-info"><i class="fa fa-hand-o-right" aria-hidden="true"></i>&nbsp;You are in! <cfoutput>
							#session.stLoggedInUser.username#(#session.stLoggedInUser.userrole==0?"Admin":session.stLoggedInUser.userrole==1?"Editor":"User"#)
								</cfoutput></span>
	    						<!---<button class="btn btn-lg btn-danger btn-block" type="button" id="logoutbutton"><a href="index.cfm">Logout</button></a>--->
	    					<a href="logout.cfm" id="logoutButton" class="btn btn-sm btn-danger">Logout</a>
	  						</form> 
	                    </div>
	                </div>
	            </div>
	    </div>
        <cfset  request.dsn="mysqldsn"/>
        <cfset  request.un="root"/>
        <cfset  request.pw="Password@123"/>
        <cfset  employeeid=""/>
        <cfset  employeename=""/>
        <cfset  jobname=""/>
        <cfif IsDefined("url.tide")>
                <cfset  editid="#URL.tide#"/>
            <cfif IsNumeric(editid)>
                <cfquery name = "getemployeebyid" datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#">
                    select *  from t28pages where pageid=<cfqueryparam value="#editid#"  cfsqltype="cf_sql_integer">      
                </cfquery>
                   <!--- <cfdump var = "#getemployeebyid#">  --->
                <cfset  employeeid="#getemployeebyid.pageid#"/>
                <cfset  employeename="#getemployeebyid.pagename#"/>
                <cfset  jobname="#getemployeebyid.pagedescription#"/>
                
            </cfif>
        </cfif>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="text-center">Page</h1>
                    <table align="center">
                        <form method="POST" action="mainaction.cfm" enctype="multipart/form-data">
                            <tr>
                                <th>Page Name</th>
                                <td><input class="form-control" type="text" name="name" value="<cfoutput> #employeename# </cfoutput>" required/></td>
                            </tr>
                            <tr>
                                <th>Page Description</th>
                                <td><input type="text" class="form-control" name="description" value="<cfoutput> #jobname# </cfoutput>" required/></td>
                            </tr>
                           <tr>
                                <td class="pt-3" align="center" colspan="2">
                                    <input type="submit" name="registerbtn" value="SAVE" class="btn btn-success"/>
                                    <cfif IsDefined("url.tide") and IsNumeric(editid)>
                                        <input type="hidden" name="updatedata" value="<cfoutput>#editid#</cfoutput>"/>
                                    </cfif>
                                </td>
                            </tr>
                        </form>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <cfquery name = "getemployees" datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#">
                         select * from t28pages order by pageid desc;
                    </cfquery>
                    <h1 class="text-center mt-5">Page Details</h1>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <table align="center" class="table table-bordered">
                                    <thead>
                                        <tr class="text-center">
                                            <th>Page#ID</th>
                                            <th>Page Name</th>
                                            <th>Page Description</th>
                                            <th colspan="3">ACTION</th>
                                        </tr>
                                    </thead>
                                    <cfloop QUERY="getemployees">
                                        <cfoutput>
                                            <tr>
                                                <td>#getemployees.pageid#</td>
                                                <td>#getemployees.pagename#</td>
                                               
                                                <td>#getemployees.pagedescription#</td>
                                                  <td>
                                                    <cfset  key="editid"/>
                                                    <a class="btn btn-warning" href="#cgi.script_name#?tide=#getemployees.pageid#">
                                                        <i class="fa fa-edit"></i>
                                                    </a>
                                                </td>
                                                <td>
                                                <a class="btn btn-danger" style="color:white" href="maindelete.cfm?die=#getemployees.pageid#">
                                                        <i class="fa fa-trash"></i>
                                                    </a>
                                                </td>
                                                 </tr>
                                        </cfoutput>
                                    </cfloop>                                   
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </body>
</html>