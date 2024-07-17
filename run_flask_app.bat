@echo off
echo Starting Nginx... > C:\Users\Rama\flaskDatamile\service.log
cd C:\nginx
start nginx >> C:\Users\Rama\flaskDatamile\service.log 2>&1

timeout /t 10 /nobreak

echo Starting Flask application... >> C:\Users\Rama\flaskDatamile\service.log
cd C:\Users\Rama\flaskDatamile
start /B venv\Scripts\activate && python wsgi.py >> C:\Users\Rama\flaskDatamile\service.log 2>&1
