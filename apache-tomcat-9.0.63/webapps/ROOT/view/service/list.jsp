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
    <script src="jquery/jquery-3.5.1.min.js"></script>
    <script src="bootstrap4.6.0/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="/template/header.jsp" %>
<%--*******************Navbar**********************--%>
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
            <select id="type" name="typeSearch" class="form-control mr-sm-2">
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

<%--**************Content******************--%>
<div class="row h-100 p-0 m-0 ">
    <%@include file="/template/sidebar.jsp" %>
    <div class="col-md-10 ">
        <center>
            <h2 class="m-4">List service</h2>
            <c:if test="${message!=null}">
                <h3 class="text-success">${message}</h3>
            </c:if>
            <table class="table table-sm text-center" id="tableService">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Area</th>
                    <th scope="col">Cost </th>
                    <th scope="col">Max people</th>
                    <th scope="col">Rent Type</th>
                    <th scope="col">Type</th>
                    <th scope="col">Standard room</th>
                    <th scope="col">Description</th>
                    <th scope="col">Pool Area</th>
                    <th scope="col">Floors</th>
                    <th scope="col"><a class="m-1" href="/service?action=create">
                        <button type="button" class="btn btn-warning btn-outline-secondary">Create</button>
                    </a></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${serviceList}" var="employee" varStatus="status">
                    <tr class="text-left align-text-bottom">
                        <td class="text-left align-text-bottom">${employee.serviceId}</td>
                        <td>${employee.serviceName}</td>
                        <td>${employee.serviceArea}</td>
                        <td>${employee.serviceCost}</td>
                        <td>${employee.serviceMaxPeople}</td>
                        <c:forEach items="${rentTypeList}" var="position">
                            <c:if test="${employee.rentTypeId==position.rentTypeId}">
                                <td>${position.rentTypeName}</td>
                            </c:if>
                        </c:forEach>
                        <c:forEach items="${serviceTypeList}" var="position">
                            <c:if test="${employee.serviceTypeId==position.serviceTypeId}">
                                <td>${position.serviceTypeName}</td>
                            </c:if>
                        </c:forEach>
                        <td>${employee.standardRoom}</td>
                        <td>${employee.descriptionOtherConvenience}</td>
                        <td>${employee.poolArea}</td>
                        <td>${employee.numberOfFloors}</td>
                        <td>
                            <a href="/customer?action=edit&id=${employee.serviceId}">
                                <button type="button" class="btn text-light btn-success btn-outline-secondary">edit
                                </button>
                            </a>
                            <button type="button"
                                    onclick="showInfo('${employee.serviceId}','${employee.serviceName}')"
                                    class="btn btn-success text-light btn-outline-dark"
                                    data-toggle="modal"
                                    data-target="#exampleModal">
                                delete
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </center>
    </div>
</div>
<%@include file="/template/footer.jsp" %>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <%--            **********Thêm thẻ form **************--%>
        <form action="service">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <%--****************************** thêm *************************--%>
                    <input hidden type="text" id="serviceId" name="id">
                    <span>Bạn có muốn xóa người dùng </span>
                    <span class="text-danger" id="serviceName"></span> không?<span/>
                    <%--*************************************************************--%>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Không</button>
                    <%--*********************** Chuyển type button sang submit **********************--%>
                    <button type="submit" name="action" value="delete" class="btn btn-primary">Có</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableService').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 7
        });
    });
</script>
<script>
    function showInfo(id, name) {
        document.getElementById("serviceId").value = id;
        document.getElementById("serviceName").innerText = name;
    }
</script>
</body>
</body>
</html>
