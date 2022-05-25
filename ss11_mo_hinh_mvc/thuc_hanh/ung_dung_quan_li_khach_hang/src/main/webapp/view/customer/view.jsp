<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/23/2022
  Time: 8:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>
        View Customer
    </title>
</head>
<body>
<h1>Customer details</h1>
<p>
    <a href="/customers">Back to customer list</a>

<%--************************Để tìm kiếm***********************--%>
<%--</p>--%>
<%--<form method="post">--%>
<%--    <input type="text" placeholder="Input id" name="id">--%>
<%--    <button type="submit">Search</button>--%>
<%--</form>--%>
<%--<p>--%>

    <c:if test='${requestScope["message"] != null}'>
    <span class="message">${requestScope["message"]}</span>
    </c:if>
<table>
    <tr>
        <td>Name:</td>
        <td>${requestScope["customer"].getName()}</td>
    </tr>
    <tr>
        <td>Email:</td>
        <td>${requestScope["customer"].getEmail()}</td>
    </tr>
    <tr>
        <td>Address:</td>
        <td>${requestScope["customer"].getAddress()}</td>
    </tr>
</table>
</body>
</body>
</html>
