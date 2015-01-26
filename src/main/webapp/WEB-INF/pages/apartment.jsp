<%-- 
    Document   : apartment
    Created on : Oct 21, 2014, 1:28:25 PM
    Author     : CKarki
--%>

<jsp:include page="includes/head.jsp" />
<jsp:include page="includes/header.jsp" />
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- Begin Body -->
<div class="container">
    <div class="row">
         <div class="col col-sm-3">
            <jsp:include page="includes/sidebar.jsp" />    
        </div>  
        <div class="col col-sm-9">
            <div class="panel">
                <h1>Apartment</h1>
                <h2> ${apartment.title}</h2>
                
                <c:forEach items="${apartment.fileNames}" var="picture">
                    <div class="slide">
                        <img src="resources/apartImages/${picture}"/>
                    </div>
                </c:forEach>
                
                <p> Total Rooms: ${apartment.roomCount}</p>    
                        <p> Facilities : ${apartment.facilities}</p>  
                        <p> Description : ${apartment.description}</p>
                        <p> Status : ${apartment.status}</p> 
                        <p> Address : ${apartment.address.street}<br/>
                         ${apartment.address.city}<br/>
                         ${apartment.address.stateName}<br/>
                         ${apartment.address.zip}</p>
                
                  
                    
             
                
            <div class="clear"></div>
                <hr>
            </div>
        </div> 
    </div>
</div>
<jsp:include page="includes/footer.jsp" />                      
</body>
</html>