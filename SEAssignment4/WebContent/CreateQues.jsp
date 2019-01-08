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
<title>Create Questions</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" >
</head>
<body background="images/white.jpg">
<p><h3>Create Questions</h3></p></div>
</div></div>
<div class="logout-section"> 
<input type="button" class="btn btn-default" value="Log Out" onclick="location.href='LogoutServlet'"/>
<div class="window-bar">
<p style="float: left; font-size: 12pt; text-align: center; width: 30%; margin-right: 1%; margin-bottom: 0.5em;"><img src="images/mcq.png" style="width: 200px; height: 200px;"><a href="MCQQues.jsp"><br/>Multiple-choice Questions </a></p>
<!--  <a href="MCQQues.jsp"><img src="images/mcq.png" width="200" height="200"/></a> 
<p>Multiple Choice Questions</p> -->
</div>
<br>
<br>
<div class="window-bar">
<p style="float: left; font-size: 12pt; text-align: center; width: 30%; margin-right: 1%; margin-bottom: 0.5em;"><img src="images/numeric.png" style="width: 200px; height: 200px;"><a href="NumQues.jsp"><br/>Numeric Questions </a></p>
<!--  <a href="NumQues.jsp"><img src="images/numeric.png" width="200" height="200"/></a>
<p>Numeric Questions</p> -->
</div>
</body>
</html>