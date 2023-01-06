# Here is a Python code that can be used to check if Docker is available and if there are any running Docker containers on a Red Hat Linux system:

# This code defines two functions: check_docker() and check_running_containers(). The check_docker() function uses the subprocess module to run the docker command with the -v flag, which prints the version of Docker that is installed on the system. If the docker command is not found, it means that Docker is not available on the system. The check_running_containers() function runs the docker ps command, which lists the running Docker containers. If the command returns any output, it means that there are running containers.

import subprocess

def check_docker():
  # Check if Docker is available
  try:
    result = subprocess.run(["docker", "-v"], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    print("Docker is available.")
  except FileNotFoundError:
    print("Docker is not available.")

def check_running_containers():
  # Check if there are any running Docker containers
  result = subprocess.run(["docker", "ps"], stdout=subprocess.PIPE)
  if result.stdout:
    print("There are running Docker containers.")
  else:
    print("There are no running Docker containers.")

# Call the functions to check the availability of Docker and running containers
check_docker()
check_running_containers()


# To use this code, simply run it as a Python script. It will print the availability of Docker and the presence of running containers to the console.
