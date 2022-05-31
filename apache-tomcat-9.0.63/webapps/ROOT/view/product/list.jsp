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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <style>
        .head {
            width: 20%;
        }

        a {
            text-decoration: none;
        }
    </style>
</head>
<body>

<center class="container">
    <h1>Products</h1>
    <a href="/products?action=create" class="btn btn-primary" role="button">Create new product</a>
    <form method="get" action="/products" style="width: 30%" class="pt-2">
        <div class="input-group mb-3 ">
            <input name="name" type="text" class="form-control" placeholder="Input name"
                   aria-label="Recipient's username"
                   aria-describedby="button-addon2">
            <button name="action" value="search" class="btn btn-outline-secondary" id="button-addon2">Search
            </button>
        </div>
    </form>


<c:if test='${requestScope["message"] != null}'>
    <span class="message">${requestScope["message"]}</span>
</c:if>

<table class="table"  >
    <thead>
    <tr>
        <th class="head" scope="Name">Name</th>
        <th class="head" scope="Price">Price</th>
        <th class="head" scope="Quantity">Quantity</th>
        <th class="head" scope="Edit">Edit</th>
        <th class="head" scope="Delete">Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items='${requestScope["products"]}' var="product">
        <tr>
            <td><a href="/products?action=view&id=${product.getId()}">${product.getName()}</a></td>
            <td>${product.getPrice()}</td>
            <td>${product.getQuantity()}</td>
            <td><a href="/products?action=edit&id=${product.getId()}">edit</a></td>
            <td><a href="/products?action=delete&id=${product.getId()}">delete</a></td>
        </tr>
    </c:forEach>
    </tbody>

</table>
</center>
</body>
</html>
