var ajaxReq=new XMLHttpRequest();
var username,password,usertype;
var url;
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
    usertype=$("#usertype").val();
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
   
var mydata={username:username,password:password,usertype:usertype};
var request=$.post("LoginControllerServlet",mydata,processresponse);
request.error(handleError);
clear();
}
function processresponse(responseText)
{
    
    
        var resp=responseText;
        var pagename;
        resp=resp.trim();
        if(resp.indexOf("jsessionid")!==-1)
        {
            //alert("inside success");
            $("#loginresult").css("color","green");
            if(usertype==="ADMIN")
                pagename="Options";
            else
                pagename="Store";
            $("#loginresult").html("Login Accepted! Redirecting to the "+pagename+" Page...");
            url=resp;
            setTimeout(redirectuser,5000);
            clear();
        }
        else if(resp==="Error")
        {
            //alert("inside error");
            $("#loginresult").css("color","red");
            $("#loginresult").html("Login Denied...").fadeOut(5000);
            clear();
            
        }
        else
        {
            //alert("inside else:"+resp);
            $("#loginresult").css("color","red");
            $("#loginresult").html("Some error occurred at the server. Try later").fadeOut(5000);
            clear();
            
        }
        
    }
    function handleError(xhr,textStatus)
    {
    
    if(textStatus==='error'){
        $("#loginresult").html("Error is "+xhr.status);
    }
}

function redirectuser()
{
  window.location = url;  
}
function clear()
{
 $("#username").text("");
 $("#password").text("");   
}
