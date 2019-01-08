<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet">
</head>
<body background ="images/tulips.jpg">
<script type="text/javascript"> 
function validationReg(){
var fname = document.form.firstname.value; 
var lname = document.form.lastname.value;
var uname = document.form.username.value; 
var pass = document.form.password.value;
var role = document.form.role.value;
if ((uname==null || uname=="") && (pass==null || pass=="") && (fname==null || fname=="") && (lname==null || lname=="") && (role==null || role=="")){ 
	alert("Please fill all details"); 
	return false; 
}else if(fname==null || fname==""){ 
	alert("Please enter your firstname"); 
	return false; 
}else if(lname==null || lname==""){ 
	alert("Please enter your lastname"); 
	return false; 
}else if(uname==null || uname==""){ 
	alert("Please enter your username"); 
	return false; 
}else if(pass==null || pass==""){
	alert("Please enter your password"); 
	return false;
}else if(role==null || role==""){
	alert("Please select your role"); 
	return false;
}
}

function clearmsgs(){
	document.getElementById('errmsgs').innerHTML = '';
}
</script>

<div class="register-page">
  <div class="form">
  <p class="login-title"> <h1>Register Here ! </h1></p><br/>
    <form class="login-form" name="form" action="RegisterServlet" method="post" onsubmit="return validationReg()">
    <label>Enter Firstname: </label>
    <input type="text" name="firstname" class="class-input" placeholder="Enter Firstname"/><br/>
    <label>Enter Lastname: </label>
      <input type="text" name="lastname" class="class-input" placeholder="Enter Lastname"/><br/>
      <label>Enter Username: </label>
      <input type="text" name="username" class="class-input" placeholder="Enter Username"/><br/>
      <label>Enter Password: </label>
      <input type="password" name="password" class="class-input" placeholder="Enter Password"/><br/>
      <label>Select Role: </label>
      <select name="role" class="class-input">
        <option value="">--- SELECT---</option>
 		<option value="Supplier">SUPPLIER</option>
  		<option value="Customer">CUSTOMER</option>
  		
		</select>
	<p id="errmsgs" class="errmessage"><%=(request.getAttribute("errMessage2") == null) ? "" : request.getAttribute("errMessage2")%></p>
      <input type="submit" class="btn btn-default" value="Register"/>
      
    </form>
  </div>
</div>
</body>
</html>