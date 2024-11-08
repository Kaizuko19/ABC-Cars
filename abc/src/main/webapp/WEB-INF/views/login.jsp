<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

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

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Chakra+Petch:wght@400;600;700&family=Mulish&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@40,600,0,0" />

<!--  Access the Static Resources without using spring URL -->
<link href="/css/login.css" rel="stylesheet" />
<script src="/js/login.js"></script> 
<title>ABC CARS | LOG IN</title>
</head>

<body>
	<div class="container" >
		
		<div class="form-content">
			<c:url var="post_url" value="/login" />
			<form:form action="${post_url}" method="post" class="was-validated">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<img src="images/home/ABC.png">
				<h2 class="title">Login Here</h2>
           		<div class="input-div one">
           		   <div class="i">
           		   		<i class="fas fa-user"></i>
           		   </div>
				
           		   <div class="div">
           		   		<label for="username" class="form-label"></label> <input
							type="text" class="form-control" id="username"
							placeholder="Username"  name="username" value="" required>

           		   </div>
           		</div>
           		<div class="input-div pass">
           		   <div class="i"> 
           		    	<i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
           		    	<label for="password" class="form-label"></label> <input
							type="password" class="form-control" id="password"
							placeholder="Password"  name="password" value="" required>

            	   </div>
            	</div>
            	<div>
            	<p class="register">Don't have an account? <a href="register_user">  Register</a> </p>
            	</div>
            	
            	<input type="submit" name="Login" value="Sign In" class="btn btn-primary"></input>
				
            	<c:if test="${error_string != null}">
					<div class="alert alert-danger">${error_string} </div>
				</c:if>
				
            </form:form>
            
        </div>
    </div>
	</div>
</body>
</html>
