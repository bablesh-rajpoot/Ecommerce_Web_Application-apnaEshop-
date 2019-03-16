var item;
var itemsname;
function getItemNames(itemtype)
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
    var request=$.post("StoreControllerServlet",mydata,processresponse);
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
function remove()
{
$.load("StoreControllerServlet",process);
}
function process(response)
{
  var result=response;
  alert(result);
  var rowcount=$("#tblitems").size()+1;
  var row=$("#removeitems").length;
  while(true)
  {
  if(rowcount===2 || row===1||result==='done')
  {
   window.location="StoreControllerServlet";
  }
  }
}

  
 
 


