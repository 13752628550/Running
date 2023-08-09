#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GuiListView.au3>
#include <GuiListBox.au3>
#include <GuiComboBox.au3>
#include <Excel.au3>
#include <Array.au3>
#include <Date.au3>
#include <WinAPISys.au3>

$Module="\\172.26.32.251\softwa\pcsetup\module\computer.xlsx"
$TempExl=@tempdir & "\" & "computer.xlsx"
;$IniFile="\\172.26.32.251\softwa\pcsetup\inifile\computer.ini"
$Inifile="\\172.26.32.251\softwa\pcsetup\domain\inifile\PCAsset.ini"
$userstr=""
$usercount=0
filecopy($module,$TempExl,1)
Local $oExcel = _Excel_Open()
If @error Then Exit MsgBox(16, "Excel UDF: _Excel_BookOpen 示例", "创建 Excel 应用对象发生错误." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
Local $iniArray = IniReadSectionNames($IniFile)
Local $oWorkbook = _Excel_BookOpen($oExcel, $TempExl)















; 检查是否发生错误.
    If Not @error Then
        ; 枚举数组显示的字段名.
		_Excel_RangeWrite($oWorkbook, "computer", $iniArray[0], "C" & 1)
		_Excel_RangeWrite($oWorkbook, "computer", @YEAR & @MON & @MDAY, "C" & 3)
        For $i = 1 To $iniArray[0]
			_Excel_RangeWrite($oWorkbook, "computer", $i, "B" & $i+6)
			;msgbox(0,"",$iniarray[$i])
			_Excel_RangeWrite($oWorkbook, "computer", $iniarray[$i], "C" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile,$iniarray[$i],"Username",""), "D" & $i+6)
			if stringinstr($userstr,IniRead($IniFile,$iniarray[$i],"Username",""))=0 Then
				$userstr=$userstr & " " & IniRead($IniFile,$iniarray[$i],"Username","")
				$usercount=$usercount+1
			EndIf
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile,$iniarray[$i],"chkdate",""), "E" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile,$iniarray[$i],"system",""), "F" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile,$iniarray[$i],"osarchitecture",""), "G" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile,$iniarray[$i],"osservicepack",""), "H" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile,$iniarray[$i],"vendor",""), "I" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile,$iniarray[$i],"model",""), "J" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile,$iniarray[$i],"description",""), "K" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile,$iniarray[$i],"board",""), "L" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile,$iniarray[$i],"serialnumber",""), "M" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile,$iniarray[$i],"bios",""), "N" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile,$iniarray[$i],"cpu",""), "O" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile,$iniarray[$i],"mem",""), "P" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile,$iniarray[$i],"disksize",""), "Q" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile,$iniarray[$i],"display",""), "R" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile,$iniarray[$i],"sound",""), "S" & $i+6)
			_Excel_RangeWrite($oWorkbook, "computer", IniRead($IniFile,$iniarray[$i],"ipaddress",""), "T" & $i+6)
        Next
		_Excel_RangeWrite($oWorkbook, "computer",$usercount, "C" & 2)
    EndIf



























