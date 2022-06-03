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
<center>
<body>
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
<form action="users">
    <select name="sortProperty">
        <option></option>
        <option value="name">name</option>
        <option value="email">email</option>
        <option value="country">country</option>
    </select>
    <button type="submit" name="action" value="sort">sort</button>
</form>
<c:if test="${userList != null}">
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
</c:if>
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
</center>
</html>
