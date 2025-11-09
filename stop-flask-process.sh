#!/bin/bash
 echo "🛑 Checking for Flask app process (python3 app.py)..."

    # Get the process ID (PID) of python3 app.py
    pid=$(ps aux | grep "python3 app.py" | grep -v "grep" | awk '{print $2}')

    # Check if PID exists
    if [ -n "$pid" ]; then
        echo "⚙️ Found Flask app running with PID: $pid"
        kill "$pid"
        sleep 1

        # Verify if process stopped
        if ps -p "$pid" > /dev/null 2>&1; then
            echo "❌ Flask app failed to stop."
        else
            echo "✅ Flask app stopped successfully."
        fi
    else
        echo "ℹ️ No running Flask app process found."
    fi


<<Notes(multiline comment
not when we run grep "python3 app.py" if app.py running than it show 2 process 1 is app.py and 2 is grep itself 
[root@ip-172-31-19-16 flask-app]# ps aux | grep "python3 app.py"
root       33026  2.5  2.9 252984 28508 pts/0    S    08:46   0:00 python3 app.py
root       33082  0.0  0.2 222336  2084 pts/0    S+   08:46   0:00 grep --color=auto python3 app.py (this process is for grep itself, means we have to consider only one 33026 process running second process is use by grep for find the processes)
ps aux | grep "python3 app.py" | grep -v "grep" | awk '{print $2}' so using this command grep -v "grep" we remove process number 2 (33082) so now we have rest 1 process output.
awk '{print $2} -> using this command we take output of previous command and {print $2} this means give only second column output.which is 33026 and if we right {print $1} than give root in output 
Notes 
