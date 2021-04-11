<%-- 
    Document   : result
    Created on : Feb 2, 2021, 4:33:13 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Detail</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            .th {
                text-align: center;
                display: none;
            }
        </style>
    </head>

    <body>
        <c:set var="quizDetail" value="${requestScope.quizDetail}"/>
        <c:set var="questionList" value="${quizDetail.getQuestionList()}"/>
        <c:set var="resultOfQuiz" value="${quizDetail.getResultOfQuiz()}"/>

        <div class="container">
            <h1>Quiz Detail</h1>
            <div class="row">
                <div class="tab-content">
                    <div id="home" class="tab-pane fade in active">
                        <table class="table table-bordered ">
                            <thead>
                                <tr>
                                    <th>Quiz Question</th>
                                    <th>Answer</th>
                                    <th>Is Correct</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="question" items="${questionList}">
                                    <c:set var="quesId" value="${question.getQuestionId()}" />
                                    <tr>

                                        <td>${question.getQuestionContent()}</td>

                                        <c:forEach var="result" items="${resultOfQuiz}">
                                            <c:if test="${quesId == result.key}">
                                                <c:set var="answer" value="${result.value}"/>
                                                <td>${answer.getAnswerContent()}</td>
                                                <td>${answer.isIsCorrect()}</td>   
                                            </c:if>
                                        </c:forEach>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <td> <a class="btn btn-danger btn-md" href="${pageContext.request.contextPath}/" >Back To Home Page</a></td>
                    </div>

                </div>
            </div>

    </body>

</html>
