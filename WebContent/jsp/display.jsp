<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page  import="com.info.dto.*" %>
<html>
<head>
<link rel="stylesheet" href="../css/bootstrap.min.css">
			<link rel="stylesheet" href="../css/custom.css">
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        	<title>Inventory Management System</title>
     <script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
     <script type="text/javascript" src="../js/jquery.min.js"></script>
     <script type="text/javascript" >
   
            
             function confirmGo(m,u,deleteKey) {
                if ( confirm(m) ) {
                 $("#action").val('DELETE');
                 $("#deleteKey").val(deleteKey);
                 document.forms["displayForm"].submit();
                }
                
            }
            function updateRecordFunction(updatekey){
        
                 $("#action").val('UPDATERECORD');
                 $("#updateKey").val(updatekey);
                 document.forms["displayForm"].submit();
                }
                
        </script>
</head>
<body>
<p align="center"><strong><font color="#003399" size="7" face="Monotype Corsiva">Inventory Management System </font></strong></p>
    <%request.setAttribute("productList", application.getAttribute("prodMapDetails")); %>
<form action="../saveDetails.do" method="post"  id="displayForm">
            
            <table align="center" class="table table-bordered center-table" style="width: 80%;">
                <caption><b>Product List</b></caption>
                <thead><tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>price</th>
                    <th colspan="2">Action</th>
                </tr>
                </thead>
                <c:forEach var="row" items="${productList}">
                    <tr>
                        <td><c:out value="${row.value.productId}"/></td>
                        <td><c:out value="${row.value.productName}"/></td>
                        <td><c:out value="${row.value.productPrice}"/></td>
                        <td><a href="javascript:updateRecordFunction('<c:out value="${row.value.productId}"/>')">Update</a></td>
                        <td><a href="javascript:confirmGo('<c:out value="${row.value.productId}"/> Sure to delete this record?','../saveDetails.do','<c:out value="${row.value.productId}"/>')" id="deleteProd">Delete</a></td>
                         
                    </tr>
                </c:forEach>
            </table>
            <input type="hidden" name="deleteKey"  id="deleteKey" value="">
            <input type="hidden" name="updateKey"  id="updateKey" value="">
            <input type="hidden" name="action" id="action" value="">
        </form>
        <a href="home1.jsp">Go Home</a>
</body>
</html>