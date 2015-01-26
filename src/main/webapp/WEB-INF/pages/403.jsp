
<jsp:include page="includes/head.jsp" />
<jsp:include page="includes/header.jsp" />
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Begin Body -->
<div class="container">
    <div class="row">
         <div class="col col-sm-3">
            <jsp:include page="includes/sidebar.jsp" />    
        </div>  
        <div class="col col-sm-9">
            <div class="panel">
                <h1>Access is denied</h1>

	<c:choose>
		<c:when test="${empty username}">
			<p>You do not have permission to access this page!</p>
		</c:when>
		<c:otherwise>
			<p>Username : ${username} <br/>You do not have permission to access this page!</p>
		</c:otherwise>
	</c:choose>



                <hr>
            </div>
        </div> 
    </div>
</div>
<jsp:include page="includes/footer.jsp" />                      
</body>
</html>