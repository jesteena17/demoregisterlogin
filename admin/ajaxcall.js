  	
  	
var _fnDisable = function() {
	
	var submitBtn  = document.getElementById('submitButton');
    var ele 	   = document.getElementsByTagName('input'); 
    // LOOP THROUGH EACH ELEMENT.
    for (i = 0; i < ele.length; i++) {

        // CHECK THE ELEMENT TYPE.
        if (ele[i].type == 'text' && ele[i].value == '') {
            submitBtn.disabled = true;    
            return false;
        }
        else {
            submitBtn.disabled = false;   
        }
    }
    
}; 
	


var _fnSubmitViaAjax = function(event){	

   
    $('form').off("submit").submit(function(event) {

		 var formData = $('#login-form').serialize();
        console.log(JSON.stringify(formData));
       
        $.ajax({
            type        : 'POST', 
            url         : "cf_validate.cfc?method=checkLogin", 
            data: formData,
            success: function (response) {
                

                console.log(response);
            	if(response == "true"){
            		
            		$("body").load("cf_welcome.cfm", function(){
                        document.title = "Home";
                        
            		});
            	}   
            	else{
            	
            		$("#messageBox").html("Oops! The entered Username or Password does not match with the database.");
            	};       	
            },
            
            error : function(response){
            	console.log(JSON.stringify(response));
            }
        });
        
       
        event.preventDefault();
    });
}; 



var _fnLogOutViaAjax = function(event){	

      $("body").load("index.cfm", function(){
			document.title = "Home";
		});
		
      
        event.preventDefault();
};
