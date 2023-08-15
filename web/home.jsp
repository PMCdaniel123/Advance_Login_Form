<%-- 
    Document   : home
    Created on : 08-Jul-2023, 09:34:59
    Author     : user
--%>

<%@page import="dao.StudentDAO"%>
<%@page import="model.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel='stylesheet' href='mycss.css' type='text/css' />
    </head>
    <body>
        <%
            session = request.getSession();
            if (!session.getAttribute("name").equals(null) ) {
        %>
        <% String username = (String) session.getAttribute("name");%>
        <h1>Hello <%= username%>!</h1><br>
        <h2>Session <%= session%>!</h2><br>
        <h3><%= session.getAttribute("name")%></h3>

        <form action="addStudent" method="get">
            <input type="submit" value="add student" class="btn orginput" style="float: right">
        </form>

        <form action="deleteStudent" method="post">
            <input type="text" name="txtdelete" placeholder="delete email">
            <input type="submit" value="delete student" class="btn orginput">
            <%
                if (request.getAttribute("delete") != null) {
                    String delete = (String) request.getAttribute("delete");
            %>
            <h2 style="color: red; display: inline"><%= delete%></h2>
            <%
                }
            %>
        </form>
        
        <form action="logout" method="post">
            <input type="submit" value="logout" class="btn orginput" style="float: right"><br>
        </form>

        <form action="search" method="get">
            <input type="text" name="txtsearch" placeholder="search name">
            <input type="submit" value="search" class="btn orginput">
        </form>

        <h1 style="color: red">List of students</h1>

        <table class="table">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Password</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Gender</th>
                <th>Created_at</th>
            </tr>
            <%
                StudentDAO sdao = new StudentDAO();
                ArrayList<Student> list = sdao.getStudentList();
                String gender = "";
                if (list != null && !list.isEmpty()) {
                    for (Student s : list) {
            %>
            <tr>
                <th><%= s.getId()%></th>
                <th><%= s.getName()%></th>
                <th><%= s.getEmail()%></th>
                <th><%= s.getPassword()%></th>
                <th><%= s.getPhone()%></th>
                <th><%= s.getAddress()%></th>
                    <% if (s.isGender()) {
                            gender = "Male";
                        } else {
                            gender = "Female";
                        }
                    %>
                <th><%= gender%></th>
                <th><%= s.getCreated_at()%></th>
            </tr>
            <%
                    }
                }
            %>
        </table>
        <%
        } else {
        %>
        <h1 style='color: red'>Please Login First</h1>
        <a href='login.jsp'>Back to login</a>
        <%
            }
        %>
    </body>
</html>
