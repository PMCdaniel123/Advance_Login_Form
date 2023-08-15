<%-- 
    Document   : login
    Created on : 08-Jul-2023, 09:34:44
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel='stylesheet' href='mycss.css' type='text/css' />
    </head>
    <body>
        <h1>Please login to your account</h1>
        <h3><%= session.getAttribute("name")%></h3>
        <% 
            if (request.getAttribute("error")!= null) {
                String error = (String) request.getAttribute("error");
        %>
        <h2 style="color: red"><%= error%></h2>
        <% 
            }
        %>
        <form method='post' action='login'>
            <input type='text' name='email' placeholder='Email'><br>
            <input type='password' name='pass' placeholder='Password'><br>
            <input type='submit' value='Log In' class="btnsubmit orginput">
        </form>
    </body>
</html>
