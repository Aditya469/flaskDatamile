@echo off
cd C:\nginx
start nginx

cd C:\Users\Rama\flaskDatamile
start /B venv\Scripts\activate && python wsgi.py

