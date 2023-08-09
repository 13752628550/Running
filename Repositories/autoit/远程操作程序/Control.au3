#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\au3script_v10.ico
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <ColorConstants.au3>
#include <MsgBoxConstants.au3>
#include <array.au3>
#include <file.au3>
#include <constants.au3>
#include <GUIListView.au3>
#include <ListViewConstants.au3>
#include <WindowsConstants.au3>
$Form1_1 = GUICreate("远程协助控制台", 898, 467, 689, 289)
$Group1 = GUICtrlCreateGroup("", 21, 16, 853, 60)
$Button1 = GUICtrlCreateButton("Control", 44, 33, 84, 23)
$Button2 = GUICtrlCreateButton("Clear", 174, 33, 83, 23)
$Button3 = GUICtrlCreateButton("Refresh", 309, 33, 84, 22)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$ListView1 = GUICtrlCreateListView("日期|主机|用户|地址|服务|选项|协助|密码", 23, 89, 855, 363)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 110)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 110)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 2, 110)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 3, 110)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 4, 110)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 5, 110)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 6, 110)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 7, 110)
GUICtrlSetFont(-1, 9, 400, 0, "MS PGothic")
GUICtrlSetBkColor(-1, 0x6D6D6D)
_GUICtrlListView_JustifyColumn(GUICtrlGetHandle($ListView1), 1, 2)
_GUICtrlListView_JustifyColumn(GUICtrlGetHandle($ListView1), 2, 2)
_GUICtrlListView_JustifyColumn(GUICtrlGetHandle($ListView1), 3, 2)
_GUICtrlListView_JustifyColumn(GUICtrlGetHandle($ListView1), 4, 2)
_GUICtrlListView_JustifyColumn(GUICtrlGetHandle($ListView1), 5, 2)
_GUICtrlListView_JustifyColumn(GUICtrlGetHandle($ListView1), 6, 2)
_GUICtrlListView_JustifyColumn(GUICtrlGetHandle($ListView1), 7, 2)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Local $iniFileDir = "\\172.26.32.251\softwa\pcsetup\remote\inifile\computer.ini"
Local $aArray
Local $aDisplay[0][0]
InfSecAry()
RefListView()

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			; MsgBox("mainform","mainform",_GUICtrlListView_GetItemText($ListView1,5,1))
			;$NumberCount = _GUICtrlListView_GetSelectedIndices($ListView1,True)
			;_ArrayDisplay($NumberCount)
			; MsgBox("mainform","mainform",_GUICtrlListView_GetItemText($ListView1,$NumberCount[1],1))
			MsrComputer()
		Case $Button2
			ClrFileDir()
			InfSecAry()
			RefListView()
		Case $Button3
			InfSecAry()
			RefListView()
	EndSwitch
WEnd

Func RefListView()
	_GUICtrlListView_DeleteAllItems($ListView1)
	_GUICtrlListView_AddArray($ListView1,$aDisplay)
EndFunc

Func InfSecAry()
	$aArray = IniReadSectionNames($iniFileDir)
	ReDim $aDisplay[0][0]
	If Not @error Then
		ReDim $aDisplay[$aArray[0]][8]
		;_ArrayDisplay($aDisplay)
		For $i = 1 To $aArray[0]
			;MsgBox("mainform","mainform",IniRead($iniFileDir,$aArray[$i],"DayTime",""))
			$aDisplay[$i-1][0] = IniRead($iniFileDir,$aArray[$i],"DayTime","")
			$aDisplay[$i-1][1] = $aArray[$i]
			$aDisplay[$i-1][2] = IniRead($iniFileDir,$aArray[$i],"UserName","")
			$aDisplay[$i-1][3] = IniRead($iniFileDir,$aArray[$i],"IPAddress","")
			$aDisplay[$i-1][4] = IniRead($iniFileDir,$aArray[$i],"SrvStatus","")
			If IniRead($iniFileDir,$aArray[$i],"RmoStatus","") <> "1" Then
				$aDisplay[$i-1][5] = "Disable"
		    Else
			    $aDisplay[$i-1][5] = "Enabled"
            EndIf
			$aDisplay[$i-1][6] = IniRead($iniFileDir,$aArray[$i],"MsrStatus","")
			$aDisplay[$i-1][7] = IniRead($iniFileDir,$aArray[$i],"impfilepas","")
			;_ArrayDisplay($aDisplay)
		Next
	EndIf
EndFunc

Func MsrComputer()
	If _GUICtrlListView_GetSelectedIndices($ListView1)<>"" Then
		$AryChoNum = _GUICtrlListView_GetSelectedIndices($ListView1,True)
		$AryChoCha = _GUICtrlListView_GetItemText($ListView1,$AryChoNum[1],1)
		$FilDir = IniRead($iniFileDir,$AryChoCha,"FileDir","")
		$ImpFilPas = " " & IniRead($iniFileDir,$AryChoCha,"impfilepas","")
		$CommandString = "msra /openfile " & $FilDir
		Run(@ComSpec & ' /c "' & $CommandString & '" ',"",@SW_HIDE)
		;MsgBox("mainform","mainform",$CommandString)
	EndIf
EndFunc

Func ClrFileDir()
	FileDelete("\\172.26.32.251\softwa\pcsetup\remote\*.msrcincident")
	$ArrNumber = IniReadSectionNames($iniFileDir)
	If IsArray($ArrNumber) = 0 Then
		Return
	EndIf
	For $i = 1 to $ArrNumber[0]
		IniDelete($iniFileDir,$ArrNumber[$i])
	Next
EndFunc



























































































































































































































































































































































































































































