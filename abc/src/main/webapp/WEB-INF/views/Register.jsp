<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>  

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
<link href="/css/register.css" rel="stylesheet" />
<script src="/js/login.js"></script> 
<title>ABC CARS | REGISTER</title>
</head>

<body>
	<div class="container">
		
		<div class="form-content">
			<sf:form action="register" method="post" class="was-validated" modelAttribute="user"> 		
	           		<div class="input-div one">
	           		   <div class="i">
	           		   		<i class="fas fa-user"></i>
	           		   </div>
	           		
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />   
	           		   	<div class="div">
	           		   		<h5></h5>
	           		   		<label for="name" class="form-label"></label> <sf:input
								type="text" class="form-control" 
								placeholder="Enter Name" name="name" path="name" required="true" />
	           		   </div>
	           		</div>
	           		
	           		
	           		<div class="input-div pass">
	           		   <div class="i"> 
	           		    	<i class="fas fa-user"></i>
	           		   </div>
	           		   <div class="div">
	           		    	<h5></h5>
	           		    	<label for="userName" class="form-label"></label> <sf:input
								type="text" class="form-control" id="userName"
								placeholder="Enter Username" name="userName" path="userName" required="true" />
	            	   </div>
	            	</div>
	           		
	           		
	           		<div class="input-div pass">
	           		   <div class="i"> 
	           		    	<i class="fas fa-map-marker"></i>
	           		   </div>
	           		   <div class="div">
	           		    	<h5></h5>
	           		    	<label for="address" class="form-label"></label> <sf:input
								type="address" class="form-control" 
								placeholder="Enter Address" name="address" path="address" required="true" />
							<!--  <div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>-->
	            	   </div>
	            	</div>
	            	
	            	<div class="input-div pass">
	           		   <div class="i"> 
	           		    	<i class="fas fa-mobile"></i>
	           		   </div>
	           		   <div class="div">
	           		    	<h5></h5>
	           		    	<label for="mobile" class="form-label"></label> <sf:input
								type="mobile" class="form-control" 
								placeholder="Enter Phone Number" name="mobile" path="mobile" required="true" />
							<!--  <div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>-->
	            	   </div>
	            	</div>
	            	
	            	<div class="input-div pass">
	           		   <div class="i"> 
	           		    	<i class="fas fa-envelope"></i>
	           		   </div>
	           		   <div class="div">
	           		    	<h5></h5>
	           		    	<label for="email" class="form-label"></label> <sf:input
								type="email" class="form-control" 
								placeholder="Enter Email" name="email" path="email" required="true" />
							<!--  <div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>-->
	            	   </div>
	            	</div>	
	           		
	           		<div class="input-div pass">
	           		   <div class="i"> 
	           		    	<i class="fas fa-lock"></i>
	           		   </div>
	           		   <div class="div">
	           		    	<h5></h5>
	           		    	<label for="password" class="form-label"></label> <sf:input
								type="password" class="form-control" id="password"
								placeholder="Enter Password" name="password" path="password" required="true" />
							<!--  <div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Please fill out this field.</div>-->
	            	   </div>
	            	</div>
	            	
					<div>
	            	<p class="register">Already have an account? <a href="login">  Sign In</a> </p>
	            	</div>
	            	<c:if test="${success_register != null}">

						<div class="alert alert-success">${success_register} Click here to <a href="login">
						Sign In</a> </div>
			
					</c:if>
	            	<input type="submit" value="Register"
					class="btn btn-primary" />
				
				
				
            </sf:form>
        </div>
    </div>




<!--  
	<div class="container my-3">

		<c:if test="${success_register != null}">

			<div class="alert alert-success">${success_register} Click here to <a href="login">
			Sign In</a> </div>

		</c:if>
		<h3>Register</h3>

		
		<sf:form action="register" method="post" class="was-validated" modelAttribute="user">
			
			<div class="mb-3 mt-3">
				<label for="name" class="form-label">Name:</label> <sf:input
					type="text" class="form-control" 
					placeholder="Enter name" name="name" path="name" required="true" />
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<div class="mb-3">
				<label for="userName" class="form-label">Username:</label> <sf:input
					type="text" class="form-control" id="userName"
					placeholder="Enter username" name="userName" path="userName" required="true" />
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<div class="mb-3">
				<label for="address" class="form-label">Address:</label> <sf:input
					type="address" class="form-control" 
					placeholder="Enter username" name="address" path="address" required="true" />
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<div class="mb-3">
				<label for="mobile" class="form-label">Mobile:</label> <sf:input
					type="mobile" class="form-control" 
					placeholder="Enter username" name="mobile" path="mobile" required="true" />
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<div class="mb-3">
				<label for="email" class="form-label">Email:</label> <sf:input
					type="email" class="form-control" 
					placeholder="Enter username" name="email" path="email" required="true" />
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">Password:</label> <sf:input
					type="password" class="form-control" id="password"
					placeholder="Enter password" name="password" path="password" required="true" />
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>

			<input type="submit" value="Register"
				class="btn btn-primary" />
		</sf:form>

		<div style="margin: 80px;"></div>

	</div>
-->






</body>
</html>
