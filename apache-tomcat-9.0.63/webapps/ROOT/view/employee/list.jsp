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

<%--****************************Navbar****************************--%>
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
                   placeholder="Input name" value="${nameSearch}" aria-label="name">
            <label for="type"></label>
            <select id="rentType" name="positionSearch" class="form-control mr-sm-2">
                <option value="">Choose position</option>
                <c:forEach items="${positionList}" var="employee">
                    <option value="${employee.positionId}">${employee.positionName}</option>
                </c:forEach>
            </select>
            <select id="type" name="divisionSearch" class="form-control mr-sm-2">
                <option value="">Choose Division</option>
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

<div class="row h-100 p-0 m-0 ">
    <%@include file="/template/sidebar.jsp" %>
    <div class="col-md-10 ">
        <center>
            <h2 class="m-4">List employee</h2>
            <c:if test="${message!=null}">
                <h3 class="text-success">${message}</h3>
            </c:if>
            <table class="table table-sm text-center" id="tableEmployee">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Birthday</th>
                    <th scope="col">ID Card</th>
                    <th scope="col">Salary</th>
                    <th scope="col">Phone</th>
                    <%--                    <th scope="col">Email</th>--%>
                    <%--                    <th scope="col">Address</th>--%>
                    <th scope="col">Position</th>
                    <th scope="col">Education</th>
                    <th scope="col">Division</th>
                    <th scope="col">User</th>
                    <th scope="col"><a class="m-1 " href="/employee?action=create">
                        <button type="button" class="btn btn-warning btn-outline-secondary">Create</button>
                    </a></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${employeeList}" var="contract" varStatus="status">
                    <tr class="text-left align-text-bottom">
                        <td>${contract.employeeId}</td>
                        <td>${contract.employeeName}</td>
                        <td>${contract.employeeBirthday}</td>
                        <td>${contract.employeeIdCard}</td>
                        <td>${contract.employeeSalary}</td>
                        <td>${contract.employeePhone}</td>
                            <%--                        <td>${employee.employeeEmail}</td>--%>
                            <%--                        <td>${employee.employeeAddress}</td>--%>
                        <c:forEach items="${positionList}" var="employee">
                            <c:if test="${contract.positionId==employee.positionId}">
                                <td>${employee.positionName}</td>
                            </c:if>
                        </c:forEach>
                        <c:forEach items="${educationDegreeList}" var="education">
                            <c:if test="${contract.educationDegreeId==education.educationDegreeId}">
                                <td>${education.educationDegreeName}</td>
                            </c:if>
                        </c:forEach>
                        <c:forEach items="${divisionList}" var="division">
                            <c:if test="${contract.divisionId==division.divisionId}">
                                <td>${division.divisionName}</td>
                            </c:if>
                        </c:forEach>
                        <td>${contract.username}</td>
                        <td class="mr-0">
                            <a href="/employee?action=edit&id=${contract.employeeId}">
                                <button type="button" class="btn text-light btn-success btn-outline-secondary">edit
                                </button>
                            </a>

                            <button type="button"
                                    onclick="showInfo('${contract.employeeId}','${contract.employeeName}')"
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

        <%--            ********************Thêm thẻ form *************************--%>

        <form action="employee">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <%--****************************** thêm *************************--%>
                    <input hidden type="text" id="idEmployee" name="id">
                    <span>Bạn có muốn xóa người dùng </span>
                    <span class="text-danger" id="nameEmployee"></span> không?<span/>
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
        $('#tableEmployee').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 7
        });
    });
</script>
<script>
    function showInfo(id, name) {
        document.getElementById("idEmployee").value = id;
        document.getElementById("nameEmployee").innerText = name;
    }
</script>
</body>
</body>
</html>
