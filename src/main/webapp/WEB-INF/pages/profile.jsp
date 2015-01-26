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
                <h1>User Profile</h1>
                
                <p>${message}${param.message}</p>
                
                <c:url var="userImage" value="/resources/userpics/${newUser.profileImage}"/>
                <div class="userImage" style="background-image: url(${userImage})"></div>
                <p>Full Name :</p>
                <p><strong>${newUser.firstName} ${newUser.lastName}</strong></p>
                <p>User Name :</p>
                <p><strong>${newUser.username}</strong></p>
                <p>Password :</p>
                <p><strong><a href="profile/password">Change Password</a></strong></p>
                <p>Phone :</p>
                <p><strong>${newUser.phone}</strong></p>
                <p>Email :</p>
                <p><strong>${newUser.email}</strong></p>
                <p>Address :</p>
                <p>
                    <strong>${newUser.address.street}</strong><br/>
                    <strong>${newUser.address.city}</strong><br/>
                    <strong>${newUser.address.stateName}</strong><br/>
                    <strong>${newUser.address.zip}</strong><br/>
                </p>
                
                
                <a class="btn btn-primary" href="profile/edit" >Edit Profile</a>
                <div class="clear"></div>
                <hr>
            </div>
        </div> 
    </div>
</div>
<jsp:include page="includes/footer.jsp" />                      
</body>
</html>