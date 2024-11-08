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
<title>ABC CARS | BROWSE FOR SOME CARS</title>
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
<body >


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
		<sec:authorize access="hasRole('Users')">
			<!-- post car link-->
			<div class="row p-3 mb-5 box1" style="background-color: hsl(222, 44%, 18%); height: 90px; width: 102.4%;">
				<div class="col-5">
					<p class="text-white font-weight-bold"
						style="margin-bottom: 0px; font-weight: bolder;">Sell Your Car
						Today!</p>
					<p class="text-white" style="margin-bottom: 0px;">Sell Your Car
						conveniently with Us</p>
				</div>
				<div class="col-4"></div>
				<div class="col col-lg-2" style="text-align: end; margin: auto;">
					<span class=""> <!-- Button trigger modal -->
						<button type="button" class="btn button1" data-bs-toggle="modal"
							data-bs-target="#exampleModal" style="background-color:maroon; color: #ffffff;">
							Sell Now</button>
					</span>
					<!-- Modal -->

					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true"
						role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">

								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Sell Your
										Car Today!</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body dark-mode">
    <c:if test="${success_post != null}">
        <div class="alert alert-success">${success_post}</div>
    </c:if>

    <!-- Car Post Form -->
    <sf:form action="car_post" method="post" class="was-validated" modelAttribute="car" enctype="multipart/form-data">
        <div class="mb-3 mt-3">
            <label for="name" class="d-flex form-label text-light">Name:</label>
            <sf:input type="text" class="form-control dark-input bg-dark text-light" placeholder="Enter car name" name="name" path="name" required="true" />
            <div class="valid-feedback text-light">Valid.</div>
            <div class="invalid-feedback text-light">Please fill out this field.</div>
        </div>
        <div class="mb-3">
            <label for="model" class="d-flex form-label text-light">Model:</label>
            <sf:input type="text" class="form-control dark-input bg-dark text-light" placeholder="Enter model" name="model" path="model" required="true" />
            <div class="valid-feedback text-light">Valid.</div>
            <div class="invalid-feedback text-light">Please fill out this field.</div>
        </div>
        <div class="mb-3">
            <label for="price" class="d-flex form-label text-light">Price (AUD):</label>
            <sf:input type="text" class="form-control dark-input bg-dark text-light" id="price" placeholder="Enter car price" name="price" path="price" required="true" />
            <div class="valid-feedback text-light">Valid.</div>
            <div class="invalid-feedback text-light">Please fill out this field.</div>
        </div>
        <div class="mb-3">
            <label for="make" class="d-flex form-label text-light">Make Year:</label>
            <sf:input type="text" class="form-control dark-input bg-dark text-light" placeholder="Enter make year" name="make" path="make" required="true" />
            <div class="valid-feedback text-light">Valid.</div>
            <div class="invalid-feedback text-light">Please fill out this field.</div>
        </div>
        <div class="mb-3">
            <label for="registeration" class="d-flex form-label text-light">Registration Date:</label>
            <sf:input type="text" class="form-control dark-input bg-dark text-light" id="registeration" placeholder="Enter registration date" name="registeration" path="registeration" required="true" />
            <div class="valid-feedback text-light">Valid.</div>
            <div class="invalid-feedback text-light">Please fill out this field.</div>
        </div>
        <div class="mb-3">
            <label class="d-flex form-label text-light">Photo:</label>
            <input type="file" class="form-control dark-input bg-dark text-light" name="fileImage" id="photo" accept="image/png, image/jpeg" required="true" />
            <div class="valid-feedback text-light">Valid.</div>
            <div class="invalid-feedback text-light">Please fill out this field.</div>
        </div>

        <div class="holder" style="height: 300px; width: 300px; margin: auto;">
            <img id="imgPreview" src="#" alt="image preview" style="width: inherit;" />
        </div>

        <button type="submit" class="btn button1 d-flex text-light bg-dark">Post</button>
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
    <!-- Car Post Form -->
</div>


								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>

								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</sec:authorize>
		<!-- post car link-->


		<!-- list of all cars posted -->
		<div class="row" style="gap: 60px; margin-left: 5%;">
			<c:forEach items="${cars}" var="c">
				<c:set var="id" value="${c.id}"></c:set>
				<c:if test="${success_post == null}">

					<c:if test="${c.sellStatus != 'sold'}">
						<div class="card" style="width: 400px; background-color: #002147;">
							<img class="card-img-top" src="${c.photoImagePath}"
								alt="${c.photos}" style="width: 100%; margin-top: 10px;">
							<div class="card-body">
								<h4 class="card-title">${c.name}</h4>
								<p class="card-text">
									<i class="fas fa-tags"></i>&nbsp;AUD ${c.price}
								</p>

								<!--<a href="#" class="btn"
							style="background-color: red; margin-right: 40px;">Book a
							Test Drive</a>-->
								<a href="/car_detail?cid=${c.id}" class="btn logout" style="color: white;">View
									Car Details</a>
							</div>
						</div>
					</c:if>

				</c:if>
			</c:forEach>
			<c:if test="${success_post != null}">
				<div class="alert alert-success">${success_post}
					Click here to <a href="/car_detail?cid=${id}">View</a> your car
					post
				</div>
			</c:if>
		</div>
		<!-- list of all cars posted -->
		<%@ include file="footer.jsp"%>
	</div>

</html>