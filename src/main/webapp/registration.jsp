<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Student Duniya</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />
</head>

  <body>

		<header class="masthead">
            <div class="container">
                <div class="masthead-subheading">Welcome To Student Duniya! Please go ahead and register yourself</div>
                <form:form method="POST" modelAttribute="userForm" class="form-signin">
		            <h2 class="form-signin-heading">Create your account</h2>
		            <spring:bind path="username"> <!-- status of a certain bean or bean property -->
		                <div class="form-group ${status.error ? 'has-error' : ''}">
		                    <form:input type="text" path="username" class="form-control" placeholder="Username"
		                                autofocus="true"></form:input>
		                    <form:errors path="username"></form:errors>
		                </div>
		            </spring:bind>
		            
		            <br><br>
		
		            <spring:bind path="password">
		                <div class="form-group ${status.error ? 'has-error' : ''}">
		                    <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
		                    <form:errors path="password"></form:errors>
		                </div>
		            </spring:bind>
		
					<br><br>
		
		            <spring:bind path="passwordConfirm">
		                <div class="form-group ${status.error ? 'has-error' : ''}">
		                    <form:input type="password" path="passwordConfirm" class="form-control"
		                                placeholder="Confirm your password"></form:input>
		                    <form:errors path="passwordConfirm"></form:errors>
		                </div>
		            </spring:bind>
		
					<br><br>
					
		            <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
		             <h4 class="text-center mt-3"><a href="${contextPath}/login">Click for Registration</a></h4>
		        </form:form>
            </div>
        </header>
        
    <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${contextPath}/resources/js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
  </body>
</html>
