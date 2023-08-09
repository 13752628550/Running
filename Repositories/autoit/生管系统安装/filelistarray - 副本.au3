#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\au3script_v10.ico
#AutoIt3Wrapper_Outfile=GPCSCTE.exe
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#include <Array.au3>
#include <File.au3>
#include <MsgBoxConstants.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <WindowsConstants.au3>
#include <GuiListView.au3>
#Region ### START Koda GUI section ### Form=h:\design\autoit\生管系统安装\form3.kxf
$Form3 = GUICreate("Form1", 362, 255, 784, 413)
$Button1 = GUICtrlCreateButton("Setup", 264, 16, 73, 25)
$Button2 = GUICtrlCreateButton("Refresh", 264, 56, 73, 33)
$ListView1 = GUICtrlCreateListView("", 8, 8, 233, 169)
_GUICtrlListView_AddColumn($ListView1,"FileName",350)
$Button3 = GUICtrlCreateButton("LoadFile", 264, 104, 73, 33)
$Label1 = GUICtrlCreateLabel("WorkStationID", 16,188 , 55, 17)
$Input1 = GUICtrlCreateInput("", 56, 188, 81, 23)
$Label2 = GUICtrlCreateLabel("UserName", 168, 188, 58, 25)
$Input2 = GUICtrlCreateInput("", 232, 188, 89,23 )
$Label3 = GUICtrlCreateLabel("ChineseName",16,228,58,25)
$Input3 = GUICtrlCreateInput("",78,228,78,25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$FilesSearch="*.ws"
$FileName=""
$logsfile="\\172.26.32.251\softwa\pcsetup\domain\inifile\gpcslog.txt"
$HostCodePage=""
$sFind1="TOKYOSC2"
$sReplace1="A11TM.EXAS.AD.LOCAL"
$sfind2="172.16.4.222"
$sReplace2="A11TM.EXAS.AD.LOCAL"
Local $aFileListArray[1][1]
refresh()
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			newsetup()
		Case $Button2
			refresh()
		Case $Button3
			fileload()
	EndSwitch
WEnd


Func refresh()
    ; 使用默认参数返回 desktop(桌面) 目录所有文件和文件夹清单.
	_GUICtrlListView_DeleteAllItems($ListView1)
	$FileName=""
    Local $aFileList = _FileListToArray(@DesktopDir, $FilesSearch,"")
    If @error = 1 Then
        MsgBox($MB_SYSTEMMODAL, "提示", "路径无效.")
        Exit
    EndIf
    If @error = 4 Then
        MsgBox($MB_SYSTEMMODAL, "提示", "未发现文件.")
        Exit
    EndIf
    ; 显示 _FileListToArray() 的返回结果.
    ;_ArrayDisplay($aFileList, "文件清单展示")
	for $i=1 to ubound($aFileList)-1
		ReDim $aFileListArray[$i][1]
		;msgbox($MB_SYSTEMMODAL,"",$i)
		$aFileListArray[$i-1][0]=$aFileList[$i]

	Next
	;_ArrayDisplay($aFileListArray,"复制文件清单")
	_GUICtrlListView_AddArray($ListView1,$aFileListArray)


EndFunc   ;==>Example

Func newsetup()
	$FileName=""
	$GetNum=_GUICtrlListView_GetSelectionMark($ListView1)
	If $GetNum= -1 then
		msgbox ($MB_SYSTEMMODAL,"提示","选择文件名进行设置")
		$FileName=""
		Return
	Else
		$GetValue=$aFileListArray[$GetNum][0]
		$FileName=$GetValue
	EndIf

	$InputValue1=GUICtrlRead($Input1)
	$InputValue2=GUICtrlRead($Input2)
	$InputValue3=GUICtrlRead($Input3)
	if $InputValue1="" Or $InputValue2 = "" Or $InputValue3="" Then
		$FileName=""
		msgbox($MB_SYSTEMMODAL,"信息","请将信息填写完整！")
		Return
	EndIf
	$iRetval1= _ReplaceStringInFile(@DesktopDir & "\" & $FileName, $sFind1, $sReplace1)
	$iRetval2= _ReplaceStringInFile(@DesktopDir & "\" & $FileName, $sFind2, $sReplace2)
    if $iRetval1= -1  And $iRetval2= -1 Then
		$FileName=""
		MsgBox($MB_SYSTEMMODAL,"信息","不能修改文件！错误代码为" & @error)
		Return
	Else
		MsgBox($MB_SYSTEMMODAL,"信息","文件修改成功！")
		GUICtrlSetData($Input1,"")

		$Version=IniRead(@DesktopDir & "\" & $FileName,"Profile","Version","")
		$logValue="," & @ComputerName &  "," & @UserName & "," & @LogonDNSDomain & "," & $InputValue1 & "," & $InputValue2 & "," & $InputValue3 & "," & $HostCodePage & "," & $Version

		$iRetvalue3=_FileWriteLog($logsfile,$logValue)
		if $iRetvalue3 <> 1 Then
			MsgBox($MB_SYSTEMMODAL,"信息","写入日志文件不正确！ 代码为：" & @error)
			Return
		EndIf




	EndIf
	$FileName=""

	;msgbox ($MB_SYSTEMMODAL,"FileName",$InputValue1 & $InputValue2)









EndFunc





Func fileload()
$FileName=""
	$GetNum=_GUICtrlListView_GetSelectionMark($ListView1)
	If $GetNum= -1 then
		msgbox ($MB_SYSTEMMODAL,"提示","选择文件名进行设置")
		$FileName=""
		Return
	Else
		$GetValue=$aFileListArray[$GetNum][0]
		$FileName=$GetValue
	EndIf

	$sReturn=IniRead(@DesktopDir & "\" & $FileName,"Communication","session","")
	$sReturn1=IniRead(@DesktopDir & "\" & $FileName,$sReturn,"WorkStationID","")
	$HostCodePage=IniRead(@DesktopDir & "\" & $FileName,$sReturn,"HostCodePage","")
	GUICtrlSetData($Input1,$sReturn1)
	;MsgBox($MB_SYSTEMMODAL,"信息",$sReturn1)


















EndFunc