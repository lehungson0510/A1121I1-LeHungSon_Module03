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
<center>
    <form method="get" class="container w-50 mt-3">
        <div class="input-group mb-3">
            <input name="nameSearch" placeholder="Search" type="text" aria-label="First name" class="form-control mr-3">
            <button type="submit" name="action" value="search" class="btn btn-outline-info ">Search</button>
            <a href="/product?action=create">
                <button type="button" name="action" value="create" class="btn btn-outline-info ">Add new product
                </button>
            </a>
            <a href="/product" class="">
                <button type="button" name="action" value="create" class="btn btn-outline-info ">Quay lại
                </button>
            </a>
        </div>
    </form>
</center>

<center>
    <h2 class="m-4">Product</h2>
    <c:if test="${message!=null}">
        <h3 class="text-primary">${message}</h3>
    </c:if>
    <table class="table table-sm text-center">
        <%--        id="tableList--%>
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Product Name</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Color</th>
            <th scope="col">Category</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${productList}" var="product" varStatus="status">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.quantity}</td>
                <td>${product.color}</td>
                <c:forEach items="${categoryList}" var="category">
                    <c:if test="${category.categoryId==product.categoryId}">
                        <td>${category.name}</td>
                    </c:if>
                </c:forEach>
                <td>
                    <a href="/product?action=edit&id=${product.id}">
                        <button type="button" class="btn text-dark btn-outline-info">edit
                        </button>
                    </a>
                    <button type="button"
                            onclick="showInfo('${product.id}','${product.name}')"
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
        <form action="product">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-danger" id="exampleModalLabel">Xác nhận xóa</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <%--****************************** thêm *************************--%>
                    <input hidden type="text" id="idProduct" name="id">
                    <span>Bạn có muốn xóa sản phầm với tên  </span>
                    <span class="text-danger" id="nameProduct"></span> không?<span/>
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
        document.getElementById("idProduct").value = id;
        document.getElementById("nameProduct").innerText = name;
    }
</script>
</body>
</html>
