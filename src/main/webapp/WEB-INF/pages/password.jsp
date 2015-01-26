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
                <h1>Change Password</h1>
                
                <p>${message}${param.message}</p>
                
                <form:form modelAttribute="newUser" method="post" enctype="multipart/form-data">
                    <form:errors path="*" cssClass="error" element="p"/>
                
                    <p><label>Old Password:</label>
                        <input class="form-control short" value="${oldPassword}" name="oldPassword" type="password"/>
                    </p>
                    <p><label>New Password:</label>
                        <input type="password" name="newPassword" value="${newPassword}" class="form-control short"/>
                    
                    </p>
                    <p><label>Retype New Password:</label>
                        <input type="password" value="${newPasswordTwo}" name="newPasswordTwo" class="form-control short"/>
                    
                    </p>
                    
                
                <input class="btn btn-primary" type="submit" value="Submit"/>
                
                </form:form>


                <hr>
            </div>
        </div> 
    </div>
</div>
<jsp:include page="includes/footer.jsp" />                      
</body>
</html>