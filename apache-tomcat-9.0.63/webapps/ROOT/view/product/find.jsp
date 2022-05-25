<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/25/2022
  Time: 3:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search product</title>
</head>
<body>
<h1>Search product</h1>
<p>
    <a href="/products">Back to product list</a>
    <%--************************Để tìm kiếm***********************--%>
</p>
<form method="post">
    <input type="text" placeholder="Input name" name="name">
    <button type="submit">Search</button>
</form>
<p>
    <c:if test='${requestScope["message"] != null}'>
    <span class="message">${requestScope["message"]}</span>
    </c:if>
<table>
    <tr>
        <td>Name:</td>
        <td>${requestScope["product"].getName()}</td>
    </tr>
    <tr>
        <td>Price:</td>
        <td>${requestScope["product"].getPrice()}</td>
    </tr>
    <tr>
        <td>Quantity:</td>
        <td>${requestScope["product"].getQuantity()}</td>
    </tr>
</table>
</body>
</html>
