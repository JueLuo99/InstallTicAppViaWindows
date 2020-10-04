@echo off
TITLE 腕上小纸条 by @luren0313 安装脚本 by @JueLuo
echo. -----------------------------------------------------------------
echo.        请确认的你的电脑与你的手表正处于同一无线局域网
echo.        Confirm the computer and your Tic in a same WLAN
echo.
echo.        如果你不知道如何开启ADB功能，请参照以下方式：
echo.        If you don't know how to use ADB, please read the help below:
echo.
echo.
echo.        连续点击版本号（在设置→关于中）直到看到“你已进入开发者模式！”
echo.        Click Build number(in Setting→About) until you see "You are a Developer now!"
echo.
echo.        将 设置→开发者设置→ADB调试 设置为 允许
echo.        Set Developer options ADB debugging(in Setting→Developer options) to Enabled
echo.
echo.        将 设置→开发者设置→网络ADB调试 设置为 允许
echo.        Set Debug over WLAN(in Setting→Developer options) to Enabled
echo.
echo.        准备好后按任意键继续...
echo.        Press any key to continue...
echo. -----------------------------------------------------------------
pause>NUL
CLS



echo. -----------------------------------------------------------------
echo.       请输入你的手表的IP
echo.       Please input the IP address of your Tic
echo.
echo.       你可以在设置→WLAN→高级里看到你的手表的IP地址       
echo.       You kan see your IP from Setting→WLAN→Advanced
echo. -----------------------------------------------------------------
echo.
echo.



set /p IP= 你的IP（Your IP）:
echo.
adb connect %IP%:7272 | find "connected" || goto ConnectFailed
echo.
goto install



:install
echo.       连接成功！即将开始安装...
echo.       Connect successfully！Ready to install...
echo.
adb install app-release.apk | find "Success" || goto InstallFailed
echo.
echo.       安装完成！
echo.       Install Successfully!
echo.
echo.       按任意键退出...
echo.       Press any key to exit...
pause>NUL
exit



:ConnectFailed
echo.       无法连接至%IP%:7272，请检查你的设置！
echo.       Unable to connect %IP%:7272, please check your settings!
echo.
echo.       按任意键退出...
echo.       Press any key to exit...
pause>NUL
exit



:InstallFailed
echo.       安装失败，请尝试重新安装！
echo.       Install Failed, please try again!
echo.
echo.       按任意键退出...
echo.       Press any key to exit...
pause>NUL
exit