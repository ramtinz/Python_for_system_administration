# This is a Shell script to check if Python is available
if command -v python3 &>/dev/null; then
  echo "Python is available."
else
  echo "Python is not available."
  # Prompt the user to install Python
  read -p "Do you want to install Python? [Y/n] " install_python
  if [ "$install_python" = "Y" ] || [ "$install_python" = "y" ]; then
    # Install Python using the package manager
    if command -v yum &>/dev/null; then
      # Use yum to install Python
      yum install python3
    elif command -v apt-get &>/dev/null; then
      # Use apt-get to install Python
      apt-get install python3
    elif command -v dnf &>/dev/null; then
      # Use dnf to install Python
      dnf install python3
    else
      echo "No package manager was found. Python cannot be installed."
    fi
  fi
fi


# This script uses the command -v command to check if the python3 command is available. If it is not available, it prompts the user to install Python and then installs it using the appropriate package manager (either yum, apt-get, or dnf).

# To use this script, simply save it to a file and make it executable with the chmod command, then run it with ./filename. It will check if Python is available and provide options to install it if necessary.
