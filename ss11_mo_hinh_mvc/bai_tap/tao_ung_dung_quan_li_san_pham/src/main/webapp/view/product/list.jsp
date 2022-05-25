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
    <title>Title</title>
    <style>
        p a {
            text-decoration: none;
        }

        #button_create {
            background-color: #85dfff;
        }

        #button_search {
            background-color: #ffcdaa;
        }

        tr{
            text-align: center;
        }
    </style>
</head>
<body>
<h1>Products</h1>
<p>
    <button id="button_create"><a href="/products?action=create">Create new product</a></button>

    <%--********************** Để tìm kiếm **********************--%>
        <button id="button_search" ><a href="/products?action=find">Search product</a></button>
</p>
<table border="1">
    <tr>
        <td>Name</td>
        <td>Price</td>
        <td>Quantity</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td><a href="/products?action=view&id=${product.getId()}">${product.getName()}</a></td>
            <td>${product.getPrice()}</td>
            <td>${product.getQuantity()}</td>
            <td><a href="/products?action=edit&id=${product.getId()}">edit</a></td>
            <td><a href="/products?action=delete&id=${product.getId()}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
