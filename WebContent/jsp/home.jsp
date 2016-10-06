<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inventory Management System</title>
</head>
<p align="center"><strong><font color="#003399" size="7" face="Monotype Corsiva">Inventory Management System </font></strong></p>

<body>
       <% if(request.getAttribute("errorMessage")!= null ) {%>
        <div> 
         <font color="red">
        <%=request.getAttribute("errorMessage") %>
        </font>
         </div>
         <%} %>
        <div>
        <h1>Choose Option</h1>
        <a href="jsp/insert.jsp">Insert Record</a><p></p>
        <a href="jsp/display.jsp">Display Record</a>
        </div>
</body>
</html>