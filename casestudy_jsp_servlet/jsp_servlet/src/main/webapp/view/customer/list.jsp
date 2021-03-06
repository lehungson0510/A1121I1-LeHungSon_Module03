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
<%@include file="/template/navbar.jsp" %>
<div class="row h-100 p-0 m-0 ">
    <%@include file="/template/sidebar.jsp" %>
    <div class="col-md-10 ">
        <center>
            <h2 class="m-4">List customer</h2>
            <c:if test="${message!=null}">
                <h3 class="text-success">${message}</h3>
            </c:if>
            <table class="table table-sm text-center" id="tableCustomer">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Type</th>
                    <th scope="col">Birthday</th>
                    <th scope="col">Gender</th>
                    <th scope="col">ID Card</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Email</th>
                    <th scope="col">Address</th>
                    <th scope="col"></th>
                    <th scope="col"><a href="/customer?action=create">
                        <button type="button" class="btn btn-warning btn-outline-secondary">Create</button>
                    </a></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${customerList}" var="customer" varStatus="status">
                    <tr class="text-left align-text-bottom">
                        <td class="text-left align-text-bottom">${customer.customerId}</td>
                        <td>${customer.customerName}</td>
                        <c:forEach items="${customerTypeList}" var="customerType">
                            <c:if test="${customer.customerTypeId==customerType.customerTypeId}">
                                <td>${customerType.customerTypeName}</td>
                            </c:if>
                        </c:forEach>
                        <td>${customer.customerBirthday}</td>
                        <c:if test="${customer.customerGender==1}">
                            <td>Nam</td>
                        </c:if>
                        <c:if test="${customer.customerGender==0}">
                            <td>N???</td>
                        </c:if>
                        <td>${customer.customerIdCard}</td>
                        <td>${customer.customerPhone}</td>
                        <td style="word-break: break-word">${customer.customerEmail}</td>
                        <td style="word-break: break-word">${customer.customerAddress}</td>
                        <td>
                            <a href="/customer?action=edit&id=${customer.customerId}">
                                <button type="button" class="btn text-light btn-success btn-outline-secondary">edit
                                </button>
                            </a>
                        </td>
                        <td>
                            <button type="button"
                                    onclick="showInfo('${customer.customerId}','${customer.customerName}')"
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
        <%--            **********Th??m th??? form **************--%>
        <form action="customer">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <%--****************************** th??m *************************--%>
                    <input hidden type="text" id="idCustomer" name="id">
                    <span>B???n c?? mu???n x??a ng?????i d??ng </span>
                    <span class="text-danger" id="nameCustomer"></span> kh??ng?<span/>
                    <%--*************************************************************--%>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Kh??ng</button>
                    <%--*********************** Chuy???n type button sang submit **********************--%>
                    <button type="submit" name="action" value="delete" class="btn btn-primary">C??</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 6
        });
    });
</script>
<script>
    function showInfo(id, name) {
        document.getElementById("idCustomer").value = id;
        document.getElementById("nameCustomer").innerText = name;
    }
</script>
</body>
</html>
