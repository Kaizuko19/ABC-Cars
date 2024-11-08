<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ABC CARS | CARS</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Chakra+Petch:wght@400;600;700&family=Mulish&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@40,600,0,0" />

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
  <div class="container">

<div class="content">
    <div class="container">
        <h3 style="margin-bottom: 20px; color: white; font-size: 25px;">Car Management</h3>
        <div class="row box" style="width: max-content;">
            <div class="col-12">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th scope="col" style="color: white; font-size: 10px;">No.</th>
                            <th scope="col" style="color: white; font-size: 10px;">Name</th>
                            <th scope="col" style="color: white; font-size: 10px;">Model</th>
                            <th scope="col" style="color: white; font-size: 10px;">Price (AUD)</th>
                            <th scope="col" style="color: white; font-size: 10px;">Seller</th>
                            <th scope="col" style="color: white; font-size: 10px;">Action</th>
                            <th scope="col" style="color: white; font-size: 10px;">Sell Car?</th>
                            <th scope="col" style="color: white; font-size: 10px;">Current Bid (RM)</th>
                            <th scope="col" style="color: white; font-size: 10px;">Booking Date</th>
                            <th scope="col" style="color: white; font-size: 10px;">Approve Booking?</th>
                            <th scope="col" style="color: white; font-size: 10px;">Bidder Name</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${cars}" var="c" varStatus="status">
                            <tr>
                                <th scope="row" style="color: white; font-size: 10px;">${status.count}</th>
                                <td style="color: white; font-size: 10px;">${c.name}</td>
                                <td style="color: white; font-size: 10px;">${c.model}</td>
                                <td style="color: white; font-size: 10px;">${c.price}</td>
                                <td><a type="button" class="btn btn-primary" href="/view?uid=${c.sellerId}"> <i class="far fa-eye"></i></a></td>
                                <td>
                                    <a type="button" class="btn btn-primary" href="/car_detail?cid=${c.id}"> <i class="far fa-eye"></i></a>
                                    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal${status.index}"><i class="fas fa-edit"></i></button>
                                    <div class="modal fade" id="exampleModal${status.index}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" role="dialog">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel" style="color: black;">Edit Car Post</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <sf:form action="/edit_car?cid=${c.id}" method="post" class="was-validated" modelAttribute="car" enctype="multipart/form-data">
                                                        <div class="mb-3 mt-3">
                                                            <label for="name" class="d-flex form-label" style="color: black;">Name:</label>
                                                            <input type="text" class="form-control" placeholder="Enter car name" name="name" path="name" required="true" value="${c.name}" />
                                                            <div class="valid-feedback">Valid.</div>
                                                            <div class="invalid-feedback">Please fill out this field.</div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="model" class="d-flex form-label" style="color: black;">Model:</label>
                                                            <input type="text" class="form-control" placeholder="Enter model" name="model" path="model" value="${c.model}" required="true" />
                                                            <div class="valid-feedback">Valid.</div>
                                                            <div class="invalid-feedback">Please fill out this field.</div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="price" class="d-flex form-label" style="color: black;">Price (RM):</label>
                                                            <input type="text" class="form-control" id="price" placeholder="Enter car price" name="price" path="price" value="${c.price}" required="true" />
                                                            <div class="valid-feedback">Valid.</div>
                                                            <div class="invalid-feedback">Please fill out this field.</div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="make" class="d-flex form-label" style="color: black;">Make Year:</label>
                                                            <input type="text" class="form-control" placeholder="Enter make year" name="make" path="make" value="${c.make}" required="true" />
                                                            <div class="valid-feedback">Valid.</div>
                                                            <div class="invalid-feedback">Please fill out this field.</div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="registeration" class="d-flex form-label" style="color: black;">Registration Date:</label>
                                                            <input type="text" class="form-control" id="registeration" placeholder="Enter registration date" name="registeration" path="registeration" value="${c.registeration}" required="true" />
                                                            <div class="valid-feedback">Valid.</div>
                                                            <div class="invalid-feedback">Please fill out this field.</div>
                                                        </div>
                                                        <input type="hidden" name="sellerId" value="${c.sellerId}" />
                                                        <input type="hidden" name="photos" value="${c.photos}" />
                                                        <input type="hidden" name="photoImagePath" value="${c.photoImagePath}" />
                                                        <div class="holder" style="height: 300px; width: 300px; margin: auto;">
                                                            <img id="imgPreview" src="${c.photoImagePath}" alt="image preview" style="width: inherit;" />
                                                        </div>
                                                        <button type="submit" class="btn btn-primary d-flex">Edit</button>
                                                    </sf:form>
                                                    <script>
                                                        $(document).ready(() => {
                                                            $("#photo").change(function () {
                                                                const file = this.files[0];
                                                                if (file) {
                                                                    let reader = new FileReader();
                                                                    reader.onload = function (event) {
                                                                        $("#imgPreview").attr("src", event.target.result);
                                                                    };
                                                                    reader.readAsDataURL(file);
                                                                }
                                                            });
                                                        });
                                                    </script>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <a type="button" class="btn btn-danger" href="/delete_car?cid=${c.id}"> <i class="far fa-trash-alt"></i></a>
                                </td>
                                <td style="color: white; font-size: 10px;">${c.sellStatus}
                                    <button type="button" class="btn" style="color: #ffffff;" data-bs-toggle="modal" data-bs-target="#exampleModal2${status.index}"><i class="fas fa-edit fa-sm"></i></button>
                                    <div class="modal fade" id="exampleModal2${status.index}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" role="dialog">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModal2Label" style="color: black;">Set Car Sale Status</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <sf:form action="/sale_status?cid=${c.id}" method="post" class="was-validated" modelAttribute="biddings">
                                                        <div class="mb-3 mt-3">
                                                            <label for="sellStatus" class="form-label" style="color: black;">Sale Status:</label>
                                                            <input type="text" class="form-control" placeholder="Enter sale status" name="sellStatus" value="${c.sellStatus}" required="true" />
                                                            <div class="valid-feedback">Valid.</div>
                                                            <div class="invalid-feedback">Please fill out this field.</div>
                                                        </div>
                                                        <button type="submit" class="btn btn-primary">Set</button>
                                                    </sf:form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <c:forEach items="${c.biddings}" var="b" begin="0" end="0">
                                    <td style="color: white; font-size: 10px;">${b.bidderPrice}</td>
                                    <td style="color: white; font-size: 10px;">${b.bookDate}</td>
                                    <td style="color: white; font-size: 10px;">${b.bookStatus}
                                        <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal1${status.index}"><i class="fas fa-edit fa-sm"></i></button>
                                        <div class="modal fade" id="exampleModal1${status.index}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" role="dialog">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModal1Label" style="color: black;">Set Booking Status</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <sf:form action="/booking_status?bid=${b.id}" method="post" class="was-validated" modelAttribute="book">
                                                            <div class="mb-3 mt-3">
                                                                <label for="bookStatus" class="form-label" style="color: black;">Booking Status:</label>
                                                                <input type="text" class="form-control" placeholder="Enter booking status" name="bookStatus" value="${b.bookStatus}" required="true" />
                                                                <div class="valid-feedback">Valid.</div>
                                                                <div class="invalid-feedback">Please fill out this field.</div>
                                                            </div>
                                                            <button type="submit" class="btn btn-primary">Set</button>
                                                        </sf:form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="color: white; font-size: 10px;">${b.bidderName}</td>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<%@ include file="footer.jsp"%>

</body>
</html>
