@echo off

reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set ARCH=x86 || set ARCH=x64

set NODE_PATH="%~dp0\bin\node\node-win32-%ARCH%.exe"

@IF NOT EXIST %NODE_PATH% (
	set NODE_PATH="node.exe"
)

%NODE_PATH% "%~dp0\..\lib\resin.js" %*