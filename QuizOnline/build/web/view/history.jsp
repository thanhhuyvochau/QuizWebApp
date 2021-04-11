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
        <title>History</title>
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
        <c:set var="quizList" value="${requestScope.history}"/>



        <div class="container">
            <h1>Quiz History</h1>
            <div class="row">

                <div class="col-sm-8">
                    <form action="${pageContext.request.contextPath}\Servlet/HistorySearchServlet" method="GET" id="SearchForm">
                        <label for="exampleFormControlSelect1">Subject:</label>
                        <select name="subjectId" class="form-control" id="exampleFormControlSelect1">
                            <c:set var="subjectId" value="${requestScope.subjectIdSearched}"/>
                            <c:forEach var="subject" items="${requestScope.subjectList}">
                                <c:if test="${subjectId == subject.getSubjectId()}">
                                    <option selected value="${subject.getSubjectId()}">${subject.getSubjectName()}</option>
                                </c:if>
                                <c:if test="${subjectId != subject.getSubjectId()}">
                                    <option  value="${subject.getSubjectId()}">${subject.getSubjectName()}</option>
                                </c:if>              
                            </c:forEach>
                        </select>
                        <button form="SearchForm" type="submit" name="" id="" class="btn btn-primary">Search</button>
                        <hr>                                  
                    </form>
                </div>


                <div class="tab-content">
                    <div id="home" class="tab-pane fade in active">
                        <table class="table table-bordered ">
                            <thead>
                                <tr>
                                    <th>Quiz ID</th>
                                    <th>Subject Quiz</th>
                                    <th>Date</th>
                                    <th>Total Score</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="index" value="${1}"/>
                                <c:forEach var="quiz" items="${quizList}">
                                    <tr>
                                        <td>${index}</td>
                                        <td>${quiz.getSubjectId()}</td>
                                        <td>${quiz.getDateFormat()}</td>
                                        <td>${quiz.getTotalScore()}</td>
                                        <td> <a class="btn btn-danger btn-md" href="${pageContext.request.contextPath}/Servlet\DetaileQuizServlet?quizId=${quiz.getQuizId()}" >Review</a></td>
                                    </tr>
                                    <c:set var="index" value="${index+1}"/>
                                </c:forEach>
                            </tbody>
                        </table>
                        <td> <a class="btn btn-danger btn-md" href="${pageContext.request.contextPath}/" >Back To Home Page</a></td>
                    </div>

                </div>
                <ul class="pagination" style="margin-left: 30%;">
                    <c:set var="pageOb" value="${requestScope.page}"/>
                    <c:forEach var="page" begin="${pageOb.getFirstPage()}" end="${pageOb.getLastPage()}">    
                        <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}\Servlet/${requestScope.servlet}?${requestScope.searched}pageNum=${page}">${page}</a></li>
                    </c:forEach>

                </ul> 
            </div>

    </body>

</html>
