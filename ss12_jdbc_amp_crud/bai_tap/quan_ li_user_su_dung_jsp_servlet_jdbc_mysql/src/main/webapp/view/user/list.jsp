<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/27/2022
  Time: 8:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    a{
        text-decoration: none;
        color: blue;
    }
</style>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <button style="height: 50px; width: 200px"><a href="/users?action=create">Add New User</a></button>
    </h2>
    <form action="users">
        <h2>
            <input name="country"  placeholder=" Input country" type="text" style="height: 30px; font-size: 15px">
            <button style="height: 30px" name="action" value="search">Search</button>
        </h2>
    </form>
    <h3 style="color: #ff896e">${message}</h3>
</center>
<div align="center">
    <table border="1" cellpadding="5" style="width: 50%; height: 300px; text-align: center">
        <caption><h2>List of Users</h2></caption>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}"><button style="color: blue">Edit</button></a>
                    <a href="/users?action=delete&id=${user.id}"><button style="color: blue" >Delete</button></a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
