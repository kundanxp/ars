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
                <h1>User Registration</h1>
                <form:form modelAttribute="newUser" method="post" enctype="multipart/form-data">
                    <form:errors path="*" cssClass="error" element="p"/>
                <p>
                    <label>First Name : </label>
                    <form:input path="firstName" cssClass="form-control short" />
                </p>
                <p>
                    <label>Last Name : </label>
                    <form:input path="lastName" cssClass="form-control short" />
                </p>
                <p>
                    <label>User Name : </label>
                    <form:input readonly="${readonly}" path="username" cssClass="form-control short" />
                    
                </p>
                <p>
                    <label>Password : </label>
                    <form:input path="password" type="password" cssClass="form-control short" />
                </p>
                <p>
                    <label>Email : </label>
                    <form:input path="email" type="email" cssClass="form-control short" />
                </p>
                <p>
                    <label>Phone : </label>
                    <form:input path="phone" cssClass="form-control short" />
                </p>
                <p>
                    <label>Street : </label>
                    <form:input path="address.street" cssClass="form-control short" />
                </p>
                <p>
                    <label>City : </label>
                    <form:input path="address.city" cssClass="form-control short" />
                </p>
                <p>
                    <label>State : </label>
                    <form:input path="address.stateName" cssClass="form-control short" />
                </p>
                <p>
                    <label>Zip Code : </label>
                    <form:input path="address.zip" cssClass="form-control short" />
                </p>
                
                
                <p>
                    <label>Profile Image : </label>
                    <form:input path="picture" type="file" cssClass=" short" />
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