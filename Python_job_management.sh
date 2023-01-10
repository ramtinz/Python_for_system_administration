#!/bin/bash

# Name of the Python script to run
SCRIPT_NAME="my_script.py"

# Maximum amount of memory the script can use (in bytes)
MEM_LIMIT="500M"

# Maximum amount of CPU time the script can use (in seconds)
CPU_LIMIT="300"

# Start the script as a background job and set resource limits
ulimit -v $MEM_LIMIT
ulimit -t $CPU_LIMIT
nohup python3 $SCRIPT_NAME &> /dev/null &

# Print the process ID of the script
echo $!


# a shell script that runs a Python script as a background job and sets limits on the resources it can use and the time it can run

# In this example, the script first sets the name of the Python script to run in the variable SCRIPT_NAME. It then sets the maximum amount of memory the script can use in the variable MEM_LIMIT, and the maximum amount of CPU time the script can use in the variable CPU_LIMIT.

# The ulimit command is used to set resource limits for the current shell and its child processes. The -v option sets the maximum amount of virtual memory (in bytes) that the script can use, and the -t option sets the maximum amount of CPU time (in seconds) that the script can use.

# The script then starts the Python script as a background job using the nohup command, which allows the script to continue running even if the terminal is closed. The &> /dev/null redirects stdout and stderr to /dev/null, so that it doesn’t interfere with terminal output. And the last ‘&’ is to run it as a background process.

# Finally, the script prints the process ID of the Python script using the echo command and the special variable $!, which contains the process ID of the last background job.

# You can then use this process ID to check the status of the script or to stop it if necessary using the kill command.

# You should also adjust the limits of the resources and the path of the script to match your requirement.

# kill -9 <process_id>
