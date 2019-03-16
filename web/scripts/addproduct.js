 var pname,ptype,pprice,pdesc,pimage;
 $(document).ready(function()
{
    $("#addbtn").click(function()
    {
        connect();
    });
});
function validate()
{
    pname=$("#pname").val();
    ptype=$("#ptype").val();
    pprice=$("#pprice").val();
    pdesc=$("#pdesc").val();
    pimage=$("#piamge").val();
    var status=true;
    if(pname==="")
    {
      $("#sp1").text("Product Name Required...").css("color","red").fadeOut(5000);
        status= false;
    }
    if(ptype==="")
    {
       $("#sp2").text("Product Type Required...").css("color","red").fadeOut(5000);
        status= false;
    }
    if(pprice==="")
    {
      $("#sp3").text("Product Price Required...").css("color","red").fadeOut(5000);
        status= false;
    }
    if(pdesc==="")
    {
       $("#sp4").text("Product Desc Required...").css("color","red").fadeOut(5000);
        status= false;
    }
    if(pimage==="")
    {
       $("#sp5").text("Product Image Required...").css("color","red").fadeOut(5000);
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
var mydata={pname:pname,ptype:ptype,pprice:pprice,pdesc:pdesc,pimage:pimage};
var request=$.post("AddProductServlet",mydata,processresponse);
request.error(handleError);
   
}
function processresponse(responseText)
{ var resp=responseText;
        resp=resp.trim();
       if(resp==="success")
        {
            //alert("inside error");
            $("#result").html("Product Successful Uploaded! ").css("color","green");
            
        }
        else
        {
            $("#result").css("color","red");
            $("#result").html("Uplaoded Failed !. Try later...");
            
            
        }
        
    }
    function handleError(xhr,textStatus)
    {
    
    if(textStatus==='error'){
        $("#result").html("Error is "+xhr.status);
    }
}





