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
<title>Multiple Choice Questions</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet">
</head>
<body background="images/white.jpg">
<%
int mcqid = Integer.parseInt((request.getParameter("mcqid")));
%>
<script type="text/javascript"> 
function validationnewMCQ(){
var mcqanswer = document.form.mcqanswers.value; 

if (mcqanswer==null || mcqanswer==""){ 
	alert("Please select an answer"); 
	return false; 
}
}
</script>
<div class="address-bar">
<p><h2>Multiple Choice Questions</h2></p></div>
<div class="address-bar">
<div class="logout-section">
<input type="button" class="btn btn-default" value="Log Out" onclick="location.href='LogoutServlet'"/>
</div></div>
 				<% Class.forName("com.mysql.jdbc.Driver");  
                
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost/icsi518_hw4","icsi518","secretICSI518");  
  
                PreparedStatement ps=con.prepareStatement("select * from mcqquestion where mcqid="+mcqid);        
                    
                ResultSet rs=ps.executeQuery();
                mcqid++;
                while (rs.next())
                {
                %>
                <form name="form" action="AnswerMCQServlet" method="post" onsubmit="return validationnewMCQ()">
                <input type="hidden" name="mcqaid" value="<%= rs.getInt(1) %>">
                <p>Q.<%= rs.getInt(1) %>: <%= rs.getString(2) %></p>
                <p>A) <%= rs.getString(3) %></p>
                <p>B) <%= rs.getString(4) %></p>
                <p>C) <%= rs.getString(5) %></p>
                <p>D) <%= rs.getString(6) %></p>
                <p>Your Answer is: <select name="mcqanswers">
        			<option value="">--- Select Answer ---</option>
 					<option value="A">Choice A</option>
  					<option value="B">Choice B</option>
  					<option value="C">Choice C</option>
  					<option value="D">Choice D</option>
				</select></p>
				<%
                }
                %>
				<p>Hint : <span><%=(request.getAttribute("mcqHint1") == null) ? "" : request.getAttribute("mcqHint1")%></span></p>
              <!--    <p>Hint 2: <span><%=(request.getAttribute("mcqHint2") == null) ? "" : request.getAttribute("mcqHint2")%></span></p> 
                <p>Hint 3: <span><%=(request.getAttribute("mcqHint3") == null) ? "" : request.getAttribute("mcqHint3")%></span></p> -->
                <p>Feedback: <span><%=(request.getAttribute("mcqFeedback") == null) ? "" : request.getAttribute("mcqFeedback")%></span></p>
                <p>Message: <span><%=(request.getAttribute("mcqMessage") == null) ? "" : request.getAttribute("mcqMessage")%></span></p>
                <input type="submit"  class="btn btn-default" value="Submit">
                <a href="NextMCQServlet?mcqid=<%= mcqid %>" style="text-decoration:none"><input type="button"  class="btn btn-default" value="Next Question"></a>
                <input type="button"  class="btn btn-default" value="Back To Main Page" onclick="location.href='Success.jsp'">
                </form>
                
</body>
</html>