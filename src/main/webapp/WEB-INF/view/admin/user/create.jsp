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
    <title>Create User</title>
  </head>
  <body>
    <div class="container">
      <div class="row">
        <h2 class="text-center">Create new user</h2>
        <div class="col-md-6 col-12 mx-auto">
          <form:form
            method="post"
            action="/admin/user/create"
            modelAttribute="newUser"
          >
            <div class="mb-3">
              <label for="exampleInputEmail1" class="form-label">Email</label>
              <form:input
                type="email"
                class="form-control"
                id="exampleInputEmail1"
                path="email"
              />
            </div>
            <div class="mb-3">
              <label for="pass" class="form-label">Password</label>
              <form:input
                type="password"
                class="form-control"
                id="pass"
                path="password"
              />
            </div>

            <div class="mb-3">
              <label for="PhoneNumber" class="form-label">Phone Number</label>
              <form:input
                type="tel"
                class="form-control"
                id="PhoneNumber"
                path="phone"
              />
            </div>

            <div class="mb-3">
              <label for="name" class="form-label">Full Name</label>
              <form:input
                type="text"
                class="form-control"
                id="name"
                path="fullName"
              />
            </div>

            <div class="mb-3">
              <label for="address" class="form-label">Address</label>
              <form:input
                type="text"
                class="form-control"
                id="address"
                path="address"
              />
            </div>
            <div class="mb-3 form-check">
              <input
                type="checkbox"
                class="form-check-input"
                id="exampleCheck1"
              />
              <label class="form-check-label" for="exampleCheck1"
                >Check me out</label
              >
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
          </form:form>
        </div>
      </div>
    </div>
  </body>
</html>
