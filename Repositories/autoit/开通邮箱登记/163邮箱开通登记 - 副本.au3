#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\au3script_v10.ico
#AutoIt3Wrapper_UseX64=n
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ColorConstants.au3>
#include <MsgBoxConstants.au3>
#include <array.au3>
#include <file.au3>
#include <constants.au3>
#include <stringconstants.au3>

#Region ### START Koda GUI section ### Form=H:\Design\autoit\form679.kxf
$Form1 = GUICreate("163邮箱开通登记", 350, 257, 820, 394)
$Group1 = GUICtrlCreateGroup("请输入下面信息", 26, 16, 297, 177)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Label6 = GUICtrlCreateLabel("部门：", 56, 56, 40, 17)
$Label7 = GUICtrlCreateLabel("姓名：", 56, 88, 40, 17)
$Label8 = GUICtrlCreateLabel("邮箱：", 56, 120, 40, 17)
$idCombo = GUICtrlCreateCombo("", 104, 48, 177, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Automotive PM Dept|R&D Dept|SD dept|PE Dept|MD dept|AD Dept|QA Dept|PMD Dept")
$InputName = GUICtrlCreateInput("", 104, 80, 177, 21)
$InputMail = GUICtrlCreateInput("", 104, 112, 177, 21)
$Label9 = GUICtrlCreateLabel("目的：", 56, 152, 40, 17)
$InputOrhfg = GUICtrlCreateInput("", 104, 144, 177, 21)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$SubmitButton = GUICtrlCreateButton("提交", 224, 208, 81, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$logPath="N:\管理部\企画課\163邮箱登记"
$logsName="Mailbox.txt"

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $SubmitButton
			Submit()

	EndSwitch
WEnd

Func Submit()
	$inputComboValue = GUICtrlRead($idCombo)
	$inputNameValue = GUICtrlRead($InputName)
	$InputMailValue = GUICtrlRead($InputMail)
	$InputOrhfgValue = GUICtrlRead($InputOrhfg)
	Select
		Case $inputComboValue = ""
			GUICtrlSetState($idCombo,256)
			MsgBox ($MB_ICONINFORMATION + $MB_OK,"提示框","请把字段信息输完整")
			Return
		Case $inputNameValue = ""
			GUICtrlSetState($InputName,256)
			MsgBox ($MB_ICONINFORMATION + $MB_OK,"提示框","请把字段信息输完整")
			Return
		Case $InputMailValue = ""
			GUICtrlSetState($InputMail,256)
			MsgBox ($MB_ICONINFORMATION + $MB_OK,"提示框","请把字段信息输完整")
			Return
		Case $InputOrhfgValue = ""
			GUICtrlSetState($InputOrhfg,256)
			MsgBox ($MB_ICONINFORMATION + $MB_OK,"提示框","请把字段信息输完整")
			Return
		Case StringRight($InputMailValue,7) <> "163.com"
			GUICtrlSetState($InputMail,256)
			MsgBox ($MB_ICONINFORMATION + $MB_OK,"提示框","输入邮件地址不正确")
			Return
	EndSelect

	$addStrProgram = @YEAR & @MON & @MDAY & "," & $inputComboValue & "," & @UserName & "," & $inputNameValue & "," & $InputMailValue & "," & $InputOrhfgValue


	Local $hFileOpen = FileOpen($logPath & "\" & $logsName ,  $FO_APPEND  +   $FO_UTF8_NOBOM )
	$iCheck = FileWriteLine($hFileOpen,$addStrProgram)
	;MsgBox(0,"提示框",$iCheck)
	FileClose($hFileOpen)

	If $iCheck = 1 Then
		MsgBox ($MB_ICONINFORMATION + $MB_OK,"提示框","文件提交成功")
		GUICtrlSetData($InputMail,"")
		GUICtrlSetState($InputMail,256)
		GUICtrlSetData($InputOrhfg,"")
	Else
		MsgBox($MB_ICONINFORMATION + $MB_OK,"提示框","文件提交不成功，请重新提交")
		Return
	EndIf

EndFunc
























































































































































































































































































































































































































































































