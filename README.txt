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

8*. To mitigate the database crash add the following lines to 'xampp\MySQL\bin\my.ini file':

innodb_force_recovery = 0
skip-grant-tables

9. Install nginx, run it for windows to get access and change the port to ':90' as the app is designated for running on port:90.

10. Install MySQL server either through xampp or individually 

10.1 For MySQL installation follow the following steps:

Install MySQL Server:
Follow the installation steps outlined in the search results, particularly from source . Here's a summary:
Download the MySQL installer from 

https://dev.mysql.com/downloads/installer/

Run the installer and choose the "Developer Default" or "Custom" setup type
Install MySQL Server and MySQL Workbench
Configure the server with a root password
Complete the installation

10.2 To install MariaDB (XAMPP) with PhpMyAdmin (sql - workbench {GUI} equivalent)

https://www.apachefriends.org/download.html

Configure the server with out a password or follow the following steps for password setup

10.3 Only Server (limited to terminal usage only) -- No GUI 

https://dev.mysql.com/downloads/mysql/

While installation setup the root user and password for root@localhost


and create database namely 'datamile' and then run the 'sql_file_proces.._tables files for database tables and Procedures setup.

11. To connect with the database setup file:

mysql -u root -p < setup_database.sql
