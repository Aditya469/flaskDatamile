#! Installation & Setup  -- Tested on windows 11
#! Last Updated on: 17/07/2024
#! Developer: Rama Kolluri - JavaScript Used: Bootstrap 4.

0. Git clone the repository with the following command

git clone https://github.com/Aditya469/flaskDatamile

1. To overwrite an existing requirements.txt file, use the --force option:

pipreqs . --force

2. To Save the requirements into a file:

pipreqs . --savepath ./requirements.txt

4. Create Python Virtual Environment 

python -m venv venv

5. Activate virtual Environment

venv\Scripts\Activate

6. To install the library requirements (python dependencies)

pip install -r requirements.txt

(OR)

python -m pip install -r requirements.txt

7. If these don't work then check for the python path and add it to the System Environment Variable.

7.1. To find the python path

where python

Then add that path to the System Environment `Path` variable and repeat step - 6.
8. Choose database MySQL or XAMPP (MariaDB)

8.1. Install MySQL server either through xampp or individually 

8.1.1. For MySQL installation follow the following steps:

8.1.2. Install MySQL Server:

Follow the installation steps outlined in the search results, particularly from source . Here's a summary:

Download the MySQL installer from 

https://dev.mysql.com/downloads/installer/

8.1.3. Run the installer and choose the "Developer Default" or "Custom" setup type

Install MySQL Server and MySQL Workbench

Configure the server with a root password

Complete the installation

8.2 To install MariaDB (XAMPP) with PhpMyAdmin (sql - workbench {GUI} equivalent)

https://www.apachefriends.org/download.html


8.2.1*. To mitigate the database crash add the following lines to 'xampp\MySQL\bin\my.ini file':

innodb_force_recovery = 0
skip-grant-tables

9. Install nginx, run it for windows to get access and change the port to ':90' as the app is designated for running on port:90.
and create database namely 'datamile' and then run the 'sql_file_proces.._tables files for database tables and Procedures setup.

10. To setup database in MySQL/MariaDB:

mysql -u root -p < setup_database.sql

11. To run like a desktop app, use the 'run_flask_app.bat', create a shortcut, right-click select properties and set a icon.

12. Copy the 'flask_app.conf' & 'nginx.conf' files from "Server Setup files" to directory "C:\nginx\conf\"

13. Perfect now install further required server requirements with the following commands.

    pip install waitress
    
    python wsgi.py

14. Setup the flask application to run as a windows service to enable the application to run automatically on a local server.

14.1. Unzip the 'nssm-2.24.zip' from "Server Setup files" to "C:\"

14.2. Open cmd with Administrator (right-click), and continue with the following commands:

   cd "C:\nssm\win64\"

   nssm install FlaskService

14.3. In the GUI that appears, set the following:

Path: Full path to your Python executable (example- "C:\Users\Rama\AppData\Local\Programs\Python\Python311\python.exe" )

Startup directory: Your project directory  (example- "C:\Users\Rama\flaskDatamile\project" ) -- it depends on your git cloned directory.

Arguments: Full path to your wsgi.py file (example- "C:\Users\Rama\flaskDatamile\wsgi.py" )

15. Now run the windows service with the following command:

    nssm start FlaskService



