@echo off
TITLE ����Сֽ�� by @luren0313 ��װ�ű� by @JueLuo
echo. -----------------------------------------------------------------
echo.        ��ȷ�ϵ���ĵ���������ֱ�������ͬһ���߾�����
echo.        Confirm the computer and your Tic in a same WLAN
echo.
echo.        ����㲻֪����ο���ADB���ܣ���������·�ʽ��
echo.        If you don't know how to use ADB, please read the help below:
echo.
echo.
echo.        ��������汾�ţ������á������У�ֱ�����������ѽ��뿪����ģʽ����
echo.        Click Build number(in Setting��About) until you see "You are a Developer now!"
echo.
echo.        �� ���á����������á�ADB���� ����Ϊ ����
echo.        Set Developer options ADB debugging(in Setting��Developer options) to Enabled
echo.
echo.        �� ���á����������á�����ADB���� ����Ϊ ����
echo.        Set Debug over WLAN(in Setting��Developer options) to Enabled
echo.
echo.        ׼���ú����������...
echo.        Press any key to continue...
echo. -----------------------------------------------------------------
pause>NUL
CLS



echo. -----------------------------------------------------------------
echo.       ����������ֱ��IP
echo.       Please input the IP address of your Tic
echo.
echo.       ����������á�WLAN���߼��￴������ֱ��IP��ַ       
echo.       You kan see your IP from Setting��WLAN��Advanced
echo. -----------------------------------------------------------------
echo.
echo.



set /p IP= ���IP��Your IP��:
echo.
adb connect %IP%:7272 | find "connected" || goto ConnectFailed
echo.
goto install



:install
echo.       ���ӳɹ���������ʼ��װ...
echo.       Connect successfully��Ready to install...
echo.
adb install app-release.apk | find "Success" || goto InstallFailed
echo.
echo.       ��װ��ɣ�
echo.       Install Successfully!
echo.
echo.       ��������˳�...
echo.       Press any key to exit...
pause>NUL
exit



:ConnectFailed
echo.       �޷�������%IP%:7272������������ã�
echo.       Unable to connect %IP%:7272, please check your settings!
echo.
echo.       ��������˳�...
echo.       Press any key to exit...
pause>NUL
exit



:InstallFailed
echo.       ��װʧ�ܣ��볢�����°�װ��
echo.       Install Failed, please try again!
echo.
echo.       ��������˳�...
echo.       Press any key to exit...
pause>NUL
exit