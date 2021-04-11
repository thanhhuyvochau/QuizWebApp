<%-- 
    Document   : adminPage
    Created on : Jan 30, 2021, 5:06:25 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <title>DashBoard</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            body{
                background: #c8c8c8;
            }
        </style>
    </head>

    <body>     
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="alignment-example">

                    <!-- Links -->
                    <ul class="nav navbar-nav navbar-right">                     
                        <li class="dropdown">
                            <a  class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Menu<span class="caret"></span></a>
                            <ul class="dropdown-menu" aria-labelledby="about-us">

                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}\Servlet/LogOutServlet">Logout</a></li>      

                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>





    </nav>
    <div class="container">
        <div class="container">

        </div>
        <div class="container">
            <h1 style="text-align: center;">Question Manager</h1>
            <div class="row">

                <div class="col-sm-8">
                    <form action="${pageContext.request.contextPath}\Servlet/SearchServlet" method="GET" id="SearchForm">
                        <label onclick="searchByName()" for="searchName">Search By Name</label>
                        <input checked="checked" onclick="searchByName()" type="radio" value="searchName" name="searchOption" id="searchName" />
                        <input type="text" id="txtName" name="questionName" value="${requestScope.questionName}">
                        <hr>

                        <label onclick="searchByStatus()" for="searchStatus">Search By Status</label>
                        <input onclick="searchByStatus()" type="radio" value="searchStatus" name="searchOption" id="searchStatus" />
                        <select name="questionStatus" id="status">


                            <c:if test="${requestScope.searchStatus == 'Active'}">
                                <option selected value="true">Active</option>
                            </c:if>

                            <c:if test="${requestScope.searchStatus != 'Active'}">
                                <option value="true">Active</option>
                            </c:if>

                            <c:if test="${requestScope.searchStatus == 'InActive'}">
                                <option selected value="false">InActive</option>
                            </c:if> 

                            <c:if test="${requestScope.searchStatus != 'InActive'}">
                                <option value="false">InActive</option>
                            </c:if> 



                        </select>
                        <hr>

                        <label onclick="searchBySubject()" for="searchSubject">Search By Subject</label>
                        <input onclick="searchBySubject()" type="radio" value="searchSubject" name="searchOption" id="searchSubject" />
                        <select name="questionSubject" id="subject">
                            <c:forEach var="subj" items="${requestScope.subjectList}">
                                <c:if test="${requestScope.searchSubject == subj.getSubjectId()}">
                                    <option selected value="${subj.getSubjectId()}">${subj.getSubjectName()}</option>
                                </c:if>
                                <c:if test="${requestScope.searchSubject != subj.getSubjectId()}">
                                    <option value="${subj.getSubjectId()}">${subj.getSubjectName()}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                        <hr>
                    </form>
                </div>
                <div class="col-sm-4">
                    <button form="SearchForm" type="submit" name="" id="" class="btn btn-primary btn-block">Search</button>
                    <h3>Number Of Question:${requestScope.numOfQues}</h3>
                </div>

            </div>
            <c:set var="selected" value="${requestScope.tabSelected}"/>
            <ul class="nav nav-tabs">
                <c:if test="${selected == 'PRJ311' || selected == null}">
                    <li  class="active"><a data-toggle="tab" href="#home">PRJ311</a></li>
                    <li><a data-toggle="tab" href="#menu1">PRJ321</a></li> 
                    </c:if>

                <c:if test="${selected == 'PRJ321'}">
                    <li><a data-toggle="tab" href="#home">PRJ311</a></li>
                    <li class="active"><a data-toggle="tab" href="#menu1">PRJ321</a></li> 
                    </c:if>


            </ul>

            <div class="tab-content">
                <c:if test="${selected == 'PRJ311' || selected == null}">
                    <div id="home" class="tab-pane fade in active">   
                    </c:if>   

                    <c:if test="${selected == 'PRJ321'}">
                        <div id="home" class="tab-pane fade">   
                        </c:if>   
                        <table class="table table-bordered ">
                            <thead>
                                <tr>
                                    <th>Question Id</th>
                                    <th>Content</th>

                                    <th>Correct Answer</th>
                                    <th>Answer 1</th>
                                    <th>Answer 2</th>
                                    <th>Answer 3</th>
                                    <th>Status</th>
                                    <th></th>
                                    <th></th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="ques" items="${requestScope.PRJ311}">
                                <form action=""></form>
                                <tr>
                                    <td>${ques.getQuestionId()}</td>
                                    <td>${ques.getQuestionContent()}
                                    </td>
                                    <c:set var="crAnswer" value="" scope="page"/>
                                    <c:forEach var="a1" items="${ques.getAnswers()}">
                                        <c:if test="${a1.isIsCorrect() == true}">
                                            <td>${a1.getAnswerContent()}</td>
                                            <c:set var="crAnswer" value="${a1}" scope="page"/>
                                        </c:if>                   
                                    </c:forEach>

                                    <c:forEach var="a1" items="${ques.getAnswers()}">
                                        <c:if test="${a1 != crAnswer}">
                                            <td>${a1.getAnswerContent()}</td>     
                                        </c:if>                                        
                                    </c:forEach>
                                    <td>${ques.getStatusInString()}</td>
                                    <td><a name=" " id=" " class="btn btn-warning btn-md " href="${pageContext.request.contextPath}\Servlet/UpdateServlet?questionId=${ques.getQuestionId()}" role="button ">Update</a></td>
                                    <td> <a name=" " id=" " class="btn btn-danger btn-md"href="${pageContext.request.contextPath}\Servlet/DeleteServlet?questionId=${ques.getQuestionId()}" role="button ">Delete</a></td>
                                </tr>
                            </c:forEach>
                            </tbody>

                        </table>

                        <a name=" " id=" " class="btn btn-success " href="${pageContext.request.contextPath}\Servlet/CreateServlet" role="button ">Create Question</a>
                        <a name=" " id=" " class="btn btn-warning " href="${pageContext.request.contextPath}\Servlet/LoadAdminPage" role="button ">Load All Question</a>
                        <ul class="pagination" style="margin-left: 30%;">
                            <c:set var="pagePRJ311" value="${requestScope.pagePRJ311}"/>
                            <c:forEach var="page" begin="${pagePRJ311.getFirstPage()}" end="${pagePRJ311.getLastPage()}">    
                                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}\Servlet/${requestScope.servlet}?indexPRJ311=${page}${requestScope.searchData}${requestScope.searchMethod}">${page}</a></li>
                                </c:forEach>


                        </ul>
                    </div>




                    <c:if test="${selected == 'PRJ311' || selected == null}">
                        <div id="menu1" class="tab-pane fade">  
                        </c:if>   

                        <c:if test="${selected == 'PRJ321'}">
                            <div id="home" class="tab-pane fade in active">   
                            </c:if>        

                            <table class="table table-bordered ">
                                <thead>
                                    <tr>
                                        <th>Question Id</th>
                                        <th>Content</th>

                                        <th>Correct Answer</th>
                                        <th>Answer 1</th>
                                        <th>Answer 2</th>
                                        <th>Answer 3</th>
                                        <th>Status</th>
                                        <th></th>
                                        <th></th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="ques" items="${requestScope.PRJ321}">
                                        <tr>
                                            <td>${ques.getQuestionId()}</td>
                                            <td>${ques.getQuestionContent()}
                                            </td>
                                            <c:set var="crAnswer2" value="" scope="page"/>
                                            <c:forEach var="a1" items="${ques.getAnswers()}">
                                                <c:if test="${a1.isIsCorrect() == true}">
                                                    <td>${a1.getAnswerContent()}</td>
                                                    <c:set var="crAnswer2" value="${a1}" scope="page"/>
                                                </c:if>                   
                                            </c:forEach>

                                            <c:forEach var="a1" items="${ques.getAnswers()}">
                                                <c:if test="${a1 != crAnswer2}">
                                                    <td>${a1.getAnswerContent()}</td>     
                                                </c:if>                                        
                                            </c:forEach>
                                            <td>${ques.getStatusInString()}</td>
                                            <td><a name=" " id=" " class="btn btn-warning btn-md " href="${pageContext.request.contextPath}\Servlet/UpdateServlet?questionId=${ques.getQuestionId()}" role="button ">Update</a></td>
                                            <td> <a name=" " id=" " class="btn btn-danger btn-md"href="${pageContext.request.contextPath}\Servlet/DeleteServlet?questionId=${ques.getQuestionId()}" role="button ">Delete</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>

                            </table>

                            <a name=" " id=" " class="btn btn-success " href="${pageContext.request.contextPath}\Servlet/CreateServlet" role="button ">Create Question</a>
                            <a name=" " id=" " class="btn btn-warning " href="${pageContext.request.contextPath}\Servlet/LoadAdminPage" role="button ">Load All Question</a>

                            <ul class="pagination" style="margin-left: 30%;">



                                <c:set var="pagePRJ321" value="${requestScope.pagePRJ321}"/>
                                <c:forEach var="page" begin="${pagePRJ321.getFirstPage()}" end="${pagePRJ321.getLastPage()}">    
                                    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}\Servlet/${requestScope.servlet}?indexPRJ321=${page}${requestScope.searchData}${requestScope.searchMethod}">${page}</a></li>
                                    </c:forEach>

                            </ul> 
                        </div>

                    </div>
                </div>






                </body>

                <script>

                    function searchByName() {
                        document.getElementById("subject").disabled = true;
                        document.getElementById("txtName").disabled = false;
                        document.getElementById("status").disabled = true;
                    }

                    function searchByStatus() {
                        document.getElementById("subject").disabled = true;
                        document.getElementById("txtName").disabled = true;
                        document.getElementById("status").disabled = false;
                    }

                    function searchBySubject() {
                        document.getElementById("subject").disabled = false;
                        document.getElementById("txtName").disabled = true;
                        document.getElementById("status").disabled = true;
                    }
                    searchByName();
                </script>













                <!-- Optional JavaScript -->
                <!-- jQuery first, then Popper.js, then Bootstrap JS -->
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js " integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo " crossorigin="anonymous "></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js " integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1 " crossorigin="anonymous "></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js " integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM " crossorigin="anonymous "></script>
                </body>

                </html>
