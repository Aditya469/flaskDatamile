import subprocess
import time
import os

# Set the working directory for Nginx
nginx_working_dir = r'C:\nginx'
os.chdir(nginx_working_dir)

# Start Nginx
nginx_command = r'C:\nginx\nginx.exe'
subprocess.Popen(nginx_command)

# Wait for Nginx to start
time.sleep(10)

# Set the working directory for the Flask application
flask_working_dir = r'C:\Users\Rama\flaskDatamile'
os.chdir(flask_working_dir)

# Activate virtual environment and start Flask application
venv_activate = r'C:\Users\Rama\flaskDatamile\venv\Scripts\activate.bat'
flask_app_command = r'python wsgi.py'

# Use subprocess to run the activation and Flask app commands
subprocess.Popen(f'{venv_activate} && {flask_app_command}', shell=True)



