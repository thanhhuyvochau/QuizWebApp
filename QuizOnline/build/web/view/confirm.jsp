<%-- 
    Document   : welcome.jsp
    Created on : Feb 1, 2021, 8:51:42 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <title>Confirm</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        html,
        body {
            height: 100%;
        }
        
        .jumbotron {
            background-image: url("https://images.unsplash.com/photo-1494438639946-1ebd1d20bf85?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1047&q=80");
            background-size: cover;
        }
    </style>
</head>

<body>
<c:set var="subjectList" value="${requestScope.subjectId}" />
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle"  id="navbardrop" data-toggle="dropdown">
                  Menu
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">History</a>
                    <a class="dropdown-item" href="${pageContext.request.contextPath}\Servlet/LogOutServlet">Logout</a>

                </div>
            </li>
        </ul>
    </nav>
    <div class="jumbotron jumbotron-fluid h-50 d-block">
        <div class="container">
            <div class="row justify-content-center ">
                <div style="text-align: center;">
                    <h1>You stii have a quiz to continues</h1>
                    <h4>Chosse options</h4>                   
                    <a href="${pageContext.request.contextPath}\Servlet/QuizServlet?confirm=continues&subjectQuiz=${requestScope.subjectOldQuiz}" class="m-2  btn btn-outline-primary btn-lg ml-auto">Continue Quiz!</a>
                    <a href="${pageContext.request.contextPath}\Servlet/QuizServlet?confirm=new&subjectQuiz=${requestScope.subjectNewQuiz}" class="m-2  btn btn-outline-primary btn-lg ml-auto">Make A New Quiz!</a>   
                </div>

            </div>

        </div>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>
