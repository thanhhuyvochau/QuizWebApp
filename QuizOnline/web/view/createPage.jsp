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
        <title>Creating</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">

    </head>

    <body>
        <form action="${pageContext.request.contextPath}\Servlet/CreateServlet?action=create" id="createFrom" method="POST">
            <div class="form-group">
                <label for="exampleFormControlInput1">Question Content:</label>
                <input value="${requestScope.questionNameC}" name="questionContent" type="text" class="form-control" id="exampleFormControlInput1" placeholder="the question here">
            </div>
            <div class="form-group">
                <label for="exampleFormControlSelect1">Subject</label>
                <select name="subjectId" class="form-control" id="exampleFormControlSelect1">
                    <c:set var="subjectId" value="${requestScope.subjectIdC}"/>
                    <c:forEach var="subject" items="${requestScope.subjectList}">
                        <c:if test="${subjectId == subject.getSubjectId()}">
                            <option selected value="${subject.getSubjectId()}">${subject.getSubjectName()}</option>
                        </c:if>
                         <c:if test="${subjectId != subject.getSubjectId()}">
                            <option  value="${subject.getSubjectId()}">${subject.getSubjectName()}</option>
                        </c:if>              
                    </c:forEach>

                </select>
            </div>
            <div class="form-group">
                <label for="exampleFormControlSelect2">Correct answer</label>
                <input value="${requestScope.correctAC}" name="correctA" type="text" class="form-control" id="exampleFormControlInput1" required>
            </div>
            <div class="form-group">
                <label for="exampleFormControlSelect2">Answer 1</label>
                <input value="${requestScope.answer1C}" name="a1" type="text" class="form-control" id="exampleFormControlInput1" required>
            </div>
            <div class="form-group">
                <label for="exampleFormControlSelect2">Answer 2</label>
                <input value="${requestScope.answer2C}" name="a2" type="text" class="form-control" id="exampleFormControlInput1" required>
            </div>
            <div class="form-group">
                <label for="exampleFormControlSelect2">Answer 3</label>
                <input value="${requestScope.answer3C}" name="a3" type="text" class="form-control" id="exampleFormControlInput1" required>
            </div>
            <h3>${requestScope.message}</h3>
            <button form="createFrom" type="submit" class="btn btn-success bg-sm btn-block">Create</button>
            <a name=" " id=" " class="btn btn-warning " href="${pageContext.request.contextPath}\Servlet/LoadAdminPage" role="button ">Back To DashBoard</a>
        </form>

    </body>

</html>