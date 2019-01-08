<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<title>Change Password</title>
</head>
<body background = "images/white.jpg">
<h2>Change Password</h2>
 <form  action="ChangePasswordServlet" method="post">
            <table>
                <tr>
                    <td>Enter Old Password: </td>
                    <td><input type=”password” name=”oldpwd”/></td>
                </tr>
                <tr>
                    <td>Enter New password :</td>
                    <td><input type=”password” name=”newpwd”/></td>
                </tr>
                <tr>
                    <td>Enter Confirm Password:  </td>
                    <td><input type=”password” name=”conpwd” /></td>
                </tr>
                <tr>
                    <td><input type="button"  class="btn btn-default" value="Submit">
                    </td>
                </tr>
            </table>
        </form>
        <table>
          </table>
</body>
</html>