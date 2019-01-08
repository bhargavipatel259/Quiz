<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
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
<title>Numerical Questions</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet">
</head>
<body background="images/white.jpg">
<%
int numid = Integer.parseInt((request.getParameter("numid")));
%>
<script type="text/javascript"> 
function validationnewNum(){
var numanswer = document.form.numanswer.value; 

if (numanswer==null || numanswer==""){ 
	alert("Please enter an answer"); 
	return false; 
}
}
</script>
<div class="address-bar">
<p>Answer Numerical Questions</p></div>
<div class="address-bar">
<div class="logout-section">
<input type="button" class="btn btn-default" value="Log Out" onclick="location.href='LogoutServlet'"/>
</div></div>
 				<% Class.forName("com.mysql.jdbc.Driver");  
                
                Connection con=DriverManager.getConnection(  
                		"jdbc:mysql://localhost/icsi518_hw4","icsi518","secretICSI518");  
  
                PreparedStatement ps=con.prepareStatement(
                "select * from numquestion where numid="+numid);        
                    
                ResultSet rs=ps.executeQuery();
                numid++;
                while (rs.next())
                {
                %>
                <form name="form" action="AnswerNumServlet" method="post" onsubmit="return validationnewNum()">
                <input type="hidden" name="numaid" value="<%= rs.getInt(1) %>">
                <p>Q.<%= rs.getInt(1) %>: <%= rs.getString(2) %></p>
                <p>Your Answer is: <input type="text" name="numanswer"/></p>
				<%
                }
                %>
				<p>Hint : <span><%=(request.getAttribute("numHint1") == null) ? "" : request.getAttribute("numHint1")%></span></p>
                <p>Hint 2: <span><%=(request.getAttribute("numHint2") == null) ? "" : request.getAttribute("numHint2")%></span></p> 
                <p>Hint 3: <span><%=(request.getAttribute("numHint3") == null) ? "" : request.getAttribute("numHint3")%></span></p>
                <p>Feedback: <span><%=(request.getAttribute("numFeedback") == null) ? "" : request.getAttribute("numFeedback")%></span></p>
                <p>Message: <span><%=(request.getAttribute("numMessage") == null) ? "" : request.getAttribute("numMessage")%></span></p>
                <input type="submit" class="btn btn-default" value="Submit">
                <a href="NextNumServlet?numid=<%= numid %>" style="text-decoration:none"><input type="button" class="btn btn-default" value="Next Question"></a>
                <input type="button" class="btn btn-default" value="Back To Main Page" onclick="location.href='Success.jsp'">
                </form>
                
</body>
</html>