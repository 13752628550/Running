#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=h:\design\autoit\计算机信息\新建文件夹\install.kxf
$Form2 = GUICreate("Mcafee软件安装器", 321, 226, 744, 361)
$GroupBox1 = GUICtrlCreateGroup("", 8, 9, 297, 161)
$Label1 = GUICtrlCreateLabel("计算机通过测试！", 96, 32, 100, 17)
$Label2 = GUICtrlCreateLabel("Agent版本", 32, 64, 56, 17)
$Label3 = GUICtrlCreateLabel("APP版本", 32, 88, 49, 17)
$Label4 = GUICtrlCreateLabel("DAT版本", 32, 112, 50, 17)
$Label5 = GUICtrlCreateLabel("域控器", 32, 136, 40, 17)
$Label6 = GUICtrlCreateLabel("Label6", 104, 64, 36, 17)
$Label7 = GUICtrlCreateLabel("Label7", 104, 88, 36, 17)
$Label8 = GUICtrlCreateLabel("Label8", 104, 112, 36, 17)
$Label9 = GUICtrlCreateLabel("Label9", 104, 136, 36, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button1 = GUICtrlCreateButton("&安装", 30, 187, 75, 25)
GUICtrlSetState(-1, $GUI_DISABLE)
$Button2 = GUICtrlCreateButton("&刷新", 133, 188, 75, 25)
GUICtrlSetState(-1, $GUI_DISABLE)
$Button3 = GUICtrlCreateButton("&退出", 229, 188, 75, 25)
GUISetState(@SW_SHOW)

#EndRegion ### END Koda GUI section ###

$Domain=@LogonDomain
$admUserName="ADMINISTRATOR"
$admPassWord="Mitsumi@11"
$comString1=""
$comString2=""
$comString3=""

Func RefreshProgram()
	$Domain=@LogonDomain
	$admUserName="ADMINISTRATOR"
	$admPassWord="Mitsumi@11"
	$agtVersion=""
	$mcfVersion=""
	$datVersion=""
	$chkStatus=0
	If $Domain<>"CTE" then
		;label1、button
		Exit
	Else
		If $agtVersion < "" Then
			$chkStatus=$chkStatus + 1
			$comString1=""
		EndIf

		If $mcfVersion < "" Then
			$chkStatus=$chkStatus + 1
			$comString2=""
		EndIf

		If $datVersion < "" Then
			$chkStatus=$chkStatus + 1
			$comString3=""
		EndIf
	EndIf

	If $chkStatus <> 0 Then
		;label1、button
	Else
		;label1、button
	EndIf
EndFunc

Func RunasString($CommandStringNumber)
	RunAsWait($admUserName,$Domain,$admPassWord,0,@ComSpec & ' /c "' & $CommandStringNumber & '" ',"",@SW_HIDE)

EndFunc

RefreshProgram()
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			If $comString1 <> "" Then
				RunasString($comString1)
			EndIf
			If $comString2 <> "" Then
				RunasString($comString2)
			EndIf
			If $comString3 <> "" Then
				RunasString($comString3)
			EndIf
			RefreshProgram()
	EndSwitch
WEnd











