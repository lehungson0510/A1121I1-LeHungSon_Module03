<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/28/2022
  Time: 11:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<center>
    <body>
    <h1>User details</h1>
    <p>
        <button style="background: #85dfff"><a href="/users">Back to user list</a></button>
    </p>
    <p>
    <table border="1px" width="50%" height="300px" style="text-align: center">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
        </tr>
        <c:forEach items="${userList}" var="user">
            <tr>
                <td> ${user.id}</td>
                <td> ${user.name}</td>
                <td> ${user.email}</td>
                <td> ${user.country}</td>
            </tr>
        </c:forEach>
    </table>
    </body>
</center>
</html>
