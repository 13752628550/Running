@echo off
dir P000*.txt  /b > import.txt
for /f "delims=" %%i in (import.txt) do (type %%i >>import.xls)