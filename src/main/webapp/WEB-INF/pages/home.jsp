<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="includes/head.jsp" />
<jsp:include page="includes/header.jsp" />
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- Begin Body -->
<div class="container">
    <div class="row">
        <div class="col col-sm-3">

            <jsp:include page="includes/sidebar.jsp" />    


        </div>  
        <div class="col col-sm-9">
            <div class="panel">
                <h1>Apartments</h1>
                
                <div class="apartments">
                    
                    <c:forEach var="apartment" items="${apartments}">
                    <div class="box">
                        
                        </div>
                        <h2><a href="apartment/view/${apartment.id}">${apartment.title}</a></h2>
                        
                        <p> Total Rooms: ${apartment.roomCount}</p>    
                        <p> Facilities : ${apartment.facilities}</p>  
                        <p> Description : ${apartment.description}</p>
                        <p> Status : ${apartment.status}</p> 
                        <p> Address : ${apartment.address.street}<br/>
                         ${apartment.address.city}<br/>
                         ${apartment.address.stateName}<br/>
                         ${apartment.address.zip}</p>
                        
                        <div class="clear"></div>
                        
                        <a class="btn btn-primary" href="rent/${apartment.id}">Rent Apartment</a> 
                        
                        <div class="clear"></div>
                        
                    </div>
                        
                    </c:forEach>

                </div>
                
                <hr>
            </div>
        </div> 
    </div>
</div>

<jsp:include page="includes/footer.jsp"/>
</body>
</html>