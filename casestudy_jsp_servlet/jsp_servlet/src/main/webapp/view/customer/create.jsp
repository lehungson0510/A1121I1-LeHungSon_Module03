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
<%@include file="/template/navbar.jsp" %>

<div class="row h-100 p-0 m-0">
    <%@include file="/template/sidebar.jsp" %>
    <div class="col-md-10  " style="width: 100%">
        <center>
            <h2 class="m-4">Create customer</h2>
            <c:if test="${message!=null}">
                <h3 class="text-success">${message}</h3>
            </c:if>
            <form class="container" method="post">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputName">Name</label>
                        <input type="text" name="name" class="form-control" id="inputName">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="idCard">Id Card</label>
                        <input type="text" name="idCard" class="form-control" id="idCard" aria-describedby="idHelp">
                        <small id="idHelp" class="form-text text-muted"><p class="text-danger">${error.get("idCard")}</p></small>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="phone">Phone</label>
                        <input type="text" name="phone" class="form-control" id="phone" aria-describedby="phoneHelp">
                        <small id="phoneHelp" class="form-text text-muted"><p class="text-danger">${error.get("phone")}</p></small>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="email">Email</label>
                        <input type="text" name="email" class="form-control" id="email" aria-describedby="emailHelp">
                        <small id="emailHelp" class="form-text text-muted"><p class="text-danger">${error.get("email")}</p></small>
                    </div>
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="input" name="address" class="form-control" id="address">
                </div>
                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label for="birthday">Birthday</label>
                        <input type="date" name="birthday" class="form-control" id="birthday" ria-describedby="birthdayHelp">
                        <small id="birthdayHelp" class="form-text text-muted"><p class="text-danger">${error.get("birthday")}</p></small>
                    </div>

                    <div class="form-group col-md-4">
                        <label for="type">Type</label>
                        <select id="type" name="type" class="form-control">
                            <option>Choose...</option>
                            <c:forEach items="${customerTypeList}" var="employee">
                                <option value="${employee.customerTypeId}">${employee.customerTypeName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group col-md-3 d-flex justify-content-center align-items-end">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" name="gender" type="checkbox" id="inlineCheckbox1"
                                   value="1">
                            <label class="form-check-label" for="inlineCheckbox1">Nam</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" name="gender" type="checkbox" id="inlineCheckbox0"
                                   value="0">
                            <label class="form-check-label" for="inlineCheckbox0">Nữ</label>
                        </div>
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
