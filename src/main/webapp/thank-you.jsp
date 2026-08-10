<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Thanks for signing up</title>
    <%@include file="styles.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>

<div class="container my-5 text-center">
    <c:choose>
        <c:when test="${submitted}">
            <h1><c:out value="${team.name}"/>, thanks for signing up!</h1>
            <h2 class="mt-4">We are reviewing your application and will let you know our decision by December 11th at
                <c:out value="${team.contactEmail}"/>.</h2>
            <h3 class="mt-4">Any questions? Write to us at mail@raf.rs.</h3>
        </c:when>
        <c:otherwise>
            <h1>No application to show</h1>
            <p><a class="btn btn-primary" href="${pageContext.request.contextPath}/register.jsp">Sign your team up</a></p>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
