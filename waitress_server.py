#!C:\Users\Rama\flaskDatamile\venv\Scripts\python.exe
import win32serviceutil
import win32service
import win32event
import servicemanager
import socket
import sys
from waitress import serve
from project import create_app

class WaitressService(win32serviceutil.ServiceFramework):
    _svc_name_ = "WaitressServerService"
    _svc_display_name_ = "Waitress Server Service"

    def __init__(self, args):
        win32serviceutil.ServiceFramework.__init__(self, args)
        self.hWaitStop = win32event.CreateEvent(None, 0, 0, None)
        socket.setdefaulttimeout(60)

    def SvcStop(self):
        self.ReportServiceStatus(win32service.SERVICE_STOP_PENDING)
        win32event.SetEvent(self.hWaitStop)

    def SvcDoRun(self):
        servicemanager.LogMsg(servicemanager.EVENTLOG_INFORMATION_TYPE,
                              servicemanager.PYS_SERVICE_STARTED,
                              (self._svc_name_, ''))
        self.main()

    def main(self):
        app = create_app()
        serve(app, host='0.0.0.0', port=90)

if __name__ == '__main__':
    if len(sys.argv) == 1:
        servicemanager.Initialize()
        servicemanager.PrepareToHostSingle(WaitressService)
        servicemanager.StartServiceCtrlDispatcher()
    else:
        win32serviceutil.HandleCommandLine(WaitressService)