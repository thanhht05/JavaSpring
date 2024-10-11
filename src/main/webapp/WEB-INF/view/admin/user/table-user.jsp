<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <title>User</title>
  </head>
  <body>
    <div class="container mt-5">
      <div class="d-flex justify-content-between mb-3">
        <h2 class="title">Table user</h2>
        <a
          class="text-light text-decoration-none btn btn-success d-flex align-items-center"
          href="/admin/user/create"
          >Create new user</a
        >
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
                <button type="button" class="btn btn-danger">Delete</button>
                <button type="button" class="btn btn-warning">View</button>
                <button type="button" class="btn btn-info">Update</button>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </body>
</html>
