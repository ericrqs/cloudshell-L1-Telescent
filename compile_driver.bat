@echo off
net session >nul 2>&1
if %errorLevel% == 0 (
    echo ok
) else (
    echo This program must be run from an administrator cmd prompt
    goto :fail
)

@echo on

pyinstaller --onefile driver.spec

taskkill /f /im Polatis.exe

sleep 3

copy dist\Polatis.exe                     "c:\Program Files (x86)\QualiSystems\CloudShell\Server\Drivers"
copy polatis_runtime_configuration.json "c:\Program Files (x86)\QualiSystems\CloudShell\Server\Drivers"

copy polatis_datamodel.xml               release\
copy dist\Polatis.exe                      release\
copy polatis_runtime_configuration.json  release\

:fail
