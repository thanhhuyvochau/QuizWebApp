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

function initializeClock(endtime) {

const display = document.querySelector('#safeTimerDisplay');
        function updateClock() {
        const t = getTimeRemaining(endtime);
                display.value = t.minutes + ":" + t.seconds;
                if (t.total <= 0) {
        var url = document.querySelector('#url').value;
                var form = document.querySelector('#quiz_form');
                form.action = url;
                console.log(url);
                form.submit();
                clearInterval(timeinterval);
        }
        }

updateClock();
        const timeinterval = setInterval(updateClock, 1000);
        }
var x = document.querySelector('#time').value;
        const deadline = new Date(Date.parse(new Date()) + x * 1000);
        initializeClock(deadline);