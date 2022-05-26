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
        .message {
            color: aqua;
        }
    </style>
</head>
<center>
    <body>
    <h1>Edit product</h1>
    <p>
        <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span>
        </c:if>
    </p>
    <p>
        <a href="/products">Back to product list</a>
    </p>
    <form method="post" style="width: 30%">
        <fieldset>
            <legend>Prodcut information</legend>
            <table>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" id="name" value="${requestScope["product"].getName()}"></td>
                </tr>
                <tr>
                    <td>Price:</td>
                    <td><input type="text" name="price" id="price" value="${requestScope["product"].getPrice()}"></td>
                </tr>
                <tr>
                    <td>Quantity:</td>
                    <td><input type="text" name="quantity" id="quantity"
                               value="${requestScope["product"].getQuantity()}"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Update product"></td>
                </tr>
            </table>
        </fieldset>
    </form>
    </body>
</center>
</html>
