<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page  import="com.info.dto.*" %>
<html>
<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
			<link rel="stylesheet" href="css/custom.css">
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        	<title>Inventory Management System</title>
     <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
     <script type="text/javascript" src="js/jquery.min.js"></script>
</head>
 <script type="text/javascript">
    $(document).ready(function(){
            $("#select1").change(function() {
			  if ($(this).data('options') == undefined) {
			    /*Taking an array of all options-2 and kind of embedding it on the select1*/
			    $(this).data('options', $('#select2 option').clone());
			    
			  }
			  var id = $(this).val();
			  var options = $(this).data('options').filter('[value=' + id + ']');
			  $('#select2').html(options);
			  $("#relatedProducthidValue").val($("#select2 option:selected").text());
				});
				
				 $("#select2").click(function() {
				 if($(this).val()==""){
				 	alert("Please select the Product First");
				 }else{
					$("#relatedProducthidValue").val($("#select2 option:selected").text());
					}
				 
				 });
				});
</script>
    
    <p align="center"><strong><font color="#003399" size="7" face="Monotype Corsiva">Inventory Management System </font></strong></p>
  <a href="home1.jsp" class="align-right" >Go Home</a>  
    <body>
    <% Product productDtl = (Product)application.getAttribute("updateRecordDtl");
        request.setAttribute("updateRecordDtl", productDtl);
     %>
  	 <div class = "container">
	<div class="wrapper">
	
		<form action="saveDetails.do" method="post" name="saveDetailsForm"  style="background-color:rgba(212, 207, 208, 0);"  class="form-signin">       
		    
			 <div class="form-group">
      				<label for="prodId"> Product Id:</label>
    		 		 <input type="text" class="form-control" id="prodId" name="prodId"  value="<c:out value="${updateRecordDtl.productId}"/>"  readonly="readonly" >
    		 		 
    		</div>
   			 <div class="form-group">
    		 		 <label for="select1">Product Name:</label>
    		 		 <select name="select1" id="select1" class="form-control"   disabled="disabled" >
					  <option value=""><c:out value="${updateRecordDtl.productName}"/></option>
					  <option value="Mobiles">Mobile Phones </option>
					  <option value="Laptops">Laptops</option>
					  <option value="Split Ac">Split AC </option>
					  <option value="Telivisions">Televisions</option>
					 </select>
   			 </div>
   			 <div class="form-group">
    		 		 <label for=""description"">Product Description :</label>
    		 		 <input type="text" class="form-control" id="description" name="description" value="<c:out value="${updateRecordDtl.productDescription}"/>"   required >
   			 </div>
				 <div class="form-group">	
				 
				</div>	
				 <div class="form-group">	
				  <label for="select2">Related Products  :</label>
					<select name="select2" id="select2" class="form-control"  disabled="disabled" >
					  <option value=""  selected ><c:out value="${updateRecordDtl.relatedProductInfo}"/></option>
					  <option value="Mobiles">Apple 6S</option>
					  <option value="Mobiles">Apple 5S</option>
					  <option value="Mobiles">Samsung S3</option>
					  <option value="Laptops">Dell Inspiron 557</option>
					  <option value="Laptops">HP Imprint Core i3</option>
					  <option value="Laptops">Dell Inspiron 665 I5</option>
					  <option value="Split Ac">Sansui 1.5 Ton  </option>
					  <option value="Split Ac">Daikin 1.5 Ton </option>
					  <option value="Telivisions">Sony Bravio 55 Inch<option>
					</select>
					<input type="hidden" name="relatedProductValue" id="relatedProducthidValue" value="">
					</div>
					<div class="form-group">
    		 		 <label for=""price"">Product price :</label>
    		 		 <input type="text" class="form-control" id="price"  name="price"  value="<c:out value="${updateRecordDtl.productPrice}"/>"  required>
   			 </div>
			  <input type="hidden" name="action" id="action" value="UPDATE">
			  <button class="btn btn-lg btn-primary btn-block"  name="Submit" value="Login" type="Submit">UPDATE </button>
			  
		</form>			
	</div>
	</div>
     
    </body>
</html>