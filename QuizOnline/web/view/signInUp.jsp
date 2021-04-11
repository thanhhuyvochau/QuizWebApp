<%-- 
    Document   : signInUp
    Created on : Jan 26, 2021, 9:44:45 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Login</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='../asset/register.css'>
        <script src="../script/register.js"></script>
        <link rel='stylesheet' type='text/css' media='screen' href='./asset/register.css'>
        <script src="./script/register.js"></script>


    </head>

    <body>
       
        <div class="login-wrap">
            <div class="login-html">
                <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
                <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
                <div class="login-form">
                    <form action="${pageContext.request.contextPath}\Servlet/LoginServlet" method="POST">


                        <div class="sign-in-htm">
                            <div class="group">
                                <label for="user" class="label">Email</label>
                                <input id="user" type="text" class="input" name="userId" value="${requestScope.userId}">
                            </div>
                            <div class="group">
                                <label for="pass" class="label">Password</label>
                                <input id="pass" type="password" class="input" data-type="password" name="password">
                            </div>

                            <div class="group">
                                <input type="submit" class="button" value="Sign In">
                            </div>
                            <div class="group">
                                <h3>${requestScope.message}</h3>
                            </div>
                            <div class="hr"></div>

                    </form>
                </div>
                <div class="sign-up-htm">
                    <form action="${pageContext.request.contextPath}\Servlet/RegisterServlet" method="POST">
                        <div class="group">
                            <label for="pass" class="label">Email</label>
                            <input id="email" type="text" class="input" name="emailR" value="${requestScope.userIdR}">
                        </div>
                        <div class="group">
                            <label for="user" class="label">Username</label>
                            <input id="user" type="text" class="input" name="nameR" value="${requestScope.userName}">
                        </div>
                        <div class="group">
                            <label for="pass" class="label">Password</label>
                            <input id="passSignIn" type="password" class="input" data-type="password" name="passwordR" value="${requestScope.userPassword}">
                        </div>
                        <div class="group">
                            <label for="pass" class="label">Repeat Password</label>
                            <input id="passSignInRe" type="password" class="input" data-type="password" name="rePasswordR" value="${requestScope.userRePassword}">
                        </div>

                        <div class="group">
                            <input type="submit" class="button" value="Sign Up">
                        </div>
                        <div class="group">
                                <h3>${requestScope.messageRegister}</h3>
                            </div>
                        <div class="hr"></div>
                        <div class="foot-lnk">
                            <label for="tab-1">Already Member?</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>

</html>