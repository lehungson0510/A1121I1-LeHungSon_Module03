<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/8/2022
  Time: 7:33 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap4.6.0/css/bootstrap.min.css">
    <script src="jquery/jquery-3.6.0.min.js"></script>
    <script src="bootstrap4.6.0/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="/template/header.jsp" %>

<%--*********************Navbar*************************--%>
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
            <input style="width: 140px" class="form-control mr-sm-2 " type="search" name="nameSearch"
                   placeholder="Input name" aria-label="name">
            <label for="type"></label>
            <select id="rentType" name="typeSearch" class="form-control mr-sm-2">
                <option value="">Choose Rent Type</option>
                <c:forEach items="${rentTypeList}" var="position">
                    <option value="${position.rentTypeId}">${position.rentTypeName}</option>
                </c:forEach>
            </select>
            <select id="typeSearch" name="typeSearch" class="form-control mr-sm-2">
                <option value="">Choose Type</option>
                <c:forEach items="${serviceTypeList}" var="position">
                    <option value="${position.serviceTypeId}">${position.serviceTypeName}</option>
                </c:forEach>
            </select>
            <label for="rentType"></label>
            <button type="submit" name="action" value="search" class="btn btn-warning btn-outline-secondary">Search
            </button>

        </form>
    </div>
</div>

<div class="row h-100 p-0 m-0">
    <%@include file="/template/sidebar.jsp" %>
    <div class="col-md-10  " style="width: 100%">
        <center>
            <h2 class="m-4">Create service</h2>
            <c:if test="${message!=null}">
                <h3 class="text-success">${message}</h3>
            </c:if>
            <form class="container" method="post">
                <div class="form-row my-4">
                    <div class="form-group col-md-6">
                        <label for="inputName">Name</label>
                        <input type="text" name="name" class="form-control" id="inputName">
                    </div>
                    <div class="form-group col-md-3">
                        <label for="type">Type</label>
                        <select id="type" name="type" class="form-control">
                            <option>Choose...</option>
                            <c:forEach items="${serviceTypeList}" var="position">
                                <option value="${position.serviceTypeId}">${position.serviceTypeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="rent">Rent Type</label>
                        <select id="rent" name="rentType" class="form-control">
                            <option>Choose...</option>
                            <c:forEach items="${rentTypeList}" var="position">
                                <option value="${position.rentTypeId}">${position.rentTypeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-row my-4">
                    <div class="form-group col-md-4">
                        <label for="standard">Standard room</label>
                        <input type="text" name="standardRoom" class="form-control" id="standard">
                    </div>
                    <div class="form-group col-md-4">
                        <label for="floors">Floors</label>
                        <input type="text" name="numOfFloors" class="form-control" id="floors">
                    </div>
                    <div class="form-group col-md-4">
                        <label for="maxPeople">Max people</label>
                        <input type="text" name="maxPeople" class="form-control" id="maxPeople">
                    </div>
                </div>
                <div class="form-row my-4">
                    <div class="form-group col-md-12">
                        <label for="description">Description Other Convenience</label>
                        <input type="text" name="description" class="form-control" id="description">
                    </div>
                </div>
                <div class="form-row my-4">
                    <div class="form-group col-md-4">
                        <label for="area">Area</label>
                        <input type="text" name="area" class="form-control" id="area">
                    </div>
                    <div class="form-group col-md-4">
                        <label for="cost">Cost</label>
                        <input type="text" name="cost" class="form-control" id="cost">
                    </div>
                    <div class="form-group col-md-4">
                        <label for="pool">Pool area</label>
                        <input type="text" name="poolArea" class="form-control" id="pool">
                    </div>
                </div>
                <button type="submit" class="btn btn-warning btn-outline-success">Save</button>
            </form>
        </center>
    </div>
</div>

<%@include file="/template/footer.jsp" %>
</body>
</html>
