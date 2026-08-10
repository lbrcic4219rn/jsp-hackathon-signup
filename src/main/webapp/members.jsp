<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Team members</title>
    <%@include file="styles.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>

<div class="container my-5">
    <c:choose>
        <c:when test="${submitted}">
            <h1 class="text-center">Your team, <c:out value="${team.name}"/>, is already registered.</h1>
        </c:when>

        <%-- Reached without filling in the team form first --%>
        <c:when test="${empty team}">
            <h1 class="text-center">Start with your team's details</h1>
            <p class="text-center">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/register.jsp">Back to sign-up</a>
            </p>
        </c:when>

        <c:otherwise>
            <div class="row justify-content-center">
                <form class="col-md-8" action="${pageContext.request.contextPath}/submit-application" method="post">
                    <c:forEach var="i" begin="1" end="${team.size}">
                        <h1 class="mb-3">Member ${i}</h1>
                        <div class="mb-3">
                            <label class="form-label" for="member-first-name-${i}">First name</label>
                            <input class="form-control" required type="text" placeholder="First name"
                                   id="member-first-name-${i}" name="member-first-name-${i}">
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="member-last-name-${i}">Last name</label>
                            <input class="form-control" required type="text" placeholder="Last name"
                                   id="member-last-name-${i}" name="member-last-name-${i}">
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="member-email-${i}">Email</label>
                            <input class="form-control" required type="email" placeholder="Email"
                                   id="member-email-${i}" name="member-email-${i}">
                        </div>
                        <div class="mb-3">
                            <label class="form-label" for="member-role-${i}">Role</label>
                            <input class="form-control" required type="text"
                                   placeholder="Role on the team (developer, designer, ...)"
                                   id="member-role-${i}" name="member-role-${i}">
                        </div>
                        <div class="mb-4">
                            <label class="form-label" for="member-linkedin-${i}">LinkedIn profile</label>
                            <input class="form-control" type="url" placeholder="https://linkedin.com/in/..."
                                   id="member-linkedin-${i}" name="member-linkedin-${i}">
                        </div>
                    </c:forEach>

                    <button type="submit" class="btn btn-primary btn-lg">Submit application</button>
                </form>
            </div>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
