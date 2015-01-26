<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>



<form:form method="post" modelAttribute="address">
    
    <form:input path="street"/><br/>
    <form:input path="city"/><br/>
    
    <input type="submit" value="Submit"/>
    
</form:form>