<%-- 
    Document   : search
    Created on : 09-Jul-2023, 10:40:33
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
        <title>Search Page</title>
        <link rel='stylesheet' href='mycss.css' type='text/css' />
    </head>
    <body>
        <%
            StudentDAO sdao = new StudentDAO();
            String gender = "";
            String keyword = (String) request.getAttribute("keyword");
            ArrayList<Student> students = sdao.getStudents(keyword);
            if (students != null && !students.isEmpty()) {
        %>
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
                for (Student s : students) {
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
            } else {
            %>
            <h1 style="color: red">Not found !!!</h1><br>
            <% }
            %>
            <a href="home.jsp">Back to home</a>
        </table>
    </body>
</html>
