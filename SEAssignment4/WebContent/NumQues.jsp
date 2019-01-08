<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0, post-check=0, pre-check=0");
    response.setHeader("Pragma", "no-cache");
%>
<%
    try {
        if ((session.getAttribute("username")).toString() == null || (session.getAttribute("role")).toString() == null) {
            response.sendRedirect("Login.jsp");
        }
    } catch (Exception e) {
        response.sendRedirect("Login.jsp");
    }
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Numeric Questions</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet">
</head>
<body background="images/white.jpg">
<script type="text/javascript"> 
function validationNum(){
var numques = document.form.numques.value; 
var numans = document.form.numanswer.value;
var numhint1 = document.form.numhint1.value;
var numhint2 = document.form.numhint2.value;
var numhint3 = document.form.numhint3.value;
var numfeedback = document.form.numfeedback.value;
//if ((numques==null || numques=="") && (numans==null || numans=="") && (numhint1==null || numhint1=="") && (numhint2==null || numhint2=="")
//		&& (numhint3==null || numhint3=="") && (numfeedback==null || numfeedback=="")){ 
//	alert("Please fill all details"); 
//	return false; 
	
	if ((numques==null || numques=="") && (numans==null || numans=="") && (numhint1==null || numhint1=="") && (numfeedback==null || numfeedback=="")){ 
		alert("Please fill all details"); 
		return false; 
}else if(numques==null || numques==""){ 
	alert("Please enter Question"); 
	return false; 
}else if(numans==null || numans==""){
	alert("Please enter Answer"); 
	return false;
}else if(numhint1==null || numhint1==""){
	alert("Please enter Hint 1"); 
	return false;
}
//else if(numhint2==null || numhint2==""){
//	alert("Please enter Hint 2"); 
//	return false;
//}else if(numhint3==null || numhint3==""){
//	alert("Please enter Hint 3"); 
//	return false;
//}
else if(numfeedback==null || numfeedback==""){
	alert("Please enter Feedback"); 
	return false;
}
}
</script>
<div class="address-bar">
<p><h4>Create Numeric Questions</h4></p></div>
<div class="address-bar">
<div class="logout-section">
<input type="button" class="btn btn-default" value="Log Out" onclick="location.href='LogoutServlet'"/>
</div></div>
<div class="question-page">
  <div class="question-form">
  <p id="errmsgn" class="errmessage"><%=(request.getAttribute("errMessage4") == null) ? "" : request.getAttribute("errMessage4")%></p>
    <form class="login-form" name="form" action="CreateNumQServlet" method="post" onsubmit="return validationNum()">
     <label>Enter Question: </label>
    <input type="text" name="numques" class="class-input" placeholder="Enter Question"/><br/>
     <label>Enter Answer</label>
    <input type="text" name="numanswer" class="class-input" placeholder="Enter Answer"/><br/>
     <label>Hint: </label>
	  <input type="text" name="numhint1" class="class-input" placeholder="Enter Hint"/><br/>
      <input type="text" name="numhint2" class="class-input" placeholder="Enter Hint 2"/>
      <input type="text" name="numhint3" class="class-input" placeholder="Enter Hint 3"/>
       <label>Feedback: </label>
      <input type="text" name="numfeedback" class="class-input" placeholder="Enter Feedback"/><br/>
      <input type="submit" class="btn btn-default" value="Submit & Add New"/>
      <input type="button" class="btn btn-default" value="Done" onclick="location.href='Success.jsp'"/>
    </form>
  </div>
</div>
</body>
</html>