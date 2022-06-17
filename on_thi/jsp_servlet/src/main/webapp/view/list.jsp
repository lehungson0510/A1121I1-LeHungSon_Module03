<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/14/2022
  Time: 1:38 AM
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
<%--******************** Form để search *************************--%>
<form method="get" class="container w-50">
    <div class="form-inline mb-3 " style="margin-left: -15px">
        <div class="input-group m-3  ">
            <div class="input-group-prepend">
                <label class="input-group-text" for="1">Loại mặt bằng</label>
            </div>
            <select name="typeOfficeSearch" class="custom-select" id="1">--%>
                <option value="" selected>Cho thuê</option>
                <c:forEach items="${typeOfficeList}" var="typeOffice">
                    <option value="${typeOffice.typeOfficeId}">${typeOffice.name}</option>
                </c:forEach>
            </select>

        </div>

        <div class="input-group m-3">
            <div class="input-group-prepend">
                <label class="input-group-text" for="2">Tầng</label>
            </div>
            <select name="floorsSearch" class="custom-select" id="2">--%>
                <option value="">Chọn</option>
                <c:forEach items="${listFloors}" var="listFloors">
                    <option>${listFloors}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text">Giá cho thuê</span>
        </div>
        <input name="priceSearch" placeholder="Từ" type="text" aria-label="First name" class="form-control mr-3">
        <input name="endRentalPriceSearch" placeholder="Đến" type="text" aria-label="Last name" class="form-control mx-3">
    </div>
    <center>
        <button type="submit" name="action" value="search" class="btn btn-outline-info ">Search</button>
        <a href="/ground?action=create"><button type="button" name="action" value="create" class="btn btn-outline-info ">Create</button></a>
    </center>
</form>


<center >
    <h2 class="m-4">Ground</h2>
    <c:if test="${message!=null}">
        <h3 class="text-primary">${message}</h3>
    </c:if>
    <table class="table table-sm text-center" >
<%--        id="tableList--%>
        <thead>
        <tr>
            <th scope="col">Mã MB</th>
            <th scope="col">Diện tích</th>
            <th scope="col">Trạng thái</th>
            <th scope="col">Tầng</th>
            <th scope="col">Loại văn phòng</th>
            <th scope="col">Giá cho thuê</th>
            <th scope="col">Ngày bắt đầu</th>
            <th scope="col">Ngày kết thúc</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${groundList}" var="ground" varStatus="status">
            <tr>
                <td>${ground.id}</td>
                <td>${ground.area}</td>
                <c:forEach items="${statusList}" var="status">
                    <c:if test="${status.statusId==ground.statusId}">
                        <td>${status.name}</td>
                    </c:if>
                </c:forEach>
                <td>${ground.floors}</td>
                <c:forEach items="${typeOfficeList}" var="typeOffice">
                    <c:if test="${typeOffice.typeOfficeId==ground.typeOfficeId}">
                        <td>${typeOffice.name}</td>
                    </c:if>
                </c:forEach>
                <td>${ground.rentalPrice}</td>
                <td>${ground.startDate}</td>
                <td>${ground.endDate}</td>
                <td>
                    <a href="/ground?action=edit&id=${ground.id}">
                        <button type="button" class="btn text-dark btn-outline-info">edit
                        </button>
                    </a>
                    <button type="button"
                            onclick="showInfo('${ground.id}','${ground.id}')"
                            class="btn text-dark btn-outline-info"
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
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <%--            **********Thêm thẻ form **************--%>
        <form action="ground">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-danger" id="exampleModalLabel">Xác nhận xóa</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <%--****************************** thêm *************************--%>
                    <input hidden type="text" id="idGround" name="id">
                    <span>Bạn có muốn xóa mặt bằng với mã  </span>
                    <span class="text-danger" id="nameGround"></span> không?<span/>
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
        $('#tableList').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 6
        });
    });
</script>
<script>
    function showInfo(id, name) {
        document.getElementById("idGround").value = id;
        document.getElementById("nameGround").innerText = name;
    }
</script>
</body>
</html>
