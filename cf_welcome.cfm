<cfif session.stLoggedInUser.loggedin EQ false >
<cflocation URL="logout.cfm">
</cfif>
<!Doctype html>
<html lang="en">
	<head>
		<cfinclude template="common.cfm" >
		<link href="css/style.css" rel="stylesheet"/>
	</head>
  <body>
  <cfoutput>
		<div id="logout">	
	        <div class="container text-right pt-5">
	            <div id="login-row" class="row justify-content-center align-items-center">
	                <div id="login-column" class="col-md-12">
	                    <div id="login-box" class="col-md-12">
	                       <form class="form-signout">
						   		<span class="text-center text-info">&nbsp;You are in! 
									#session.stLoggedInUser.username#(#session.stLoggedInUser.userrole==0?"Admin":session.stLoggedInUser.userrole==1?"Editor":"User"#)
								</span>
	    						<a href="logout.cfm" id="logoutButton" class="btn btn-sm btn-danger">Logout</a>
	  						</form> 
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div> 
		<cfinvoke component="cf_validate" method="displaydata" returnvariable="result"></cfinvoke>
		<cfloop query="#result#">
			<div class="tab">
				<button class="tablinks" onclick="openCity(event, #pageid#)">#pagename#</button>
			</div>
			<div id="#pageid#" class="tabcontent">
				<h3>#pagename#</h3>
				<p>#pagedescription#</p>
			</div>
		</cfloop>
	</cfoutput>
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