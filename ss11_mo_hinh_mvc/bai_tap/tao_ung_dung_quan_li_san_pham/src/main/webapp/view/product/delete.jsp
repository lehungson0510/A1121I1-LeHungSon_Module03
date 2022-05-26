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
    <title>Deleting product</title>
</head>
<center>
    <body>
    <h1>Delete product</h1>
    <p>
        <a href="/products">Back to product list</a>
    </p>
    <form method="post" style="width: 30%">
        <h3>Are you sure?</h3>
        <fieldset>
            <legend>Product information</legend>
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
                <tr style="text-align: center">
                    <td colspan="2"><input type="submit" value="Delete product"></td>
                </tr>
            </table>
        </fieldset>
    </form>
    </body>
</center>
</html>
