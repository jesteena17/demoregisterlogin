<CFIF session.stLoggedInUser.loggedin EQ false >
<cflocation URL="logout.cfm">
</CFIF>
<!Doctype html>
<html lang="en">
				<head>

					<cfinclude template="common.cfm" >
					<link href="css/style.css" rel="stylesheet"/>
				</head>
  <body>
		<div id="logout">	
	        <div class="container text-right pt-5">
	            <div id="login-row" class="row justify-content-center align-items-center">
	                <div id="login-column" class="col-md-12">
	                    <div id="login-box" class="col-md-12">
	                       <form class="form-signout">
								<!---<cfdump var="#session.loggedin#" >--->
	    						<span class="text-center text-info"><i class="fa fa-hand-o-right" aria-hidden="true"></i>&nbsp;You are in! <cfoutput>
							#session.stLoggedInUser.username#(#session.stLoggedInUser.userrole==0?"Admin":session.stLoggedInUser.userrole==1?"Editor":"User"#)
								</cfoutput></span>
	    						<!---<button class="btn btn-lg btn-danger btn-block" type="button" id="logoutbutton"><a href="index.cfm">Logout</button></a>--->
	    						<a href="logout.cfm" id="logoutButton" class="btn btn-sm btn-danger">Logout</a>
	  						</form> 
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div> <!---Logout--->
    	<cfset request.dsn = "mysqldsn">
		<cfquery datasource="#request.dsn#" name="empSalary"> 
		select * from t28pages;
		</cfquery> 
			<cfloop query="#empSalary#">
				<cfoutput >
					<div class="tab">
						<button class="tablinks" onclick="openCity(event, #pageid#)">#pagename#</button>
					</div>
					<div id="#pageid#" class="tabcontent">
						<h3>#pagename#</h3>
						<p>#pagedescription#</p>
					</div>
				</cfoutput>
			</cfloop>
			<script>
			function openCity(evt, cityName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(" active", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " active";
			}
			</script>
	</body>
</html>