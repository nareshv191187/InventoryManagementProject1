<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Inventory Management System</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<script language="JavaScript">
function valid()
{
if (window.document.form1.userid.value=="")
	{
		alert("UserID Can't Be Blank.. Pls Enter ");
		window.document.form1.userid.focus();
		return false;
	}
if (window.document.form1.password.value=="")
	{
		alert("Password Can't Be Blank.. Pls Enter ");
		window.document.form1.password.focus();
		return false;
	}

}
</script>
</head>
<body bgcolor="#A3A3D1">
<%session.removeAttribute("usid");
	System.out.println(session.getAttribute("usid"));
%>
  <p align="center"><strong><font color="#003399" size="7" face="Monotype Corsiva">Inventory Management System </font></strong></p>


<div class = "container">
	<div class="wrapper">
		<form action="login.do" method="post" name="Login_Form" class="form-signin">       
		      
			  <input type="text" class="form-control" name="UserName" placeholder="Username" required="" autofocus="" />
			  <br><input type="password" class="form-control" name="Password" placeholder="Password" required=""/>     		  
			  <br>
			  <button class="btn btn-lg btn-primary btn-block"  name="Submit" value="Login" type="Submit">Login</button>
			  
		</form>			
	</div>
</div>
</body>
</html>


