<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <title>User</title>
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
                                            <a href="/admin/user">User</a>
                                        </li>
                                    </ol>

                                    <div class=" mt-5">
                                        <div class="d-flex justify-content-between mb-3">
                                            <h2 class="title">Table user</h2>
                                            <a class="text-light text-decoration-none btn btn-success d-flex align-items-center"
                                                href="/admin/user/create">Create new user</a>
                                        </div>
                                        <table class="table table-bordered table-responsive-sm">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Email</th>
                                                    <th scope="col">Full name</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="userItem" items="${users}">
                                                    <tr>
                                                        <th scope="row">${userItem.id}</th>
                                                        <td>${userItem.email}</td>
                                                        <td>${userItem.fullName}</td>
                                                        <td>
                                                            <a href="/admin/user/${userItem.id}"
                                                                class="btn btn-danger">View
                                                            </a>
                                                            <a class="btn btn-info"
                                                                href="/admin/user/update/${userItem.id}">Update</a>
                                                            <a class="btn btn-warning"
                                                                href="/admin/product/delete/${userItem.id}">Delete</a>
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