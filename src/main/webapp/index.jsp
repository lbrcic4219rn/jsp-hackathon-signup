<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>RAF Hackathon</title>
    <%@include file="styles.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>

<div class="bg-light py-5 mb-5">
    <div class="container text-center">
        <h1 class="display-1">Think you can take on RAF?</h1>
        <h2 class="display-6">RAF Hackathon, December 21st.</h2>
        <hr class="my-4">

        <c:choose>
            <c:when test="${submitted}">
                <h2>Your team, <c:out value="${team.name}"/>, is already registered.</h2>
            </c:when>
            <c:otherwise>
                <a class="btn btn-primary btn-lg mb-3" href="${pageContext.request.contextPath}/register.jsp">Sign up!</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<div class="container my-5" id="about">
    <div class="row row-cols-1 row-cols-md-3 g-3">
        <div class="col">
            <div class="card text-white bg-primary h-100">
                <div class="card-header">When</div>
                <div class="card-body"><p class="card-text">The competition starts on Saturday, December 21st; the exact
                    schedule will be announced later. The hackathon runs for 24 hours from the moment the theme is
                    presented.</p></div>
            </div>
        </div>
        <div class="col">
            <div class="card text-white bg-primary h-100">
                <div class="card-header">Where</div>
                <div class="card-body"><p class="card-text">The hackathon is held at the Faculty of Computing, in the
                    center of Belgrade at Knez Mihailova 6/VI. Every team gets its own room to work in.</p></div>
            </div>
        </div>
        <div class="col">
            <div class="card text-white bg-primary h-100">
                <div class="card-header">Theme</div>
                <div class="card-body"><p class="card-text">The theme is revealed on the day of the competition, when
                    teams receive everything they need to know about the task. Exactly 12 hours in, one more requirement
                    is added.</p></div>
            </div>
        </div>
        <div class="col">
            <div class="card text-white bg-primary h-100">
                <div class="card-header">Who can enter</div>
                <div class="card-body"><p class="card-text">The competition is open to everyone aged 18 to 27. The best
                    8 teams of 3 to 4 members take part.</p></div>
            </div>
        </div>
        <div class="col">
            <div class="card text-white bg-primary h-100">
                <div class="card-header">Judging</div>
                <div class="card-body"><p class="card-text">Solutions are scored by a panel of judges across several
                    categories, explained in full before the start. The panel follows the teams throughout and decides
                    once the hackathon ends.</p></div>
            </div>
        </div>
        <div class="col">
            <div class="card text-white bg-primary h-100">
                <div class="card-header">What you get</div>
                <div class="card-body"><p class="card-text">Food, drinks, internet and a space to rest are provided for
                    the duration. Bring your own laptop; monitors, keyboards, mice and paper are on us.</p></div>
            </div>
        </div>
    </div>
</div>

<section class="container my-5" id="prizes">
    <div class="text-center mb-4">
        <h6 class="text-uppercase text-muted">Win</h6>
        <h1>Prizes</h1>
    </div>
    <div class="row text-center g-3">
        <div class="col-md-4 order-2 order-md-1">
            <div class="card h-100 py-4">
                <div class="card-body">
                    <span class="display-6">2.</span>
                    <h2 class="mb-3">Second place</h2>
                    <p class="display-6 mb-0">50,000</p>
                    <p class="text-muted">dinars</p>
                    <p class="mt-4">in Ethereum</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 order-1 order-md-2">
            <div class="card h-100 py-4 border-primary">
                <div class="card-body">
                    <span class="display-6">1.</span>
                    <h2 class="mb-3">First place</h2>
                    <p class="display-6 mb-0">100,000</p>
                    <p class="text-muted">dinars</p>
                    <p class="mt-4">in Bitcoin</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 order-3">
            <div class="card h-100 py-4">
                <div class="card-body">
                    <span class="display-6">3.</span>
                    <h2 class="mb-3">Third place</h2>
                    <p class="display-6 mb-0">25,000</p>
                    <p class="text-muted">dinars</p>
                    <p class="mt-4">in Ethereum</p>
                </div>
            </div>
        </div>
    </div>
    <p class="text-center mt-4">Value is calculated at the exchange rate on the day the prizes are awarded.</p>
</section>
</body>
</html>
