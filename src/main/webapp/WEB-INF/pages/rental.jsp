<jsp:include page="includes/head.jsp" />
<jsp:include page="includes/header.jsp" />
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Begin Body -->

<script type="text/javascript">
$(function() {
		$(".date").datepicker();
});
</script>

<div class="container">
    <div class="row">
         <div class="col col-sm-3">
            <jsp:include page="includes/sidebar.jsp" />    
        </div>  
        <div class="col col-sm-9">
            <div class="panel">
                <h1>Book Apartment for Renting</h1>
                <p>Apartment : ${rental.apartment.title}</p>
                <p>User Name : ${rental.user.username}</p>
                
                <form:form modelAttribute="rental" method="post">
                    
                    <p><label>Rent Start From:</label>
                        <form:input cssClass="form-control short date" path="rentalDate" />
                    </p>
                    <p><label>Rent Ends To:</label>
                        <form:input cssClass="form-control short date" path="endDate"/>
                    </p>
                    <p>
                        <input class="btn btn-primary" type="submit" value="Submit"/>
                    </p>
                </form:form>
                



                <hr>
            </div>
        </div> 
    </div>
</div>
<jsp:include page="includes/footer.jsp" />                      
</body>
</html>