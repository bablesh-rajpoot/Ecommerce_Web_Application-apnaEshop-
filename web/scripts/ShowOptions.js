var item;
var pname,ptype,pprice,pdesc,pimage,resp,uname;
var myoptionsarray=[];
var myfunctionnamesarray=[];
var productoptions=["Add","Update","Delete"];
var productoptionsfunctions=["showAddProductForm()","showUpdateProductForm()","showDeleteProductForm()"];
var useroptions=["Remove"];
var useroptionsfunctions=["removeUser()"];
var viewoptions=["Orders"];
var viewoptionsfunctions=["viewOrders()"];
function removeProductForm()
{
    var contdiv=document.getElementById("productcontainer");
    var formdiv=document.getElementById("productform");
    if(formdiv!==null)
    {
        //alert("div has been removed");
        $("#productform").fadeOut("3500");
        contdiv.removeChild(formdiv);   
    }
}
function getItemNames(itemType)
{
 item=itemType;
para=document.getElementById(itemType);
var span=para.getElementsByTagName("span")[0];
//alert("span is "+span);
var spantext=span.innerHTML.trim();
//alert("spantext is "+spantext);

if(spantext.indexOf("+")!==-1)
{
    span.innerHTML="-"+itemType;
      
}
else if(spantext.indexOf("-")!==-1)
{
    span.innerHTML="+"+itemType;
    $("#"+item+ " .itemnames").hide("slow");
    removeProductForm();
    return; 
    
}

showItems();
}
function showItems()
{
var olddiv=para.getElementsByClassName("itemnames")[0];
if(typeof olddiv!=='undefined')
{
 //alert("div removed");
 para.removeChild(olddiv);   
}
var newdiv=document.createElement("div");
newdiv.setAttribute("class","itemnames");
var newul=document.createElement("ul");
if(item==="Products")
{
    myoptionsarray=productoptions;
    myfunctionnamesarray=productoptionsfunctions;
    
}
else if(item==="Users")
{
    myoptionsarray=useroptions;
    myfunctionnamesarray=useroptionsfunctions;
}
else
{
     myoptionsarray=viewoptions;
     myfunctionnamesarray=viewoptionsfunctions;
}
for(var i=0;i<myoptionsarray.length;i++)
{
    newul.innerHTML+="<li><a href='#' onclick='"+myfunctionnamesarray[i]+"'>"+myoptionsarray[i]+"</a></li>";
    
}
newdiv.appendChild(newul);
para.appendChild(newdiv);
$("#"+item+ " .itemnames").hide();
$("#"+item+ " .itemnames").show("slow");
}
function showAddProductForm()
{
//alert("showAddProduct called");
removeProductForm();
var newdiv=document.createElement("div");
newdiv.setAttribute("id","productform");
newdiv.setAttribute("float","left");
newdiv.setAttribute("padding-left","12px");
newdiv.setAttribute("border","solid 2px red");
newdiv.innerHTML="<h3>Add New Product</h3>";
newdiv.innerHTML=newdiv.innerHTML+"<form method='POST' enctype='multipart/form-data' id='fileUploadForm'><table border='2'><tr><th>Product Name:</th><td><input type='text' id='pname'><span id='sp1'></span></td></tr><tr><th>Product Type:</th><td><input type='text' id='ptype'><span id='sp2'></span></td></tr><tr><th>Product Price:</th><td><input type='text' id='pprice'><span id='sp3'></span></td></tr><tr><th>Product Desc:</th><td><input type='text' id='pdesc'><span id='sp4'></span></td></tr><tr><th>Product Image:</th><td colspan='2'><input type='file' name='files' value='Select Image'></td></tr><tr><th><input type='button' value='Add Product' onclick='connect()' id='addprd'></th><th><input type='reset' value='Clear' onclick='clearText()'></th></tr></table></form>";
newdiv.innerHTML=newdiv.innerHTML+"<span id='addresp'></span>";
var addPrd=$("#productcontainer")[0];
addPrd.appendChild(newdiv);
$("#productform").hide();
$("#productform").fadeIn("3500");

}
function showUpdateProductForm()
{
//alert("showupdateProduct called");
removeProductForm();
getdata();
var newdiv=document.createElement("div");
newdiv.setAttribute("id","productform");
newdiv.setAttribute("float","left");
newdiv.setAttribute("padding-left","12px");
newdiv.setAttribute("border","solid 2px red");
newdiv.innerHTML="<h3>Update Product</h3>";
newdiv.innerHTML=newdiv.innerHTML+"<form method='POST' enctype='multipart/form-data' id='fileUploadForm'><table border='2'><tr><td><b>Product Id:</b></td><td id='opid'></td></tr><tr><th>Product Name:</th><td><input type='text' id='pname'></td></tr><tr><th>Product Type:</th><td><input type='text' id='ptype'></td></tr><tr><th>Product Price:</th><td><input type='text' id='pprice'></td></tr><tr><th>Product Desc:</th><td><input type='text' id='pdesc'></td></tr><tr><th>Product Image:</th><td colspan='2'><input type='file' name='files' value='Select Image'></td></tr><tr><th><input type='button' value='Update Product' onclick='addProduct()' id='addprd'></th><th><input type='reset' value='Clear' onclick='clearText()'></th></tr></table></form>";
newdiv.innerHTML=newdiv.innerHTML+"<span id='addresp'></span>";
var addPrd=$("#productcontainer")[0];
addPrd.appendChild(newdiv);
$("#productform").hide();
$("#productform").fadeIn("3500");

}
function showDeleteProductForm()
{
//alert("showdeleteProduct called");
removeProductForm();
getdata();
var newdiv=document.createElement("div");
newdiv.setAttribute("id","productform");
newdiv.setAttribute("float","left");
newdiv.setAttribute("padding-left","12px");
newdiv.setAttribute("border","solid 2px red");
newdiv.innerHTML="<h3>Delete Product</h3>";
newdiv.innerHTML=newdiv.innerHTML+"<form method='POST' enctype='multipart/form-data' id='fileUploadForm'><table border='2'><tr><td><b>Product Id:</b></td><td id='opid'></td></tr><tr><th>Product Name:</th><td><input type='text' id='pname'></td></tr><tr><th>Product Type:</th><td><input type='text' id='ptype'></td></tr><tr><th>Product Price:</th><td><input type='text' id='pprice'></td></tr><tr><th>Product Desc:</th><td><input type='text' id='pdesc'></td></tr><tr><th>Product Image:</th><td colspan='2'><input type='file' name='files' value='Select Image'></td></tr><tr><th><input type='button' value='Delete Product' onclick='addProduct()' id='addprd'></th><th><input type='reset' value='Clear' onclick='clearText()'></th></tr></table></form>";
newdiv.innerHTML=newdiv.innerHTML+"<span id='addresp'></span>";
var addPrd=$("#productcontainer")[0];
addPrd.appendChild(newdiv);
$("#productform").hide();
$("#productform").fadeIn("3500");

}
function removeUser()
{
  //alert("removeUser called");
removeProductForm();
getmember();
var newdiv=document.createElement("div");
newdiv.setAttribute("id","productform");
newdiv.setAttribute("float","left");
newdiv.setAttribute("padding-left","12px");
newdiv.setAttribute("border","solid 2px red");
newdiv.innerHTML="<h3>Remove Users</h3>";
newdiv.innerHTML=newdiv.innerHTML+"<form method='POST' enctype='multipart/form-data' id='fileUploadForm'><table border='2'><tr><td><b>Member Name:</b></td><td id='mname'></td></tr><tr><th>Member Type:</th><td><b>COSTOMER</b></td></tr><tr><td><input type='button' value='Remove Member' onclick='removemember()' id='removemem'></td></tr></table></form>";
newdiv.innerHTML=newdiv.innerHTML+"<span id='removeresp'></span>";
var addPrd=$("#productcontainer")[0];
addPrd.appendChild(newdiv);
$("#productform").hide();
$("#productform").fadeIn("3500");

} 
function viewOrders()
{
    //alert("viewOrder called");
removeProductForm();
getAllOrdId();
var newdiv=document.createElement("div");
newdiv.setAttribute("id","productform");
newdiv.setAttribute("float","left");
newdiv.setAttribute("padding-left","12px");
newdiv.setAttribute("border","solid 2px red");
newdiv.innerHTML="<h3>View Orders</h3>";
newdiv.innerHTML=newdiv.innerHTML+"<form method='POST' enctype='multipart/form-data' id='fileUploadForm'><table border='2'><tr><td><b>All Order_Id :</b></td><td id='ordid'></td></tr><tr><td><b>Cust_Name:</b></td><td></td></tr><tr><td><b>Order_Amount:</b></td><td></td></tr><tr><td><b>Order_Date:</b></td><td></td></tr><tr><td><input type='button' value='View Order' onclick='removemember()' id='removemem'></td></tr></table></form>";
newdiv.innerHTML=newdiv.innerHTML+"<span id='addresp'></span>";
var addPrd=$("#productcontainer")[0];
addPrd.appendChild(newdiv);
$("#productform").hide();
$("#productform").fadeIn("3500");
}




function clearText()
{
    $("#addresp").html(""); 
}
function connect()
{
   if(!validate())
    {
        return;
    }
  var form = $('#fileUploadForm')[0];
    var data = new FormData(form);
    //alert(data);
    pname=$("#pname").val();
    ptype=$("#ptype").val();
    pdesc=$("#pdesc").val();
    pprice=$("#pprice").val();
    data.append("pname",pname);
    data.append("ptype",ptype);
    data.append("pdesc",pdesc);
    data.append("pprice",pprice);
    $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "AddNewProductControllerServlet",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 6000000,
            success: function (data) 
            {
             
             $("#addresp").html(data);
            },
            error: function (e) 
            {
                $("#addresp").html(e);
            }
        });
}
function getdata(itemType)
{
    item=itemType;
   var form = $('#fileUploadForm')[0];
   var data = new FormData(form);
   
  $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "AdminControllerServlet?str=Update",
            data:data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 6000000,
            success: function (data) 
            {
                resp=data;
               $("#opid").html(data);
           }
     });
  
}
function getmember(itemType)
{
    item=itemType;
   var form = $('#fileUploadForm')[0];
   var data = new FormData(form);
   $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "AdminControllerServlet?uname=Remove",
            data:data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 6000000,
            success: function (data) 
            {
                resp=data;
               $("#mname").html(data);
           }
     });
  
}
function getAllOrdId(itemType)
{
    item=itemType;
   var form = $('#fileUploadForm')[0];
   var data = new FormData(form);
   $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "AdminControllerServlet?ordId=Orders",
            data:data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 6000000,
            success: function (data) 
            {
                resp=data;
               $("#ordid").html(data);
           }
     });
  
}
function removemember()
{
   var form = $('#fileUploadForm')[0];
   var data = new FormData(form);
   var member=$("#member").val();
   $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "removemember.jsp?member="+member,
            data:data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 6000000,
            success: function (data) 
            {
                resp=data;
               $("#removeresp").html(data);
           }
     });
  
}
function getItemDetails()
{
   var form = $('#fileUploadForm')[0];
   var data = new FormData(form);
   var member=$("#itemid").val();
   $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "AdminControllerServlet?member="+member,
            data:data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 6000000,
            success: function (data) 
            {
                resp=data;
               $("#addresp").html(data);
           }
     });
  
}
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


