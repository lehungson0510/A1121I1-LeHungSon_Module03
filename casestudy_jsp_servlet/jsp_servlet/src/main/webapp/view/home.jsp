<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/7/2022
  Time: 10:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap4.6.0/css/bootstrap.min.css">
    <script src="jquery/jquery-3.6.0.min.js"></script>
    <script src="bootstrap4.6.0/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="/template/header.jsp"%>
<div class="row col-md-12 p-0 m-0 sticky-top" style="background: #ffb77d">
    <%--    <div class="col-md-1 bg-light "></div>--%>
    <div class="col-md-1"></div>
    <div class="col-md-7 d-flex justify-content-center align-items-center">
        <nav class="navbar navbar-expand-lg navbar-light d-flex justify-content-center align-items-center">
            <a class="navbar-brand px-5 " href="/home">Home</a>
            <a class="navbar-brand px-5 " href="/employee">Employee</a>
            <a class="navbar-brand px-5" href="/customer">Customer</a>
            <a class="navbar-brand px-5" href="/service">Service</a>
            <a class="navbar-brand px-5" href="/contract">Contract</a>
        </nav>
    </div>
    <div class="col-md-4 d-flex justify-content-center align-items-center">
        <form class="form-inline  my-2 my-lg-0" method="get">
            <input id="type" style="width: 200px" class="form-control mr-sm-2 " type="search" name="nameSearch"
                   placeholder="Input..." value="${nameSearch}" aria-label="name">
            <label for="type"></label>
            <button type="submit" name="action" value="search" class="btn btn-warning btn-outline-secondary">Search
            </button>
        </form>
    </div>
</div>
<%@include file="/template/content.jsp"%>
<%@include file="/template/footer.jsp"%>
</body>
</html>
