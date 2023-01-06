# Here is a Python code that can be used to check the available resources (CPU, GPU, memory, and disk space) on a Red Hat Linux system, as well as the running jobs:
# This code defines several functions that use the subprocess module to run Linux commands and retrieve the output. The check_cpu() function runs the mpstat command to get CPU usage information, the check_gpu() function runs the nvidia-smi command to get GPU usage information (assuming that the system has an NVIDIA GPU), the check_memory() function runs the free command to get memory usage information, the check_disk_space() function runs the df command to get disk space usage information, and the check_running_jobs() function runs the ps command to get information about running jobs.

import subprocess

def check_cpu():
  # Get CPU usage information
  result = subprocess.run(["mpstat"], stdout=subprocess.PIPE)
  print(result.stdout.decode())

def check_gpu():
  # Get GPU usage information
  result = subprocess.run(["nvidia-smi"], stdout=subprocess.PIPE)
  print(result.stdout.decode())

def check_memory():
  # Get memory usage information
  result = subprocess.run(["free", "-m"], stdout=subprocess.PIPE)
  print(result.stdout.decode())

def check_disk_space():
  # Get disk space usage information
  result = subprocess.run(["df", "-h"], stdout=subprocess.PIPE)
  print(result.stdout.decode())

def check_running_jobs():
  # Get information about running jobs
  result = subprocess.run(["ps", "-ef"], stdout=subprocess.PIPE)
  print(result.stdout.decode())

# Call the functions to print the resource usage and running job information
check_cpu()
check_gpu()
check_memory()
check_disk_space()
check_running_jobs()



# To use this code, simply run it as a Python script. It will print the resource usage and running job information to the console.
