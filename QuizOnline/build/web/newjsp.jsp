<%-- 
    Document   : newjsp
    Created on : Feb 2, 2021, 7:58:59 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                text-align: center;
                background: #00ECB9;
                font-family: sans-serif;
                font-weight: 100;
            }

            h1{
                color: #396;
                font-weight: 100;
                font-size: 40px;
                margin: 40px 0px 20px;
            }

            #clockdiv{
                font-family: sans-serif;
                color: #fff;
                display: inline-block;
                font-weight: 100;
                text-align: center;
                font-size: 30px;
            }

            #clockdiv > div{
                padding: 10px;
                border-radius: 3px;
                background: #00BF96;
                display: inline-block;
            }

            #clockdiv div > span{
                padding: 15px;
                border-radius: 3px;
                background: #00816A;
                display: inline-block;
            }

            .smalltext{
                padding-top: 5px;
                font-size: 16px;
            }
        </style>
    </head>
    <body>
        <h1>Countdown Clock</h1>
        <div id="clockdiv">
            <div>
                <span class="days"></span>
                <div class="smalltext">Days</div>
            </div>
            <div>
                <span class="hours"></span>
                <div class="smalltext">Hours</div>
            </div>
            <div>
                <span class="minutes"></span>
                <div class="smalltext">Minutes</div>
            </div>
            <div>
                <span class="seconds"></span>
                <div class="smalltext">Seconds</div>
            </div>
        </div>
         <input type="hidden" name="time" id="time" value="${3}">
         <input type="text" id="text">
        <script>


            function getTimeRemaining(endtime) {
            const total = Date.parse(endtime) - Date.parse(new Date());
            const seconds = Math.floor((total / 1000) % 60);
            const minutes = Math.floor(total / 1000 / 60);
            
            return {
            total,                 
                    minutes,
                    seconds
            };
            }

            function initializeClock(id, endtime) {
            const clock = document.getElementById(id);           
            const minutesSpan = document.querySelector('.minutes');
            const secondsSpan = document.querySelector('.seconds');
            function updateClock() {
            const t = getTimeRemaining(endtime);
            document.querySelector('#text').value = t.minutes + '-' +  t.seconds;
            minutesSpan.innerHTML = t.minutes;
            secondsSpan.innerHTML = t.seconds;
            if (t.total <= 0) {
            clearInterval(timeinterval);
            }
            }

            updateClock();
            const timeinterval = setInterval(updateClock, 1000);
            }
            var x = document.querySelector('#time').value;
            const deadline = new Date(Date.parse(new Date()) + x  * 1000);
            initializeClock('clockdiv', deadline);
        </script>
    </body>
</html>
