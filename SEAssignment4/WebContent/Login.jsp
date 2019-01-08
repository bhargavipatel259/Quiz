<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet">
</head>
<body background ="images/tulips.jpg">
<script type="text/javascript"> 
function validation(){ 
var uname = document.form.username.value; 
var pass = document.form.password.value;
var role = document.form.role.value;
if ((uname==null || uname=="") && (pass==null || pass=="") && (role==null || role=="")){ 
alert("Fill All Required Details"); 
return false; 
}else if(uname==null || uname==""){ 
alert("Please enter Username"); 
return false; 
}else if(pass==null || pass==""){
alert("Please enter Password"); 
return false;
}else if(role==null || role==""){
alert("Please select a Role"); 
return false;
}
}

function clearmsg(){
document.getElementById('errmsg').innerHTML = '';
}
</script>

<div class="login-page">
  <div class="form">
  <p class="login-title"><h1>Login Here !</h1></p>
    <form class="login-form" name="form" action="LoginServlet" method="post" onsubmit="return validation()">
      <label>Enter Username: </label>
      <input type="text" name="username" class="class-input" placeholder="Enter Username"/><br/>
      <label>Enter Password:</label>
      <input type="password" name="password" class="class-input" placeholder="Enter Password"/><br/>
      <label>Select Role: </label>
      <select name="role" class="class-input">
        <option value="">--- SELECT---</option>
 		<option value="Supplier">SUPPLIER</option>
  		<option value="Customer">CUSTOMER</option>
  		
		</select>
	<p id="errmsg" class="errmessage"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></p>
      <input type="submit" class="btn btn-default" value="Login"/><br/>
     <!--   <input type="reset" class="class-button" value="Clear" onclick="return clearmsg()"/> -->
  
      <a class="btn btn-default" href="Register.jsp" role="button"> Click here to register!</a>
    
    </form>
  </div>
</div>
</body>
</html>