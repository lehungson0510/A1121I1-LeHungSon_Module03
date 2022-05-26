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
        View Product
    </title>
</head>
<center>
    <body>
    <h1>Product details</h1>
    <p>
        <button style="background: #85dfff"><a href="/products">Back to product list</a></button>
    </p>
    <p>
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
</center>
</html>
