<%-- 
    Document   : createPage
    Created on : Jan 31, 2021, 4:29:39 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
        <title>Updating</title>
    </head>

    <body>
        <c:set var="question" value="${requestScope.questionUpdated}"/>
        <form action="${pageContext.request.contextPath}\Servlet/UpdateServlet?action=update&questionId=${question.getQuestionId()}" id="updateFrom" method="POST">
            <div class="form-group">
                <label for="exampleFormControlInput1">Question Content:</label>
                <input value="${question.getQuestionContent()}" name="questionContent" type="text" class="form-control" id="exampleFormControlInput1" placeholder="the question here">
            </div>
            <div class="form-group">
                <label for="exampleFormControlSelect1">Subject</label>
                <select name="subjectId" class="form-control" id="exampleFormControlSelect1">
                    <c:forEach var="subject" items="${requestScope.subjectList}">



                        <c:if test="${subject.getSubjectId() == question.getSubjectId()}">
                            <option selected value="${subject.getSubjectId()}">${subject.getSubjectName()}</option> 
                        </c:if>
                        <c:if test="${subject.getSubjectId() != question.getSubjectId()}">
                            <option value="${subject.getSubjectId()}">${subject.getSubjectName()}</option> 
                        </c:if>


                    </c:forEach>

                </select>
            </div>
            <c:forEach var="correctA" items="${question.getAnswers()}">
                <c:if test="${correctA.isIsCorrect() == true}">
                    <div class="form-group">
                        <label for="exampleFormControlSelect2">Correct answer</label>
                        <input value="${correctA.getAnswerContent()}" name="correctA" type="text" class="form-control" id="exampleFormControlInput1" required>
                        <input name="correctAId" type="hidden" value="${correctA.getAnswerId()}">
                    </div>
                    <c:set var="craw" value="${correctA.getAnswerContent()}"/>
                </c:if>
            </c:forEach>

            <c:set var="num" value="${1}"/>
            <c:forEach  var="answer" items="${question.getAnswers()}">
                <c:if test="${answer.getAnswerContent() != craw}">
                    <div class="form-group">
                        <label for="a${num}">Answer ${num}</label>
                        <input value="${answer.getAnswerContent()}" name="a${num}" type="text" class="form-control" id="a${num}" required>
                     <input name="a${num}Id" type="hidden" value="${answer.getAnswerId()}">
                    </div>   
                    <c:set var="num" value="${num+1}"/>
                </c:if> 

            </c:forEach>


            <h3>${requestScope.message}</h3>
            <button form="updateFrom" type="submit" class="btn btn-success bg-sm btn-block">Update</button>
            <a name=" " id="" class="btn btn-warning " href="${pageContext.request.contextPath}\Servlet/LoadAdminPage" role="button ">Back To DashBoard</a>
        </form>

    </body>

</html>