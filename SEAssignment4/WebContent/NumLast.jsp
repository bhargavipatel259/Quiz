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
<div class="address-bar">
<p><h4>Answer Numerical Questions</h4></p></div>
<div class="address-bar">
<div class="logout-section">
</div></div>
<input type="button" class="btn btn-default" value="Log Out" onclick="location.href='LogoutServlet'"/>
 				<% Class.forName("com.mysql.jdbc.Driver");  
                
                Connection con=DriverManager.getConnection(  
                		"jdbc:mysql://localhost/icsi518_hw4","icsi518","secretICSI518");  
  
                PreparedStatement ps=con.prepareStatement(
                "select * from numquestion where numid="+numid);        
                    
                ResultSet rs=ps.executeQuery();
                while (rs.next())
                {
                %>
				<%
                }
                %>
				
                <p class="bolds">Message: <span><%=(request.getAttribute("numMessage") == null) ? "" : request.getAttribute("numMessage")%></span></p>
            

              <!--  <input type="button" class="btn btn-default" value="Done" onclick="location.href='Success.jsp'">  -->
</body>
</html>