<jsp:include page="includes/head.jsp" />
<jsp:include page="includes/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Begin Body -->
<div class="container">
    <div class="row">
        <div class="col col-sm-3">

            <jsp:include page="includes/sidebar.jsp" />    


        </div>  
        <div class="col col-sm-9">
            <div class="panel">
                <h1>${apartment.title}</h1>

                <div class="row">
                    <div class="col col-sm-8">
                        <img src="http://s.bootply.com/assets/example/bg_iphone.png" class="img-responsive">
                    </div> 
                    <div class="col col-sm-4">
                        <img src="//placehold.it/400x180/FF3333/FFF" class="img-responsive">
                        <h4>Aside</h4>
                        <hr>
                        <img src="//placehold.it/400x180/FF3333/FFF" class="img-responsive">
                        <h4>Aside 2</h4>
                    </div>   
                </div>

                <h2>Details</h2>
                ${apartment.description}
                <br><br>
                <form:form action="/ars/rentalInfo/book" method="post" modelAttribute="rentalInfo">
                    <!--<input type="hidden" name="apartment.id" value="${apartment.id}"/>-->
                    <input type="submit" value="Book Apartment" class="btn btn-default"/>
                </form:form>
                <hr>
            </div>
        </div> 
    </div>
</div>

<jsp:include page="includes/footer.jsp"/>
</body>
</html>