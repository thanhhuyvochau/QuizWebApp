<%-- 
    Document   : quiz.jsp
    Created on : Feb 1, 2021, 8:51:15 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Quiz</title>
        <script async type='text/javascript' src="./script/quiz.js"></script>
        <script async type='text/javascript' src="../script/quiz.js"></script>
        <link href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css' rel='stylesheet'>

        <link rel="stylesheet" href="./asset/quiz.css">
        <link rel="stylesheet" href="../asset/quiz.css">

    </head> 
    <body oncontextmenu='return false' class='snippet-body'>
        <c:set var="quiz" value="${sessionScope.quiz}"/>
        <c:set var="index" value="${sessionScope.index}"/>
        <c:set var="question" value ="${sessionScope.question}"/>
        <c:set var="answers" value="${question.getAnswers()}"/>
        <c:set var="range" value="${sessionScope.range}"/>
        <c:set var="select" value="${requestScope.select}"/>
        <c:if test="${select == null}">
            <c:set var="select" value="${-1}"/>
        </c:if>

        <input type="hidden" name="time" id="time" value="${quiz.getTime()}">
        <input type="hidden" name="index" id="index" value="${index}">


        <div class="container mt-sm-5 my-1">
            <form id="quiz_form" action="${pageContext.request.contextPath}\Servlet/ProcessQuizServlet" method="POST">
                <div class="float-right" id="safeTimer" style="background-color: green; display: inline-block;">
                    <h2 style="text-align: center;">TIMER</h2>
                    <input name="timeSave"  readonly="true" type="text" id="safeTimerDisplay" style="text-align: center;"></input>
                </div>
                <div class="float-left">${sessionScope.questionNum}</div>

                <div class="question ml-sm-5 pl-sm-5 pt-2">

                    <div class="py-2 h5"><b>${question.getQuestionContent()}</b></div>
                            <c:forEach var="answer" items="${answers}">
                        <div class="ml-md-3 ml-sm-3 pl-md-5 pt-sm-0 pt-3" id="options"> 
                            <c:if test="${select == answer.getAnswerId()}">
                                <label class="options">${answer.getAnswerContent()}<input checked value="${answer.getAnswerId()}" type="radio" name="radio"> <span class="checkmark"></span> </label>
                                </c:if>

                            <c:if test="${select != answer.getAnswerId()}">
                                <label class="options">${answer.getAnswerContent()}<input  value="${answer.getAnswerId()}" type="radio" name="radio"> <span class="checkmark"></span> </label>
                                </c:if>   



                        </div>
                    </c:forEach>

                </div>
                <div class="d-flex align-items-center pt-3">
                    <div id="prev"> <button name="btnAction" value="previous" type="submit" class="btn btn-primary">Previous</button> </div>
                    <div style="display: none;" id="timeSubmit"> <button name="btnAction" value="timeSubmit" type="submit" class="btn btn-primary">Time Summit</button> </div>

                    <c:if test="${index == range-1}">
                        <div class="ml-auto mr-sm-5"><button name="btnAction" value="finish" type="submit" class="btn btn-success">Finish</button> </div>  
                    </c:if>

                    <c:if test="${index < range-1}">
                        <div class="ml-auto mr-sm-5"><button name="btnAction" value="next" type="submit" class="btn btn-success">Next</button> </div>
                    </c:if>

                </div>

                <input type="hidden" name="indexSave"  value="${index}">
                <input  type="hidden" name="questionSave"  value="${question.getQuestionId()}">

            </form>
            <h3>${requestScope.message}</h3>
        </div>
        <input id="url" type="hidden" value="${pageContext.request.contextPath}\Servlet/TimerFinishQuizServlet?btnAction=timerFinish">
        <script type='text/javascript' async src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <script type='text/javascript' async src='https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js'></script>
    </body>

</html>