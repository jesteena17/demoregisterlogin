<!doctype html>
<html lang="en">
				<head>
					<cfinclude template="common.cfm" >
					<style>
			body {font-family: Arial;}

			/* Style the tab */
			.tab {
			overflow: hidden;
			border: 1px solid #ccc;
			background-color: #f1f1f1;
			}

			/* Style the buttons inside the tab */
			.tab button {
			background-color: inherit;
			float: left;
			border: none;
			outline: none;
			cursor: pointer;
			padding: 14px 16px;
			transition: 0.3s;
			font-size: 17px;
			}

			/* Change background color of buttons on hover */
			.tab button:hover {
			background-color: #ddd;
			}

			/* Create an active/current tablink class */
			.tab button.active {
			background-color: #ccc;
			}

			/* Style the tab content */
			.tabcontent {
			display: none;
			padding: 6px 12px;
			border: 1px solid #ccc;
			border-top: none;
			}
			</style>
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
	    						<input type="submit" name="logoutButton" id="logoutButton" class="btn btn-sm btn-danger" onclick="_fnLogOutViaAjax(event)" value="Logout" >
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