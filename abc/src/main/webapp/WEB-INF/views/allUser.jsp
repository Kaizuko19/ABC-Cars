<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ABC CARS | USERS</title>

<!--  Enable Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


<!--  Access the Static Resources without using spring URL -->
<link href="/css/style.css" rel="stylesheet" />
<script src="/js/script.js"></script>

</head>
<body>

<div class="container">
    <header class="header">
      <a href="#" class="logo">
        <img src="/images/home/ABC.png" width="128" height="200"  style="height: 200px; width: auto;">
      </a>
        <div class="searchnav">
            <sec:authorize access="hasAnyRole('Administrator','Users')">
                <sf:form action="search" method="get">
                    <div class="input-group">
                        <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" name="keyword" aria-describedby="search-addon" />
                        <button type="submit" class="btn search"><i class="bi bi-search"></i></button>
                    </div>
                </sf:form>
            </sec:authorize>
        </div>
      <nav class="navbar" data-navbar>
        <ul class="navbar-list">
         <sec:authorize access="hasRole('Users')">
                    <li><a href="cars" class="navbar-link">Home</a></li>
                </sec:authorize>
                <sec:authorize access="hasRole('Administrator')">
                    <li><a href="cars" class="navbar-link">Home</a></li>
                    <li><a href="all_cars" class="navbar-link">Cars</a></li>
                    <li><a href="users" class="navbar-link">Users</a></li>
                </sec:authorize>
                <sec:authorize access="hasAnyRole('Administrator','Users')">
                    <li><a href="profile" class="navbar-link">Profile</a></li>
                    <li>
                        <form action="logout" method="post" class="logout-form">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            <input type="submit" name="Logout" value="Logout" class="Logout"></input>
                        </form>
                    </li>
                </sec:authorize>
        </ul>
      </nav>
    </header>
  </div>

	<section>

<div class="container" style="color: white;">
  <h3 style="margin-bottom: 20px; color: white;">User Management</h3>

  <div class="row box" style="color: white;">
    <div class="col-12" style="color: white;">
      <table class="table table-bordered" style="color: white;">
        <thead style="color: white;">
          <tr style="color: white;">
            <th scope="col" style="color: white;">No.</th>
            <th scope="col" style="color: white;">Name</th>
            <th scope="col" style="color: white;">Username</th>
            <th scope="col" style="color: white;">Email</th>
            <th scope="col" style="color: white;">Role</th>
            <th scope="col" style="color: white;">Action</th>
          </tr>
        </thead>
        <tbody style="color: white;">
          <c:forEach items="${user}" var="u" varStatus="status">
            <tr style="color: white;">
              <th scope="row" style="color: white;">${status.count}</th>
              <td style="color: white;">${u.name}</td>
              <td style="color: white;">${u.userName}</td>
              <td style="color: white;">${u.email}</td>
              <c:forEach items="${u.roles}" var="r">
                <td style="color: white;">${r.name}
                  <!-- Button trigger modal -->
                  <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal1${status.index}">
                    <i class="fas fa-edit fa-sm" style="color: white;"></i>
                  </button>
                  <!-- Modal -->
                  <div class="modal fade" id="exampleModal1${status.index}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" role="dialog">
                    <div class="modal-dialog">
                      <div class="modal-content" style="color: black;">
                        <div class="modal-header">
                          <h5 class="modal-title" id="exampleModal1Label">Assign as Admin</h5>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          <!-- Assign Admin Form -->
                          <sf:form action="/assign_role?uid=${u.id}" method="post" class="was-validated" modelAttribute="user">
                            <div class="mb-3 mt-3">
                              <label for="name" class="form-label">Role:</label>
                              <input type="text" class="form-control" placeholder="Enter role" name="name" value="${r.name}" required="true" />
                              <div class="valid-feedback">Valid.</div>
                              <div class="invalid-feedback">Please fill out this field.</div>
                            </div>
                            <button type="submit" class="btn btn-primary">Assign</button>
                          </sf:form>
                        </div>
                      </div>
                    </div>
                  </div>
                </td>
              </c:forEach>
              <td>
                <a type="button" class="btn btn-primary" href="/view?uid=${u.id}">
                  <i class="far fa-eye" style="color: white;"></i>
                </a>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal${status.index}">
                  <i class="fas fa-edit" style="color: white;"></i>
                </button>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal${status.index}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" role="dialog">
                  <div class="modal-dialog">
                    <div class="modal-content" style="color: black;">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Edit User</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <!-- User Update Form -->
                        <sf:form action="/edit?uid=${u.id}" method="post" class="was-validated" modelAttribute="user">
                          <div class="mb-3 mt-3">
                            <label for="name" class="form-label">Name:</label>
                            <input type="text" class="form-control" placeholder="Enter name" name="name" value="${u.name}" required="true" />
                            <div class="valid-feedback">Valid.</div>
                            <div class="invalid-feedback">Please fill out this field.</div>
                          </div>
                          <div class="mb-3">
                            <label for="userName" class="form-label">Username:</label>
                            <input type="text" class="form-control" id="userName" placeholder="Enter username" name="userName" value="${u.userName}" required="true" />
                            <div class="valid-feedback">Valid.</div>
                            <div class="invalid-feedback">Please fill out this field.</div>
                          </div>
                          <div class="mb-3">
                            <label for="email" class="form-label">Email:</label>
                            <input type="email" class="form-control" placeholder="Enter username" name="email" value="${u.email}" required="true" />
                            <div class="valid-feedback">Valid.</div>
                            <div class="invalid-feedback">Please fill out this field.</div>
                          </div>
                          <div class="mb-3">
                            <label for="mobile" class="form-label">Mobile:</label>
                            <input type="text" class="form-control" id="mobile" placeholder="Enter mobile" name="mobile" value="${u.mobile}" required="true" />
                            <div class="valid-feedback">Valid.</div>
                            <div class="invalid-feedback">Please fill out this field.</div>
                          </div>
                          <div class="mb-3">
                            <label for="address" class="form-label">Address:</label>
                            <input type="text" class="form-control" id="address" placeholder="Enter address" name="address" value="${u.address}" required="true" />
                            <div class="valid-feedback">Valid.</div>
                            <div class="invalid-feedback">Please fill out this field.</div>
                          </div>
                          <button type="submit" class="btn btn-primary">Edit</button>
                        </sf:form>
                        <!-- User Update Form -->
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      </div>
                    </div>
                  </div>
                </div>
                <a type="button" class="btn btn-danger" href="/delete?uid=${u.id}">
                  <i class="far fa-trash-alt" style="color: white;"></i>
                </a>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>



	<%@ include file="footer.jsp"%>

	</div>
	</section>


</body>
</html>