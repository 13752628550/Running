@echo off
for /f "delims=" %%i in (computer.txt) do (wmic /node:%%i product get name > %%i.txt)
