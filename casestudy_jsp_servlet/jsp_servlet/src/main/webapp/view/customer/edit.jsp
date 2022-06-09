<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/8/2022
  Time: 7:34 PM
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
<%@include file="/template/header.jsp" %>
<%@include file="/template/navbar.jsp" %>
<div class="row h-100 p-0 m-0">
    <%@include file="/template/sidebar.jsp" %>
    <div class="col-md-10  " style="width: 100%">
        <center>
            <h2 class="m-4">Edit customerr</h2>
            <c:if test="${message!=null}">
                <h3 class="text-success">${message}</h3>
            </c:if>
            <form class="container" method="post">
                <c:if test="${customer != null}">
                    <input type="hidden" name="id" value="<c:out value='${customer.customerId}' />"/>
                </c:if>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputName">Name</label>
                        <input type="text" name="name" class="form-control" value="${customer.customerName}"
                               id="inputName">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="idCard">Id Card</label>
                        <input type="text" name="idCard" value="${customer.customerIdCard}" class="form-control"
                               id="idCard">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="phone">Phone</label>
                        <input type="text" name="phone" value="${customer.customerPhone}" class="form-control"
                               id="phone">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="email">Email</label>
                        <input type="text" name="email" value="${customer.customerEmail}" class="form-control"
                               id="email">
                    </div>
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="input" name="address" value="${customer.customerAddress}" class="form-control"
                           id="address">
                </div>
                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label for="birthday">Birthday</label>
                        <input type="date" name="birthday" value="${customer.customerBirthday}" class="form-control"
                               id="birthday">
                    </div>

                    <div class="form-group col-md-4">
                        <label for="type">Type</label>
                        <select id="type" name="type" class="form-control">
                            <c:forEach items="${customerTypeList}" var="position">
                                <c:if test="${position.customerTypeId==customer.customerTypeId}">
                                    <option value="${position.customerTypeId}">${position.customerTypeName} </option>
                                </c:if>
                            </c:forEach>
                            <c:forEach items="${customerTypeList}" var="position">
                                <option value="${position.customerTypeId}">${position.customerTypeName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group col-md-3 d-flex justify-content-center align-items-end">
                        <c:if test="${customer.customerGender == 1}">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" name="gender" type="radio" id="inlineCheckbox1"
                                       value="1" checked>
                                <label class="form-check-label" for="inlineCheckbox1">Nam</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" name="gender" type="radio" id="inlineCheckbox0"
                                       value="0">
                                <label class="form-check-label" for="inlineCheckbox0">Nữ</label>
                            </div>
                        </c:if>
                        <c:if test="${customer.customerGender == 0}">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" name="gender" type="radio" id="inlineCheckbox3"
                                       value="1">
                                <label class="form-check-label" for="inlineCheckbox3">Nam</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" name="gender" type="radio" id="inlineCheckbox4"
                                       value="0" checked>
                                <label class="form-check-label" for="inlineCheckbox4">Nữ</label>
                            </div>
                        </c:if>
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
