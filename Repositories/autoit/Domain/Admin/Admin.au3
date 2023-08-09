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

$inifile8="\\172.26.32.251\softwa\pcsetup\domain\inifile\domain.ini"
$inifile9=@tempdir & "\domain.ini"
$Module="\\172.26.32.251\softwa\pcsetup\domain\module\computer.xlsx"
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
        ; 枚举数组显示的字段名.
		_Excel_RangeWrite($oWorkbook, "computer", $iniArray[0], "C" & 1)
		_Excel_RangeWrite($oWorkbook, "computer", @YEAR & @MON & @MDAY, "C" & 3)
        For $i = 1 To $iniArray[0]
			_Excel_RangeWrite($oWorkbook, "computer", $i, "B" & $i+6)
			;msgbox(0,"",$iniarray[$i])
			_Excel_RangeWrite($oWorkbook, "computer", $iniarray[$i], "C" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile9,$iniarray[$i],"User",""), "D" & $i+6)
			if stringinstr($userstr,IniRead($IniFile9,$iniarray[$i],"User",""))=0 Then
				$userstr=$userstr & " " & IniRead($inifile9,$iniarray[$i],"User","")
				$usercount=$usercount+1
			EndIf
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile9,$iniarray[$i],"ComputerNew",""), "E" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile9,$iniarray[$i],"Date",""), "H" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile9,$iniarray[$i],"System",""), "I" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile9,$iniarray[$i],"Complete",""), "J" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile9,$iniarray[$i],"LogonDNSDomain",""), "K" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile9,$iniarray[$i],"JoinDomain",""), "L" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile9,$iniarray[$i],"Migrate",""), "M" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile9,$iniarray[$i],"IPAddr",""), "N" & $i+6)


		Next
		_Excel_RangeWrite($oWorkbook, "computer",$usercount, "C" & 2)
    EndIf




























































