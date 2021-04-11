<%-- 
    Document   : result
    Created on : Feb 2, 2021, 4:33:13 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Result</title>
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

        <div class="container">
            <h2>Result Of Quiz</h2>


            <div class="tab-content">
                <div id="home" class="tab-pane fade in active">
                    <table class="table table-bordered ">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Total Question</th>

                                <th>Correct</th>
                                <th>Total Score</th>


                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>${requestScope.totalQuestion}</td>
                                <td>${requestScope.correctQuestion}</td>
                                <td>${requestScope.totalScore}</td>

                            </tr>

                        </tbody>

                    </table>
                    <td> <a class="btn btn-danger btn-md" href="${pageContext.request.contextPath}/" >Back To Home Page</a></td>
                </div>

            </div>
        </div>

    </body>

</html>
