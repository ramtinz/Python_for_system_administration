# Here is a simple Python code that performs some basic Linux administrative tasks:

import subprocess

def list_files():
  # List all files in the current directory
  subprocess.run(["ls", "-l"])

def create_file(filename):
  # Create a new file with the given name
  subprocess.run(["touch", filename])

def delete_file(filename):
  # Delete the file with the given name
  subprocess.run(["rm", filename])

def set_permissions(filename, permissions):
  # Set the permissions of the file with the given name to the specified value
  subprocess.run(["chmod", permissions, filename])

def change_owner(filename, owner):
  # Change the owner of the file with the given name to the specified user
  subprocess.run(["chown", owner, filename])
