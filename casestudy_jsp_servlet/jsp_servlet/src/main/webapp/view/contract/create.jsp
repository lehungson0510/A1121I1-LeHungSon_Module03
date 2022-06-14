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


<%--***********************Navbar**************************--%>
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
            <input id="inputStartDay" style="width: 140px" class="form-control mr-sm-2 " type="search" name="nameSearch"
                   placeholder="Input Start Day" value="${nameSearch}" aria-label="name">
            <label for="inputStartDay"></label>
            <select id="rentType" name="positionSearch" class="form-control mr-sm-2">
                <option value="">Choose Employee</option>
                <c:forEach items="${positionList}" var="contract">
                    <option value="${contract.positionId}">${contract.positionName}</option>
                </c:forEach>
            </select>
            <select id="" name="divisionSearch" class="form-control mr-sm-2">
                <option value="">Choose Service</option>
                <c:forEach items="${divisionList}" var="division">
                    <option value="${division.divisionId}">${division.divisionName}</option>
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
            <h2 class="m-4">Create contract</h2>
            <c:if test="${message!=null}">
                <h3 class="text-success">${message}</h3>
            </c:if>
            <form class="container" method="post">
                <div class="form-row my-4">
                    <div class="form-group col-md-3">
                        <label for="employee">Employee</label>
                        <select id="employee" name="employee" class="form-control">
                            <option>Choose</option>
                            <c:forEach items="${employeeList}" var="contract">
                                <option value="${contract.getEmployeeId()}">${contract.getEmployeeName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="customer">Customer</label>
                        <select id="customer" name="customer" class="form-control">
                            <option>Choose...</option>
                            <c:forEach items="${customerList}" var="customer">
                                <option value="${customer.getCustomerId()}">${customer.getCustomerName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="service">Service</label>
                        <select id="service" name="service" class="form-control">
                            <option>Choose...</option>
                            <c:forEach items="${serviceList}" var="contract">
                                <option value="${contract.getServiceId()}">${contract.getServiceName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="inputName">Deposit</label>
                        <input type="text" name="deposit" class="form-control" id="inputName" aria-describedby="depositHelp">
                        <small id="depositHelp" class="form-text text-muted"><p class="text-danger">${error.get("deposit")}</p></small>
                    </div>
                </div>
                <div class="form-row my-4">
                    <div class="form-group col-md-4">
                        <label for="birthday">Start Date</label>
                        <input type="date" name="startDate" class="form-control" id="birthday" aria-describedby="startHelp">
                        <small id="startHelp" class="form-text text-muted"><p class="text-danger">${error.get("startDate")}</p></small>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="idCard">End Date</label>
                        <input type="date" name="endDate" class="form-control" id="idCard" aria-describedby="endtHelp">
                        <small id="endHelp" class="form-text text-muted"><p class="text-danger">${error.get("endDate")}</p></small>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="salary">Total Money</label>
                        <input type="text" name="totalMoney" class="form-control" id="salary" aria-describedby="totalHelp">
                        <small id="totalHelp" class="form-text text-muted"><p class="text-danger">${error.get("totalMoney")}</p></small>
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
