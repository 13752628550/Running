#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\au3script_v10.ico
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <Array.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Excel.au3>
#include <MsgBoxConstants.au3>

$inifile8="\\172.26.32.251\softwa\pcsetup\inifile\logfile.ini"
$inifile9=@tempdir & "\logfile.ini"
$Module="\\172.26.32.251\softwa\pcsetup\inifile\computer.xlsx"
$EXCELLocal=@tempdir & "\computer.xlsx"
$UserCount=0
$userStr=""
FileCopy($inifile8,$inifile9,1)
FileCopy($Module,$EXCELLocal,1)
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox(16, "Excel UDF: _Excel_BookOpen 示例", "创建 Excel 应用对象发生错误." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $iniArray = IniReadSectionNames($inifile9)
Local $oWorkbook = _Excel_BookOpen($oExcel, $EXCELLocal)





































; 检查是否发生错误.
    If Not @error Then
        For $i = 1 To $iniArray[0]
			_Excel_RangeWrite($oWorkbook, "computer", $i, "A" & $i+2)
			_Excel_RangeWrite($oWorkbook, "computer", $iniArray[$i], "B" & $i+2)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile9,$iniarray[$i],"Username",""), "C" & $i+2)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile9,$iniarray[$i],"Update",""), "D" & $i+2)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile9,$iniarray[$i],"count",""), "E" & $i+2)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile9,$iniarray[$i],"software",""), "F" & $i+2)
		Next
    EndIf




























































