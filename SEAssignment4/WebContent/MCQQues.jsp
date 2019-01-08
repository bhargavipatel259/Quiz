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
<title>Multiple Choice Questions</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet">
</head>
<body background="images/white.jpg">
<script type="text/javascript"> 
function validationMCQ(){
var mcqques = document.form.mcqques.value; 
var choicea = document.form.choicea.value;
var choiceb = document.form.choiceb.value; 
var choicec = document.form.choicec.value;
var choiced = document.form.choiced.value;
var mcqans = document.form.mcqanswer.value;
var mcqhint1 = document.form.mcqhint1.value;
var mcqhint2 = document.form.mcqhint2.value;
var mcqhint3 = document.form.mcqhint3.value;
var mcqfeedback = document.form.mcqfeedback.value;
//if ((mcqques==null || mcqques=="") && (choicea==null || choicea=="") && (choiceb==null || choiceb=="") && (choicec==null || choicec=="") 
//		&& (choiced==null || choiced=="") && (mcqans==null || mcqans=="") && (mcqhint1==null || mcqhint1=="") && (mcqhint2==null || mcqhint2=="")
//		&& (mcqhint3==null || mcqhint3=="") && (mcqfeedback==null || mcqfeedback=="")){ 
//	alert("Please fill all details"); 
//	return false; 

	if ((mcqques==null || mcqques=="") && (choicea==null || choicea=="") && (choiceb==null || choiceb=="") && (choicec==null || choicec=="") 
			&& (choiced==null || choiced=="") && (mcqans==null || mcqans=="") && (mcqfeedback==null || mcqfeedback=="")){ 
		alert("Please fill all details"); 
		return false; 
}else if(mcqques==null || mcqques==""){ 
	alert("Please enter Question"); 
	return false; 
}else if(choicea==null || choicea==""){ 
	alert("Please enter Choice A"); 
	return false; 
}else if(choiceb==null || choiceb==""){ 
	alert("Please enter Choice B"); 
	return false; 
}else if(choicec==null || choicec==""){
	alert("Please enter Choice C"); 
	return false;
}else if(choiced==null || choiced==""){
	alert("Please enter Choice D"); 
	return false;
}else if(mcqans==null || mcqans==""){
	alert("Please select Answer"); 
	return false;
}else if(mcqhint1==null || mcqhint1==""){
	alert("Please enter Hint 1"); 
	return false;
}
//else if(mcqhint2==null || mcqhint2==""){
//	alert("Please enter Hint 2"); 
//	return false;
//}else if(mcqhint3==null || mcqhint3==""){
//	alert("Please enter Hint 3"); 
//	return false;
//}
else if(mcqfeedback==null || mcqfeedback==""){
	alert("Please enter Feedback"); 
	return false;
}
}
</script>
<div class="address-bar">
<p class="login-title"><h4>Mutiple Choice Questions</h4></p>
<div class="logout-section">
<input type="button" class ="btn btn-default" value="Log Out" onclick="location.href='LogoutServlet'"/>
</div></div>
<div class="question-page">
  <div class="question-form">
  <!--   <p class="login-title">Mutiple Choice Questions</p> -->
  <p id="errmsgm" class="errmessage"><%=(request.getAttribute("errMessage3") == null) ? "" : request.getAttribute("errMessage3")%></p>
    <form class="login-form" name="form" action="CreateMCQServlet" method="post" onsubmit="return validationMCQ()">
    <label>Enter Question:</label>
    <input type="text" name="mcqques" class="class-input" placeholder="Enter Question"/><br/>
    <label>Option A:</label>
    <input type="text" name="choicea" class="class-input" placeholder="Enter Choice A"/><br/>
    <label>Option B:</label>
      <input type="text" name="choiceb" class="class-input" placeholder="Enter Choice B"/><br/>
      <label>Option C:</label>
      <input type="text" name="choicec" class="class-input" placeholder="Enter Choice C"/><br/>
      <label>Option D:</label>
      <input type="text" name="choiced" class="class-input" placeholder="Enter Choice D"/><br/>
      <label>Select Option:</label>
      <select name="mcqanswer" class="class-input">
        <option value="">--- Select Answer ---</option>
 		<option value="A">Choice A</option>
  		<option value="B">Choice B</option>
  		<option value="C">Choice C</option>
  		<option value="D">Choice D</option>
		</select><br/>
		<label>Hint :</label>
	  <input type="text" name="mcqhint1" class="class-input" placeholder="Enter Hint"/><br/>
	 <!-- <label>Hint 2:</label>
       <input type="text" name="mcqhint2" class="class-input" placeholder="Enter Hint 2"/><br/>
      <label>Hint 3:</label>
      <input type="text" name="mcqhint3" class="class-input" placeholder="Enter Hint 3"/><br/> -->
      <label>Feedback:</label>
      <input type="text" name="mcqfeedback" class="class-input" placeholder="Enter Feedback"/><br/>
	  <input type="submit" class="btn btn-default" value="Submit & Add New"/>
      <input type="button" class="btn btn-default" value="Done" onclick="location.href='Success.jsp'"/>
    </form>
  </div>
</div>
</body>
</html>