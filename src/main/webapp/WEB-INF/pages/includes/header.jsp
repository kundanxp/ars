<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-static">
    <div class="container">
        <a class="navbar-toggle" data-toggle="collapse" data-target=".nav-collapse">
            <span class="glyphicon glyphicon-chevron-down"></span>
        </a>
        <div class="nav-collapse collase">
            <ul class="nav navbar-nav">  
                <li><a href="/ars/">Home</a></li>
                <li><a href="about">About </a></li>
                <li><a href="contact">Contact us</a></li>
                
                <sec:authorize access="hasRole('ROLE_USER')">
                    <li><a href="user/apartments">My Apartments</a></li>
                    <li><a href="apartment/add">Add New Apartment</a></li>
                
                </sec:authorize>
                
            </ul>
            <ul class="nav navbar-right navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-search"></i></a>
                    <ul class="dropdown-menu" style="padding:12px;">
                        <form class="form-inline">
                            <button type="submit" class="btn btn-default pull-right"><i class="glyphicon glyphicon-search"></i></button><input type="text" class="form-control pull-left" placeholder="Search">
                        </form>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="glyphicon glyphicon-user"></i>
                        <c:choose>
                            <c:when test="${pageContext.request.userPrincipal.name == null}">
                                Guest
                            </c:when>
                            <c:otherwise>${pageContext.request.userPrincipal.name}</c:otherwise>
                        </c:choose>
                        <i class="glyphicon glyphicon-chevron-down"></i></a>
                    <ul class="dropdown-menu">

                        <c:choose>
                            <c:when test="${pageContext.request.userPrincipal.name == null}">
                                <li><a href="login">Login</a></li>
                                <li class="divider"></li>
                                <li><a href="<c:url value="/register"/>">Register</a></li>
                                </c:when>
                                <c:otherwise>
                                <form action="<c:url value="/j_spring_security_logout"/>" method="post" id="logoutForm">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                </form>
                                <li><a href="<c:url value="/profile"/>">Profile</a></li>
                                <li class="divider"></li>
                                <li><a onclick="document.getElementById('logoutForm').submit()" href="#"> Logout</a></li>
                                </c:otherwise>
                            </c:choose>
                    </ul>
                </li>  
            </ul>
        </div>		
    </div>
</nav><!-- /.navbar -->


<header class="masthead">
    <div class="container">
        <div class="row">
            <div class="col col-sm-6">
                <h1><a href='<c:url value="/"/>' title="scroll down for your viewing pleasure">Apartment Rental Service</a>
                    <p class="lead">Renting service made easy</p></h1>
            </div>
            <div class="col col-sm-6">
                <div class="well pull-right">
                    <img src="resources/images/logo.png" alt="Logo"/>
                </div>
            </div>
        </div>
    </div>


    <div class="container">
        <div class="row">
            <div class="col col-sm-12">

                <div class="panel">
                    <div class="panel-body">
                        You may want to put some news here  <span class="glyphicon glyphicon-heart-empty"></span>
                    </div>
                </div>

            </div>
        </div>
    </div>
</header>
