#!C:\Users\Rama Kolluri\flaskDatamile\venv\Scripts\python.exe

import win32serviceutil
import win32service
import win32event
import servicemanager
import socket
import sys
import logging
import traceback
from pathlib import Path
from project import create_app
from waitress import serve

class FlaskService(win32serviceutil.ServiceFramework):
    _svc_name_ = "FlaskAppService"
    _svc_display_name_ = "Flask Application Service"

    def __init__(self, args):
        win32serviceutil.ServiceFramework.__init__(self, args)
        self.hWaitStop = win32event.CreateEvent(None, 0, 0, None)
        socket.setdefaulttimeout(60)
        self.logger = self._setup_logging()

    def _setup_logging(self):
        log_dir = Path('C:/Logs')
        log_dir.mkdir(exist_ok=True)
        logger = logging.getLogger('FlaskService')
        logger.setLevel(logging.DEBUG)
        file_handler = logging.FileHandler(log_dir / 'flask_service.log')
        file_handler.setFormatter(logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s'))
        logger.addHandler(file_handler)
        return logger

    def SvcStop(self):
        self.logger.info('Stopping service...')
        self.ReportServiceStatus(win32service.SERVICE_STOP_PENDING)
        win32event.SetEvent(self.hWaitStop)

    def SvcDoRun(self):
        self.logger.info('Starting service...')
        self.ReportServiceStatus(win32service.SERVICE_START_PENDING)
        try:
            self.main()
        except Exception as e:
            self.logger.exception(f"Service failed to run: {str(e)}")
            self.logger.error(traceback.format_exc())

    def main(self):
        self.logger.info('Service is running.')
        self.ReportServiceStatus(win32service.SERVICE_RUNNING)
        try:
            app = create_app()
            self.logger.info('Flask app created successfully')
            serve(app, host='0.0.0.0', port=90)
        except Exception as e:
            self.logger.exception(f"Error in main function: {str(e)}")
            self.logger.error(traceback.format_exc())

if __name__ == '__main__':
    if len(sys.argv) == 1:
        servicemanager.Initialize()
        servicemanager.PrepareToHostSingle(FlaskService)
        servicemanager.StartServiceCtrlDispatcher()
    else:
        win32serviceutil.HandleCommandLine(FlaskService)