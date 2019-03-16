$("document").ready(function()
{
  $("#nextbtn").click(function()
  {
    //dovalidate();
    doTask();
     function dovalidate()
     {
       $("#result").css("display","inline")
       isRegChecked=$("#rbtnReg").is(':checked'); 
       isLogChecked=$("#rbtnLog").is(':checked');  
       var status=true;
       
      if(isRegChecked===false && isLogChecked===false)
      {
          $("#result").text("please select an option first");
           $("#result").css("font-weight","bold");
           $("#result").css("color","red");
           $("#result").fadeOut(5000);
          status=false;
      }
      else
      return status;
     }
     
     function doTask()
     {
        var ans= dovalidate();
        if(ans===false)
        {
            return;
        }
        else if(isRegChecked===true)
        {
          window.location="registration.html" ; 
        }
        else if(isLogChecked===true)
        {
         window.location="login.html" ;    
        }
     }
   

});
});

