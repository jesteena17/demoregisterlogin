<cfif session.stLoggedInUser.loggedin EQ false >
<cflocation URL="logout.cfm">
</cfif>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <title>admin dashboard</title>     
        <cfinclude template="common.cfm" >
    </head>
    <body>
        <cfoutput>
            <div class="container text-right pt-5">
                    <div id="login-row" class="row justify-content-center align-items-center">
                        <div id="login-column" class="col-md-12">
                            <div id="login-box" class="col-md-12">
                            <form class="form-signout">			
                                    <sapn class="text-center text-info"><i class="fa fa-hand-o-right" aria-hidden="true"></i>&nbsp;You are in! 
                                            #session.stLoggedInUser.username#(#session.stLoggedInUser.userrole==0?"Admin":session.stLoggedInUser.userrole==1?"Editor":"User"#)
                                    </span>	    					
                                    <a href="logout.cfm" id="logoutButton" class="btn btn-sm btn-danger">Logout</a>
                                </form> 
                            </div>
                        </div>
                    </div>
            </div>
            <cfset  pageid=""/>
            <cfset  pagename=""/>
            <cfset  description=""/>
            <cfif IsDefined("url.tide")>
                    <cfset  editid="#URL.tide#"/>
                    <cfif IsNumeric(editid)>
                        <cfinvoke component="admin" method="displaydata" returnvariable="result">
                            <cfinvokeargument name="editid" value="#editid#"/> 
                        </cfinvoke>
                        <cfset  pageid="#result.pageid#"/>
                        <cfset  pagename="#result.pagename#"/>
                        <cfset  description="#result.pagedescription#"/> 
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
                                    <td><input class="form-control" type="text" name="name" value="#pagename#" required/></td>
                                </tr>
                                <tr>
                                    <th>Page Description</th>
                                    <td><input type="text" class="form-control" name="description" value="#description#" required/></td>
                                </tr>
                            <tr>
                                    <td class="pt-3" align="center" colspan="2">
                                        <input type="submit" name="registerbtn" value="SAVE" class="btn btn-success"/>
                                        <cfif IsDefined("url.tide") and IsNumeric(editid)>
                                            <input type="hidden" name="updatedata" value="#editid#"/>
                                        </cfif>
                                    </td>
                                </tr>
                            </form>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <cfinvoke component="admin" method="displayalldata" returnvariable="getemployees"></cfinvoke>
                        <h1 class="text-center mt-5">Page Details</h1>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <table align="center" class="table table-bordered">
                                        <thead>
                                            <tr class="text-center">
                                                <th>PageID</th>
                                                <th>Page Name</th>
                                                <th>Page Description</th>
                                                <th colspan="3">ACTION</th>
                                            </tr>
                                        </thead>
                                        <cfloop query="getemployees">
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
                                        </cfloop>                                   
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </cfoutput>
    </body>
</html>