<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Team sign-up</title>
    <%@include file="styles.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>

<c:choose>
    <c:when test="${submitted}">
        <h1 class="col-6 mx-auto text-center my-5">Your team, <c:out value="${team.name}"/>, is already registered.</h1>
    </c:when>
    <c:otherwise>
        <div class="container my-5">
            <div class="row justify-content-center">
                <form class="col-md-8" action="${pageContext.request.contextPath}/register-team" method="post">
                    <h1 class="mb-4">Your team</h1>

                    <div class="mb-3">
                        <label class="form-label" for="teamName">Team name</label>
                        <input type="text" id="teamName" class="form-control" name="teamName" maxlength="60"
                               placeholder="Team name" value="<c:out value="${team.name}"/>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="contactEmail">Contact email</label>
                        <input type="email" id="contactEmail" class="form-control" name="contactEmail"
                               placeholder="Contact email" value="<c:out value="${team.contactEmail}"/>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="contactPhone">Contact phone</label>
                        <input type="tel" id="contactPhone" class="form-control" name="contactPhone"
                               placeholder="Contact phone" value="<c:out value="${team.contactPhone}"/>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="motto">Team motto</label>
                        <input type="text" id="motto" class="form-control" name="motto" maxlength="120"
                               placeholder="Team motto" value="<c:out value="${team.motto}"/>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="referral">How did you hear about the hackathon?</label>
                        <select id="referral" name="referral" class="form-select" required>
                            <option value="Facebook">Facebook</option>
                            <option value="Instagram">Instagram</option>
                            <option value="Faculty">Through the faculty</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="teamSize">Number of team members</label>
                        <select id="teamSize" name="teamSize" class="form-select" required>
                            <option value="3">3</option>
                            <option value="4">4</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary btn-lg">Continue to members</button>
                </form>
            </div>
        </div>
    </c:otherwise>
</c:choose>
</body>
</html>
