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
    
    
    <script>
    	window.onload = function showPosition() {
	        if(navigator.geolocation) {
	            navigator.geolocation.getCurrentPosition(function(position) {
	                var positionInfo = "Latitude: " + position.coords.latitude + ", " + "Longitude: " + position.coords.longitude;
	                document.getElementById("location-result").innerHTML = positionInfo;
	            });
	        } else {
	            alert("Sorry, your browser does not support HTML5 geolocation.");
	        }
	    };
	</script>
</head>

<body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#page-top">
               <img src="${contextPath}/resources/assets/img/logo.png" alt="..." />  
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link">Welcome ${pageContext.request.userPrincipal.name}</a></li>
                        <li class="nav-item"><a class="nav-link" onclick="document.forms['logoutForm'].submit()">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
        	<div class="masthead-subheading mb-sm-8">Welcome To Student Duniya!</div>
            <div class="container">
                <div class="masthead-heading text-uppercase">Many Problems one Solution Student Duniya</div>
                <p
                 class="mb-sm-5 fs-4"><i>Every student in today's world relocates to a new location, either for school or to find work. However, when we relocate, the true work of finding a nice place to live, coaching centres, sanitary food, and other necessities begins. Visit Student Duniya to find solutions to all of your concerns in one place.
                </i></p>
                <a class="btn btn-primary btn-xl text-uppercase" href="#services">Tell Me More</a>
            </div>
        </header>
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">Offerings</h2>
                    <h3 class="section-subheading text-muted">Checkout our cool features and services</h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">Trustworthy information</h4>
                        <p class="text-muted">Be assured about the vendor details. Every vendor has been cross verified by our high class panel.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">Responsive Design</h4>
                        <p class="text-muted">The platform is responsive in nature. You are free to open the same website on you mobile as well.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-lock fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">Security</h4>
                        <p class="text-muted">Your data is safe with us, we are not going to share your personal details with anyone</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Portfolio Grid-->
        <section class="page-section bg-light" id="portfolio">
            <div class="container">
				<form:form id="servicesForm" method="POST" modelAttribute="dataForm" action="${contextPath}/services">	                
	                <div class="text-center">
	                    <h2 class="section-heading text-uppercase">Services</h2>
	                    <h3 class="section-subheading text-muted">Please select the location where you are looking for service</h3>
	                    <select name='location'>
						    <c:forEach items="${locations}" var="location">
						            <option value="${location}">${location}</option>
						    </c:forEach>
						</select>
	                </div>
	                <br><br>
	                <div class="row">
					    <c:set var="count" value="1" scope="page" />
					    <c:forEach items="${services}" var="entry">
					        <div class="col-lg-4 col-sm-6 mb-4">
		                        <!-- Portfolio item 1-->
		                        <div class="portfolio-item">
		                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal${count}">
		                                <div class="portfolio-hover">
		                                    <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x"></i></div>
		                                </div>
		                                <img class="img-fluid" src="${contextPath}/resources/assets/img/portfolio/${count}.jpg" alt="..." />
		                            	<c:set var="count" value="${count + 1}" scope="page"/>
		                            </a>
		                            <div class="portfolio-caption">
		                                <div class="portfolio-caption-heading">${entry.key}</div>
		                                <c:forEach items="${entry.value}" var="val">
									            <div class="portfolio-caption-subheading text-muted"><input type="radio" name="serviceName" value="${val}" />${val}</div>
									    </c:forEach>
		                            </div>
		                        </div>
		                    </div>
					    </c:forEach>
	                </div>
	                
	                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	      			<div class="text-center">
	      				<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
	                </div>
				</form:form>
            </div>
        </section>
        <!-- Footer-->
        <footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-start">Copyright &copy; Student Duniya 2022</div>
                    <div class="col-lg-4 my-3 my-lg-0">
                        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="#!" aria-label="LinkedIn"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <div class="col-lg-4 text-lg-end">
                        <a class="link-dark text-decoration-none me-3" href="#!">Privacy Policy</a>
                        <a class="link-dark text-decoration-none" href="#!">Terms of Use</a><br>
                        <a class="link-dark text-decoration-none" href="#!" id="location-result"></a>
                    </div>
                </div>
            </div>
        </footer>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${contextPath}/resources/js/scripts.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

	<c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </c:if>
    </body>
	
</html>
