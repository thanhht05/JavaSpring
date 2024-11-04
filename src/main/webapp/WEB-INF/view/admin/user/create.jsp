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
        <title>Create User</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
          $(document).ready(() => {
            const avatarFile = $("#avatarFile");
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
                    <a href="/admin/user">User</a>
                  </li>
                  <li class="breadcrumb-item active">
                    <a href="/admin/user/create">Create user</a>
                  </li>
                </ol>

                <div class="col-md-6 col-12 mx-auto">
                  <form:form method="post" action="/admin/user/create" modelAttribute="newUser"
                    enctype="multipart/form-data">
                    <div class="mb-3">
                      <label for="exampleInputEmail1" class="form-label">Email</label>
                      <form:input type="email" class="form-control" id="exampleInputEmail1" path="email" />
                    </div>
                    <div class="mb-3">
                      <label for="pass" class="form-label">Password</label>
                      <form:input type="password" class="form-control" id="pass" path="password" />
                    </div>

                    <div class="mb-3">
                      <label for="PhoneNumber" class="form-label">Phone Number</label>
                      <form:input type="tel" class="form-control" id="PhoneNumber" path="phone" />
                    </div>

                    <div class="mb-3">
                      <label for="name" class="form-label">Full Name</label>
                      <form:input type="text" class="form-control" id="name" path="fullName" />
                    </div>

                    <div class="mb-3">
                      <label for="address" class="form-label">Address</label>
                      <form:input type="text" class="form-control" id="address" path="address" />
                    </div>
                    <div class="mb-3 form-check">
                      <input type="checkbox" class="form-check-input" id="exampleCheck1" />
                      <label class="form-check-label" for="exampleCheck1">Check me out</label>
                    </div>
                    <div class="form-upload">
                      <div class="mb-3">
                        <label for="formFile" class="form-label">Avatar</label>
                        <input class="form-control" type="file" id="avatarFile" name="fileName"
                          accept=".png, .jpg, .jpeg">
                      </div>
                      <div class="col-12 mb-3">
                        <img style="max-height: 250px; display: none;" alt="avatar preview" id="avatarPreview" />
                      </div>

                      <form:select class="form-select form-select-sm mb-3" aria-label="Small select example"
                        path="role.name">
                        <form:option value="ADMIN">ADMIN</form:option>
                        <form:option value="USER">USER</form:option>
                      </form:select>

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