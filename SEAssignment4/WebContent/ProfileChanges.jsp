<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profile Changes</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
</head>
<body>
<body background = "images/white.jpg">
<h2>Change Details</h2>
        <form method="POST" action="EditProfileServlet">
            <table>
                <tr>
                    <td>Enter New FirstName : </td>
                    <td><input type=”text” name=”nfirstName”/><br></td>
                </tr>
                <tr>
                    <td>Enter New LastName :</td>
                    <td><input type=”text” name=”nlastName”/></td>
                </tr>
                    <td><input type="button"  class="btn btn-default" value="Submit">
                    </td>
                </tr>
            </table>
        </form>
        <table>
          </table>
</body>
</html>