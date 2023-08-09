#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\MyAutoIt3_Green.ico
#AutoIt3Wrapper_Outfile=software.exe
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
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
#include <WinAPISys.au3>
#include <Date.au3>

#Region ### START Koda GUI section ### Form=h:\autoit\安全更新安装\安装软件统计\manform.kxf
$Form1_1 = GUICreate("software", 879, 686, 381, 167)
$ListView1 = GUICtrlCreateListView("名称|版本|安装日期", 28, 16, 817, 577,$LVS_SORTASCENDING,$LVS_EX_FULLROWSELECT+$LVS_EX_GRIDLINES)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 370)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 160)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 2, 160)
$Button1 = GUICtrlCreateButton("Uninstall", 48, 608, 97, 25)
$Button2 = GUICtrlCreateButton("Submit", 720, 608, 105, 25)
$Label1 = GUICtrlCreateLabel("Author： Sun Baolu", 383, 639, 170, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button3 = GUICtrlCreateButton("Refresh", 160, 608, 105, 25)
$Label2 = GUICtrlCreateLabel("正在更新数据，请稍等", 383, 613, 180, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$IniFile=@tempdir & "\import.ini"
Global Const $osAr = @OSArch
$RegPath321="HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
$Regpath322="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
$regpath641="HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
;1.如果注册表项下面有"SystemComponent"字段并且值等于1时，表示这是个系统组件，而不是应用软件。
;2.如果注册表项下面有"ParentKeyName"字段则表示该项是系统更新。

_GUICtrlListView_DeleteAllItems($ListView1)
if $osar=="X86" Then
	filedelete($IniFile)
	_import($RegPath321)
	_import($Regpath322)
Else
	filedelete($IniFile)
	_import($RegPath321)
	_import($Regpath322)
	_import($regpath641)
endif


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			_delete()
		Case $Button2
			_output()
		case $Button3
			_GUICtrlListView_DeleteAllItems($ListView1)
			if $osar=="X86" Then
				filedelete($IniFile)
				_import($RegPath321)
				_import($Regpath322)
			Else
				filedelete($IniFile)
				_import($RegPath321)
				_import($Regpath322)
				_import($regpath641)
			endif


	EndSwitch
WEnd







Func _import($regpath)
	$DisplayName=""
	$DisplayVersion=""
	$InstallDate=""
	$UninstallString=""
	$InstallLocation=""
	$i=1
	$Label2 = GUICtrlCreateLabel("正在更新数据，请稍等", 383, 613, 180, 17)
	;msgbox(0,"",$inifile)
	do
		$Var = RegEnumKey($RegPath, $i)
		if stringleft($var,3)="" then
			ExitLoop
		endif
		if regread($regpath&"\"&$var,"SystemComponent")="1" Then
			$i=$i+1
			ContinueLoop
		EndIf
		if regread($regpath&"\"&$var,"ParentKeyName")<>"" then
			;msgbox (0,"","安装补丁程序")
			$i=$i+1
			ContinueLoop
		endif
		if regread ($regpath&"\"&$var,"DisplayName")="" then
			;msgbox (0,"","显示名称为空")
			$i=$i+1
			ContinueLoop
		endif

		;msgbox (0,"",$var)
		$DisplayName=regread ($regpath&"\"&$var,"DisplayName")
		$DisplayVersion=regread ($regpath&"\"&$var,"DisplayVersion")
		$InstallDate=regread ($regpath&"\"&$var,"InstallDate")
		$UninstallString=regread ($regpath&"\"&$var,"UninstallString")
		if $UninstallString=IniRead($IniFile,$DisplayName,"UninstallString","") Then
			$i=$i+1
			;msgbox (0,"ifthelo",$DisplayName)
			ContinueLoop
			;ContinueLoop
	 	EndIf
		$InstallLocation=regread ($regpath&"\"&$var,"InstallLocation")
		GUICtrlCreateListViewItem($DisplayName&"|"&$DisplayVersion&"|"&$InstallDate, $ListView1)
		;msgbox (0,"",$DisplayName&$DisplayVersion&$InstallDate&$UninstallString&$InstallLocation)
		iniwrite($IniFile,$DisplayName,"DisplayVersion",$DisplayVersion)
		iniwrite($IniFile,$DisplayName,"InstallDate",$InstallDate)
		iniwrite($IniFile,$DisplayName,"UninstallString",$UninstallString)
		iniwrite($IniFile,$DisplayName,"InstallLocation",$InstallLocation)
		;iniwrite($IniFile,$DisplayName,"",)
		;iniwrite($IniFile,$DisplayName,"",)
		$i=$i+1
		until StringLeft($Var, 3) = ""
		;msgbox(0,"",$regpath)
		$Label2 = GUICtrlCreateLabel("当前安装软件："& _guictrllistview_getitemcount($ListView1), 383, 613, 180, 17)
EndFunc


func _delete()
	$string = StringSplit(GUICtrlRead(GUICtrlRead($ListView1),1),"|")
    ;msgbox (0,"",$adays[1])
	$UninstallString2=iniread($IniFile,$string[1],"UninstallString","")
	;msgbox(0,"",$UninstallString2)

	if StringLeft($UninstallString2,6)="msiexe" then
		RunWait(@ComSpec & " /c " & $UninstallString2)
	Else
		if stringleft($uninstallstring2,1)="""" then
			RunWait($UninstallString2)
		Else
			shellexecute($uninstallstring2)
		EndIf

		;runas("kcte12","exas.ad.local","kcte12.1",$RUN_LOGON_NOPROFILE,$UninstallString2)
		;sleep(6000)
	endif
	;GUICtrlRead(GUICtrlRead($ListView1)),1)
	;_GUICtrlListView_DeleteItemsSelected($ListView1)



EndFunc

func _output()

	$Module="\\172.26.32.251\softwa\pcsetup\module\software.xlsx"
	if @osversion="WIN_XP" then
		$ExcelName=@ComputerName & "xls"
	Else
		$ExcelName=@ComputerName & ".xlsx"
	EndIf

	$TempExl=@tempdir & "\" & $ExcelName
	_GUICtrlListView_DeleteAllItems($ListView1)
	if $osar=="X86" Then
		filedelete($IniFile)
		_import($RegPath321)
		_import($Regpath322)
	Else
		filedelete($IniFile)
		_import($RegPath321)
		_import($Regpath322)
		_import($regpath641)
	endif


	filecopy($module,$TempExl,1)
	Local $oExcel = _Excel_Open()
	If @error Then Exit MsgBox(16, "Excel UDF: _Excel_BookOpen 示例", "创建 Excel 应用对象发生错误." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	Local $oWorkbook = _Excel_BookOpen($oExcel, $TempExl)
	_Excel_RangeWrite($oWorkbook, "software", @ComputerName, "C1")
	_Excel_RangeWrite($oWorkbook, "software", @UserName, "C2")
	_Excel_RangeWrite($oWorkbook, "software", @OSVersion, "C3")
	_Excel_RangeWrite($oWorkbook, "software", @IPAddress1, "E1")
	;_Excel_RangeWrite($oWorkbook, "software", _WinAPI_GetSystemInfo (), "E2")
	Local $iniArray = IniReadSectionNames($IniFile)
	; 检查是否发生错误.
    If Not @error Then
        ; 枚举数组显示的字段名.
        For $i = 1 To $iniArray[0]
			_Excel_RangeWrite($oWorkbook, "software", $i, "B" & $i+6)
			_Excel_RangeWrite($oWorkbook, "software", $iniarray[$i], "C" & $i+6)
			_Excel_RangeWrite($oWorkbook, "software", IniRead($IniFile,$iniarray[$i],"DisplayVersion",""), "F" & $i+6)
			_Excel_RangeWrite($oWorkbook, "software", IniRead($IniFile,$iniarray[$i],"InstallDate",""), "G" & $i+6)
			_Excel_RangeWrite($oWorkbook, "software", IniRead($IniFile,$iniarray[$i],"InstallLocation",""), "H" & $i+6)
        Next
    EndIf
	_Excel_RangeWrite($oWorkbook, "software", _Now(), "E2")
	_Excel_RangeWrite($oWorkbook, "software", $i-1, "E3")
	_Excel_BookSave($oWorkbook)
	If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_BookSave 示例 1", "保存工作簿发生错误." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	_Excel_BookClose($oWorkbook,true)
	If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Close 示例 1", "关闭 Excel 应用时出错." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	filecopy($IniFile,"\\172.26.32.251\softwa\pcsetup\IniFile\" & @ComputerName & ".ini",1)
	filecopy($TempExl,"\\172.26.32.251\softwa\pcsetup\software",1)
	If @error Then Exit MsgBox($MB_SYSTEMMODAL, "Excel UDF: _Excel_Close 示例 1", "文件提交出错." & @CRLF & "@error = " & @error & ", @extended = " & @extended)
	msgbox(0,"","数据提交完成")
	FileDelete($TempExl)
EndFunc





































































































































































