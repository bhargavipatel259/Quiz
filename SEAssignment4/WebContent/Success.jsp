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
<title>Home Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet">
</head>
<body background="images/white.jpg">
<div class="address-bar">
<h1>
	<h4 align = "center"> WELCOME !!</font></h4>
	<input type="submit" value="EditProfile" class="btn btn-success" name="submitButton" onclick="location.href='EditProfile.jsp'" />
		<font color="RebeccaPurple"> <h3><%= session.getAttribute("role")%> : <%= session.getAttribute("username")%>!</h3>
		</font>
	</h1>
	
	<h5>
		ROLE: <font color="Crimson"> <%=session.getAttribute("role")%>
		</font>
	</h5>
<h4>
<!--<p>Welcome <%=request.getSession().getAttribute("role") %> : <%=request.getSession().getAttribute("firstname") %> <%=request.getSession().getAttribute("lastname") %></p> -->
<p>Current Date and Time is :
<% java.util.Date d = new java.util.Date();
out.println(d.toString()); %>
</h4>
</p></div>
<div class="address-bar">
</div></div>
<div class="window-bar">
<p style="float: left; font-size: 12pt; text-align: center; width: 30%; margin-right: 1%; margin-bottom: 0.5em;"><img src="images/questions.jpeg" style="width: 200px; height: 200px;"><a href="CreateQues.jsp"><br/>Create Questions </a></p>
<!--   <a href="CreateQues.jsp"><img src="images/questions.jpeg" width="200" height="200"/></a>
<p>Create Questions</p> -->
</div>
<div class="window-bar">
<p style="float: left; font-size: 12pt; text-align: center; width: 30%; margin-right: 1%; margin-bottom: 0.5em;"><img src="images/answers.png" style="width: 200px; height: 200px;"><a href="AnswerQues.jsp"><br/>Answer Questions </a></p>
<!--   <a href="AnswerQues.jsp"><img src="images/answers.png" width="200" height="200"/></a>
<p>Answer Questions</p> -->
</div>
<input type="button" class="btn btn-default" value="Log Out" onclick="location.href='LogoutServlet'"/>
</body>
</html>