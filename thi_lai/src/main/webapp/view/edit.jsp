<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/17/2022
  Time: 5:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap4.6.0/css/bootstrap.min.css">
    <script src="jquery/jquery-3.5.1.min.js"></script>
    <script src="bootstrap4.6.0/js/bootstrap.min.js"></script>
</head>
<body>
<center>
    <h2>Edit product</h2>
    <c:if test="${message!=null}">
        <h3 class="text-primary">${message}</h3>
    </c:if>
</center>
<form method="post" class="container w-50">
    <div>
        <div class="input-group my-4">
            <div class="input-group-prepend">
                <span class="input-group-text">Name</span>
            </div>
            <input value="${product.name}" name="name" type="text" aria-label="Last name" class="form-control">
            <%--            <small class="col-md-12 " style="color: red"> ${error.id} </small>--%>
        </div>
        <div class="input-group mb-4">
            <div class="input-group-prepend">
                <span class="input-group-text">Price</span>
            </div>
            <input  value="${product.price}" name="price" type="text" aria-label="Last name"
                   class="form-control">
            <%--            <small class="col-md-12" style="color: red"> ${error.area}</small>--%>
        </div>
        <div class="input-group mb-4">
            <div class="input-group-prepend">
                <span class="input-group-text">Quantity</span>
            </div>
            <input  value="${product.quantity}" name="quantity" type="text" aria-label="Last name"
                   class="form-control">
            <%--            <small class="col-md-12" style="color: red"> ${error.area}</small>--%>
        </div>
        <div class="input-group mb-4">
            <div class="input-group-prepend">
                <span class="input-group-text">Color</span>
            </div>
            <input value="${product.color}" name="color" type="text" aria-label="Last name"
                   class="form-control">
            <%--            <small class="col-md-12" style="color: red"> ${error.area}</small>--%>
        </div>
        <div class="input-group my-4">
            <div class="input-group-prepend">
                <span class="input-group-text">Description</span>
            </div>
            <textarea name="description" rows="2" style="width: 80%">${product.description}</textarea>
        </div>

        <div class="input-group mb-4">
            <div class="input-group-prepend">
                <span class="input-group-text">Category</span>
            </div>
            <select name="categoryId">
                <c:forEach items="${categoryList}" var="category">
                    <c:if test="${category.categoryId == product.categoryId}">
                        <option value="${category.categoryId}" selected>${category.name}</option>
                    </c:if>
                </c:forEach>
                <c:forEach items="${categoryList}" var="category">
                    <c:if test="${category.categoryId != product.categoryId}">
                        <option value="${category.categoryId}">${category.name}</option>
                    </c:if>
                </c:forEach>
            </select>
        </div>
        <div class="form-inline d-flex justify-content-center">
            <button type="submit" class="btn btn-outline-info mx-2x mr-1">Lưu</button>
            <a href="/product ">
                <button type="button" class="btn btn-outline-info ">Hủy</button>
            </a>
        </div>
    </div>
</form>
</body>
</html>
