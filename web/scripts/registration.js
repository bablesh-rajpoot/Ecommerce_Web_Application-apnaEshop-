var ajaxReq=new XMLHttpRequest();
var username,password;
$(document).ready(function()
{
    $("#loginbtn").click(function()
    {
        connect();
    });
});
function validate()
{
    username=$("#username").val();
    password=$("#password").val();
    var status=true;
    if(username==="")
    {
      $("#sp1").text("Username Required...").css("color","red").fadeOut(5000);
        status= false;
    }
    if(password==="")
    {
       $("#sp2").text("Password Required...").css("color","red").fadeOut(5000);
        status= false;
    }
   return status;
   
}
function connect()
{
    //alert("connect called");
    if(!validate())
    {
       
        return ;
      
    }
   
var mydata={username:username,password:password};
var request=$.post("RegistrationControllerServlet",mydata,processresponse);
request.error(handleError);
clear();
}
function processresponse(responseText)
{
    
    
        var resp=responseText;
        resp=resp.trim();
        if(resp.indexOf("uap")!==-1)
        {
            //alert("inside success");
            $("#regresult").html("Sorry! the username is already present!<br> Try again Another Username").css("color","red").fadeOut(10000);
            clear();
        }
        else if(resp==="success")
        {
            //alert("inside error");
            $("#regresult").html("<b>Registration Successful ! You can now <a href='login.html' style='color:green'>Login</b></a>");
            //setTimeout(redirectuser,10000);
            clear();
            
        }
        else
        {
            $("#loginresult").css("color","red");
            $("#loginresult").html("Registration Failed !. Try later...");
            clear();
            
        }
        
    }
    function handleError(xhr,textStatus)
    {
    
    if(textStatus==='error'){
        $("#regresult").html("Error is "+xhr.status);
    }
}

function clear()
{
 $("#username").text("");
 $("#password").text("");   
}
