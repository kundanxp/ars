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
                <h1>Add Apartment</h1>
                <form:form action="apartment/add" modelAttribute="newApartment" method="post" enctype="multipart/form-data">
                    <form:input path="id" type="hidden"/>
                    <p>
                        <label>Title : </label>
                        <form:input path="title" cssClass="form-control short" />
                    </p>
                    <p>
                        <label>Description : </label>
                        <form:textarea path="description" cssClass="form-control short"/>
                    </p>
                    <p>
                        <label>Number of rooms : </label>
                        <form:input path="roomCount" cssClass="form-control short" />
                    </p>
                    <p>
                        <label>Rate per month : </label>
                        <form:input path="rate" cssClass="form-control short" />
                    </p>
                    <p>
                        <label>Facilities : </label>
                        <form:input path="facilities" cssClass="form-control short" />
                    </p>
                    <p>
                        <label>Address </label>
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
                        <label>Select Apartment Images to upload. Press Add button to add more image inputs : </label>
                        <br>
                        <input id ="addImage" type="button" value="Add Image" />
                        <table id="imageTable">
                            <tr>
                                <td><input name="apartImages[0]" type="file" cssClass=" short" /></td>
                            </tr>   
                        </table>
                    </p>

                    <input class="btn btn-primary" type="submit" value="Submit"/>

                </form:form>

                    

<script>  
$(document).ready(function() {
    //add more file components if Add is clicked
    $('#addImage').click(function() {
        var fileIndex = $('#imageTable tr').children().length;
        $('#imageTable').append(
                '<tr><td>'+
                '   <input type="file" name="apartImages['+ fileIndex +']" />'+
                '</td></tr>');
    });
     
});
</script>                    
                    

                <hr>
            </div>
        </div> 
    </div>
</div>
<jsp:include page="includes/footer.jsp" />                      
</body>
</html>