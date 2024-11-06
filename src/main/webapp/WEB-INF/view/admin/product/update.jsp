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
                <title>Update Product</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        const orgImage = "${product.image}";
                        if (orgImage) {
                            const urlImage = "/images/product/" + orgImage;
                            $("#avatarPreview").attr("src", urlImage);
                            $("#avatarPreview").css({ "display": "block" });
                        }

                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>

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
                                        <a href="/admin/product">Product</a>
                                    </li>
                                    <li class="breadcrumb-item active">
                                        <a href="/admin/product/update">Update product</a>
                                    </li>
                                </ol>

                                <div class="col-md-6 col-12 mx-auto">
                                    <form:form method="post" action="/admin/product/update" modelAttribute="product"
                                        enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="mb-3 d-none">
                                                <label for="exampleInputEmail1" class="form-label">Id</label>
                                                <form:input type="text" class="form-control " id="ID" path="id" />
                                            </div>
                                            <div class="mb-3 col-6">
                                                <label for="exampleInputEmail1" class="form-label">Name</label>
                                                <form:input type="text" class="form-control" id="exampleInputEmail1"
                                                    path="name" />
                                            </div>
                                            <div class="mb-3 col-6">
                                                <label for="pass" class="form-label">Price</label>
                                                <form:input type="number" class="form-control" id="pass" path="price"
                                                    value="0" />
                                            </div>

                                            <div class="mb-3 col-6">
                                                <label for="PhoneNumber" class="form-label">Quantity</label>
                                                <form:input type="number" class="form-control" id="PhoneNumber"
                                                    path="quantity" />
                                            </div>

                                            <div class="mb-3 col-6">
                                                <label for="address" class="form-label">Sold</label>
                                                <form:input type="number" class="form-control" id="address"
                                                    path="sold" />
                                            </div>
                                            <div class="mb-3 col-6">
                                                <label class="form-label">Detail description:</label>
                                                <div class="form-floating">
                                                    <form:textarea path="detailDesc" class="form-control"
                                                        id="floatingTextarea" />
                                                </div>

                                            </div>

                                            <div class="mb-3 col-6">
                                                <label class="form-label">Short description:</label>
                                                <div class="form-floating">
                                                    <form:textarea path="shortDesc" class="form-control"
                                                        id="floatingTextarea" />
                                                </div>
                                            </div>
                                            <div class="mb-3 col-6">
                                                <label for="address" class="form-label">Factory</label>
                                                <form:select path="factory" class="form-select"
                                                    aria-label="Small select example">
                                                    <form:option value="Acer">Acer</form:option>
                                                    <form:option value="Nitro">Nitro</form:option>
                                                    <form:option value="Asus">Asus</form:option>
                                                    <form:option value="MacBook">MacBook</form:option>
                                                </form:select>
                                            </div>
                                            <div class="mb-3 col-6">
                                                <label for="address" class="form-label">Target</label>
                                                <form:select class="form-select" path="target"
                                                    aria-label="Small select example">
                                                    <form:option value="Gaming">Gaming</form:option>
                                                    <form:option value="Study">Study</form:option>
                                                    <form:option value="Office">Office</form:option>
                                                </form:select>
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label for="avatarFile" class="form-label">Image:</label>
                                                <input class="form-control" type="file" id="avatarFile"
                                                    accept=".png, .jpg, .jpeg" name="productFile" />
                                            </div>
                                            <div class="col-12 mb-3">
                                                <img style="max-height: 250px; display: none;" alt="avatar preview"
                                                    id="avatarPreview" />
                                            </div>


                                        </div>



                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </form:form>
                                </div>

                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>


            </body>

            </html>