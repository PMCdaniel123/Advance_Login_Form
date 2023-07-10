<%-- 
    Document   : add
    Created on : 09-Jul-2023, 11:02:13
    Author     : user
--%>

<%@page import="model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Student Page</title>
        <link rel='stylesheet' href='mycss.css' type='text/css' />
    </head>
    <body>
        <h1>Fill Student's Information</h1>
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
        %>
        <h2 style="color: red"><%= message%></h2>
        <%
            }
        %>
        <a href="home.jsp">Back to home</a>
        <form method='post' action='addStudent'>
            <input type='text' name='name' placeholder='Name' required=""><br>
            <input type='text' name='email' placeholder='Email' required=""><br>
            <input type='password' name='password' placeholder='Password' required=""><br>
            <input type='tel' name='phone' placeholder='Phone'><br>
            <input type='text' name='address' placeholder='Address'><br>
            <input type="radio" class="gender" name="gender" value="1"><p style="font-size: 16px; display: inline">Male</p>
            <input type="radio" class="gender" name="gender" value="0"><p style="font-size: 16px; display: inline">Female</p><br>
            <input type='submit' value='Add Student' class="btnlogin orginput">
        </form>
    </body>
</html>
