<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <title>Product</title>
                    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
                        rel="stylesheet" />
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <div id="layoutSidenav_nav">
                            <jsp:include page="../layout/sidebar.jsp" />
                        </div>
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">User</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item active">
                                            <a href="/admin">Dashboard</a>
                                        </li>
                                        <li class="breadcrumb-item active">
                                            <a href="/admin/user">Product</a>
                                        </li>
                                    </ol>

                                    <div class=" mt-5">
                                        <div class="d-flex justify-content-between mb-3">
                                            <h2 class="title">Product list</h2>
                                            <a class="text-light text-decoration-none btn btn-success d-flex align-items-center"
                                                href="/admin/product/create">Create new product</a>
                                        </div>
                                        <table class="table table-bordered table-responsive-sm">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Factory</th>
                                                    <th scope="col">Price</th>
                                                    <th scope="col">Target</th>
                                                    <th scope="col">Quantity</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="productItem" items="${products}">
                                                    <tr>
                                                        <th>${productItem.name}</th>
                                                        <td>${productItem.factory}</td>
                                                        <td>
                                                            <fmt:formatNumber value="${productItem.price}"
                                                                type="number" />

                                                        </td>
                                                        <td>${productItem.target}</td>
                                                        <td>${productItem.quantity}</td>
                                                        <td>
                                                            <a href="/admin/product/${productItem.id}"
                                                                class="btn btn-danger">View
                                                            </a>
                                                            <a class="btn btn-info"
                                                                href="/admin/product/update/${productItem.id}">Update</a>
                                                            <a class="btn btn-warning"
                                                                href="/admin/product/delete/${productItem.id}">Delete</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </main>
                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                        crossorigin="anonymous"></script>
                </body>

                </html>