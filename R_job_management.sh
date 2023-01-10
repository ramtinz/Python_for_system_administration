#!/bin/bash

# Name of the R script to run
SCRIPT_NAME="my_script.R"

# Maximum amount of memory the script can use (in bytes)
MEM_LIMIT="500M"

# Maximum amount of CPU time the script can use (in seconds)
CPU_LIMIT="300"

# GPU index
GPU_INDEX=0

# Maximum GPU memory usage for script (in percentage)
GPU_MEM_LIMIT=90

# Start the script as a background job and set resource limits
ulimit -v $MEM_LIMIT
ulimit -t $CPU_LIMIT
CUDA_VISIBLE_DEVICES=$GPU_INDEX nohup Rscript $SCRIPT_NAME &> /dev/null &

# Print the process ID of the script
echo "Process ID: $!"

# Store process ID in variable
PROCESS_ID=$!

# Limit GPU memory usage
nvidia-smi --pid=$PROCESS_ID --gpu-reset-throttling
nvidia-smi --pid=$PROCESS_ID --applications-clocks=maximum
nvidia-smi --pid=$PROCESS_ID --memory-bandwidth=maximum
nvidia-smi --pid=$PROCESS_ID --auto-boost-default=ENABLED
nvidia-smi --pid=$PROCESS_ID --compute-mode=DEFAULT
nvidia-smi --pid=$PROCESS_ID --set-gpu-memory-limit=$GPU_MEM_LIMIT


# In this script, it starts by setting the limits of memory and CPU usage using the ulimit command and then starts the R script using the Rscript command.
# It then sets the GPU index to be used in the script via the GPU_INDEX variable and the maximum GPU memory usage in percentage using the GPU_MEM_LIMIT variable, after that it uses the NVIDIA System Management Interface (nvidia-smi) command-line utility to set the GPU memory limit for the process.

# The script prints the process ID of the R script using the special variable $! and then stores it in the variable PROCESS_ID for later usage.

# You can then use this process ID to check the status of the script or to stop it if necessary using the kill command.

# kill -9 <process_id>

# Please keep in mind that this script assumes that you have NVIDIA GPUs, and the NVIDIA driver and CUDA Toolkit are properly installed in your system. Also, you need to make sure that the R script use GPU functionalities.
