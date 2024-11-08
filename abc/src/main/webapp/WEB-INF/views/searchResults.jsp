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
<title>ABC CARS | RESULTS</title>
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

	<div class="container">

		<c:if test="${empty searchCar}">

			<div class="alert alert-danger">No search results found for
			${keyword}</div>

		</c:if>
		<!-- list of all cars posted -->
		<div class="row" style="gap: 60px; margin-left: 5%; margin-top: 5%;">

			<c:forEach items="${searchCar}" var="c">

				<div class="card" style="width: 400px; background-color: #002147;">
					<img class="card-img-top" src="${c.photoImagePath}"
						alt="${c.photos}" style="width: 100%; margin-top: 10px;">
					<div class="card-body">
						<h4 class="card-title">${c.name}</h4>
						<p class="card-text">
							<i class="fas fa-tags"></i>&nbsp;RM ${c.price}
						</p>

						<!--<a href="#" class="btn"
							style="background-color: red; margin-right: 40px;">Book a
							Test Drive</a>-->
						<a href="/car_detail?cid=${c.id}" class="btn btn-primary">View
							Car Details</a>
					</div>
				</div>
			</c:forEach>

		</div>
		<%@ include file="footer.jsp"%>
	</div>



	



</body>
</html>