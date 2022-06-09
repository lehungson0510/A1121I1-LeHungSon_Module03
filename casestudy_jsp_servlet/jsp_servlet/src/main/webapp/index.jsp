<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/7/2022
  Time: 9:31 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="bootstrap4.6.0/css/bootstrap.min.css">
    <script src="jquery/jquery-3.6.0.min.js"></script>
    <script src="bootstrap4.6.0/js/bootstrap.min.js"></script>
</head>
<body>
<c:redirect url="/home"></c:redirect>

<%--*******************************header************************--%>
<div class="h-20 d-flex justify-content-between align-items-center px-5 py-3 bg-secondary">
    <img style="width: 50px; height: 50px; border-radius: 15px"
         src="https://d92mrp7hetgfk.cloudfront.net/images/sites/misc/CodeGym_square/original.png?1595884317">
    <span style="font-size: 22px" class="text-success ">Lê Hùng Sơn</span>
</div>

<%--*****************navbar*************************--%>
<div class="row col-md-12 p-0 m-0" style="background: #9fcdff">
    <%--    <div class="col-md-1 bg-light "></div>--%>
    <div class="col-8 d-flex justify-content-center align-items-center" style="background: #9fcdff">
        <nav class="navbar navbar-expand-lg navbar-light d-flex justify-content-center align-items-center">
            <a class="navbar-brand px-5 " href="/">Home</a>
            <a class="navbar-brand px-5 " href="#">Employee</a>
            <a class="navbar-brand px-5" href="#">Customer</a>
            <a class="navbar-brand px-5" href="#">Service</a>
            <a class="navbar-brand px-5" href="#">Contract</a>
        </nav>
    </div>
    <div class="col-md-4 d-flex justify-content-center align-items-center">
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</div>

<%--**********************Sidebar**********************--%>
<div class="row h-100 p-0 m-0" >
    <div class="col-md-2 text-center " style="background: #b0f0ff">
        <p>Item one</p>
        <p>Item two</p>
        <p>Item three</p>
    </div>

    <%--**********************Content***********************--%>
    <div class="col-md-10 d-flex justify-content-center align-items-center">
        <span>body</span>
    </div>
</div>

<%--****************************Footer***************************--%>
<div class="h-auto col-md-12 d-flex align-items-center justify-content-center" style="background: #e7e4ff">
    <span>Footer...</span>
</div>

</body>
</html>
