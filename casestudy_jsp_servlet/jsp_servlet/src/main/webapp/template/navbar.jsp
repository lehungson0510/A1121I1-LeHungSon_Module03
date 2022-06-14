<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/8/2022
  Time: 5:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="row col-md-12 p-0 m-0 sticky-top" style="background: #ffb77d">
    <%--    <div class="col-md-1 bg-light "></div>--%>
    <div class="col-7 d-flex justify-content-center align-items-center">
        <nav class="navbar navbar-expand-lg navbar-light d-flex justify-content-center align-items-center">
            <a class="navbar-brand px-5 " href="/home">Home</a>
            <a class="navbar-brand px-5 " href="/employee">Employee</a>
            <a class="navbar-brand px-5" href="/customer">Customer</a>
            <a class="navbar-brand px-5" href="/service">Service</a>
            <a class="navbar-brand px-5" href="/contract">Contract</a>
        </nav>
    </div>
    <div class="col-md-5 d-flex justify-content-end align-items-center">
        <form class="form-inline  my-2 my-lg-0" method="get">
            <label for="type"></label>
            <select id="type" name="typeSearch" class="form-control mr-sm-2">
                <option value="">Choose...</option>
                <c:forEach items="${customerTypeList}" var="contract">
                    <option value="${contract.customerTypeId}">${contract.customerTypeName}</option>
                </c:forEach>
            </select>
            <input style="width: 140px" class="form-control mr-sm-2 " type="search" name="nameSearch"
                   placeholder="Input name" aria-label="name">
            <input style="width: 140px" class="form-control mr-sm-2" type="search" name="addressSearch"
                   placeholder="Input address" aria-label="Search">
            <button type="submit" name="action" value="search" class="btn btn-warning btn-outline-secondary">Search
            </button>

        </form>
    </div>
</div>
</body>
</html>
