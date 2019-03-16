var item;
var itemsname;
function ManageProduct(itemtype)
{
    item=itemtype;
    alert(item);
    var para=document.getElementById(itemtype);
    var span=para.getElementsByTagName("span")[0];
    var spantext=span.innerHTML.trim();
    if(spantext.indexOf("+")!==-1)
    {
        span.innerHTML="-"+itemtype;
    }
    else if(spantext.indexOf("-")!==-1)
    {
        span.innerHTML="+"+itemtype;
        $("#"+item+" .itemnames").hide("slow");
        return;
    }
    var mydata={itemtype:itemtype};
    var request=$.post("AdminControllerServlet",mydata,processresponse);
    request.error(handleError);
}
    function processresponse(responseText)
    {
     var para=document.getElementById(item);
     var resp=responseText;
     resp=resp.trim();
     var olddiv=para.getElementsByClassName("itemnames")[0];
     if(typeof olddiv!=='undefined')
     {
         para.removeChild(olddiv);
     }
     var newdiv=document.createElement("div");
     newdiv.setAttribute("class","itemnames");
     newdiv.innerHTML=resp;
     para.appendChild(newdiv);
    }
    function handleError(xhr,textStatus)
  {
        
    if(textStatus==='error')
    {
        $("document").html("Error is "+xhr.status);
    }
}



  
 
 


