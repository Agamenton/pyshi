@ECHO OFF

set "pathToMain=%~dp0"
set "nameOfMain=main"
set "exeName=KenPy"
set "iconPath=%pathToMain%icon.ico"

call :deleteTempFiles

if exist "%pathToMain%%nameOfMain%.exe" (
    del "%pathToMain%%nameOfMain%.exe"
)

pyinstaller.exe ^
    --onefile ^
    --noconsole ^
    --noupx ^
    --clean ^
    --name "%exeName%" ^
    --icon "%iconPath%" ^
    --add-data "%iconPath%;." ^
    "%pathToMain%%nameOfMain%.py"
copy "%pathToMain%dist\%exeName%.exe" "%pathToMain%"

call :deleteTempFiles

echo. & pause & goto:eof


:deleteTempFiles
if exist %pathToMain%__pycache__\ (
    rmdir /S /Q "%pathToMain%__pycache__"
)
if exist %pathToMain%build\ (
    rmdir /S /Q "%pathToMain%build"
)
if exist %pathToMain%dist\ (
    rmdir /S /Q "%pathToMain%dist"
)
if exist %pathToMain%%nameOfMain%.spec (
    del "%pathToMain%%nameOfMain%.spec"
)
goto:eof