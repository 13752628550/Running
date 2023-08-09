#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\au3script_v10.ico
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
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
Local $Computer = @ComputerName
Local $UserName = @UserName
Local $iniFile = "\\172.26.32.251\softwa\pcsetup\domain\inifile\printer.ini"
Local $iniFileNew = "\\172.26.32.251\softwa\pcsetup\remote\inifile\computer.ini"
Local $iniFilePas = "\\172.26.32.251\softwa\pcsetup\remote\inifile\usrconfig.ini"
Local $impFileDir = "\\172.26.32.251\softwa\pcsetup\remote\"
Local $impFileNam = $Computer
Local $impFilePas = " " & IniRead($iniFilePas,"Column","ImpFilePas","")
Local $Domain = IniRead($iniFile,"parameter","Domain","")
Local $DomainAdmin = IniRead($iniFile,"parameter","DomainAdmin","")
Local $DomainPassword = IniRead($iniFile,"parameter","DomainPassword","")
Local $oldDomain = IniRead($iniFile,"parameter","oldDomain","")
Local $oldDomainAdmin = IniRead($iniFile,"parameter","oldDomainAdmin","")
Local $oldDomainPassword = IniRead($iniFile,"parameter","oldDomainPassword","")
Local $TempDir = @TempDir
Local $OSBit = @OSArch
Local $IPAddress1 = @IPAddress1
Local $IPAddress2 = @IPAddress2
If $IPAddress2 = "0.0.0.0" then
	$IPAddress3 = $IPAddress1
Else
	$IPAddress3 = $IPAddress1 & " : " & $IPAddress2
EndIf
Local $SrvStatus = ""
Local $SrvChsStatus = ""
Local $RmoStatus = ""
Local $RmoChsStatus = ""
Local $CommandString1="REG ADD " & '"' & "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" & '"' & " /v fAllowToGetHelp /t REG_DWORD /d 1 /f"
Local $CommandString2="netsh advfirewall firewall set rule group=" & '"' & "Remote Assistance"& '"' & " new enable=Yes"
Local $CommandString3="msra /saveasfile " & $impFileDir & $impFileNam & $impFilePas
Local $SumCount = 1
$Form1 = GUICreate("UserInfo", 369, 280, 716, 304)
$GroupBox1 = GUICtrlCreateGroup("", 8, 11, 345, 203)
$Label1 = GUICtrlCreateLabel("计算机", 25, 43, 40, 17)
$Input1 = GUICtrlCreateInput($Computer, 97, 39, 153, 21)
GUICtrlSetState(-1, $GUI_DISABLE)
$Label2 = GUICtrlCreateLabel("IP地址", 26, 74, 38, 17)
$Input2 = GUICtrlCreateInput($IPAddress3, 97, 72, 153, 21)
GUICtrlSetState(-1, $GUI_DISABLE)
$Label3 = GUICtrlCreateLabel("服务状态", 26, 106, 52, 17)
$Input3 = GUICtrlCreateInput($SrvChsStatus, 97, 104, 153, 21)
GUICtrlSetState(-1,$GUI_DISABLE)
$Label4 = GUICtrlCreateLabel("远程状态", 26, 137, 52, 17)
$Input4 = GUICtrlCreateInput($RmoChsStatus, 96, 138, 153, 21)
GUICtrlSetState(-1,$GUI_DISABLE)
$Label5 = GUICtrlCreateLabel("用户名", 26, 169, 40, 17)
$Input5 = GUICtrlCreateInput($UserName, 97, 168, 153, 21)
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlSetState(-1, $GUI_DISABLE)
$Button1 = GUICtrlCreateButton("远程协助",  8, 225, 75, 25)
$Button2 = GUICtrlCreateButton("UltraVnc", 93, 225, 75, 25)
$Label6 = GUICtrlCreateLabel("技术支持：企画课", 187, 232, 169, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
SrvCheck()
RmoCheck()
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			;MsgBox("mainform","mainform",$CommandString3)
			StartButton()
		Case $Button2
			Exit
	EndSwitch
WEnd
























































#cs
1.REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowToGetHelp /t REG_DWORD /d 1 /f
2.netsh advfirewall firewall set rule group="Remote Assistance" new enable=Yes
3.msra /saveasfile c:\test\1.msrcIncident 123456789012
4.%SystemDrive%\Users\user_name\Documents\Remote Assistance Logs
5.HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance
6.
7.
8.

*.程序设置初始过程
	-  用户名密码
	-  配置文件地址
	-  测试系统环境 计算机名用户名服务开启状态防火墙ip123
	-  开启远程协助  开启系统选项
      系统防火墙
      生成远程配置
	- 刷新系统状态

#ce










































































Func RunasString($CommandStringWindows)
	$sDomain = @LogonDomain
		Switch $sDomain
			Case $oldDomain
				;MsgBox("3","1",$CommandStringWindows)
				RunAsWait($oldDomainAdmin,$oldDomain,$oldDomainPassword,0,@ComSpec & ' /c "' & $CommandStringWindows & '" ',"",@SW_HIDE)
			Case $Domain
				;MsgBox("3","2",$CommandStringWindows)
				RunAsWait($DomainAdmin,$Domain,$DomainPassword,0,@ComSpec & ' /c "' & $CommandStringWindows & '" ',"",@SW_HIDE)
			Case Else
				;MsgBox("3","3",$CommandStringWindows)
				RunWait(@ComSpec & " /c " & '"' &  $CommandStringWindows & '" ',"",@SW_HIDE)
		EndSwitch

EndFunc


Func _ServGetState($iName )
    $Service = ObjGet("winmgmts:\\.\root\cimv2")
    $sItems = $Service.ExecQuery("Select * from Win32_Service")
    For $objItem in $sItems
        If $objItem.Name = $iName Then
			;MsgBox("","",$objItem.State)
			Return $objItem.State
		EndIf
    Next
    Return SetError(-1)
EndFunc   ;<==> _ServGetState()

Func SrvCheck()
	$SrvStatus = _ServGetState("termservice")
	;MsgBox("","",$SrvStatus)
	if $SrvStatus="running" Then
		$SrvChsStatus="开启"
		GUICtrlSetData($Input3,$SrvChsStatus)
	Else
		$SrvChsStatus="未开启"
		GUICtrlSetData($Input3,$SrvChsStatus)
	EndIf
	GUICtrlSetState($Input3,@SW_SHOW)
EndFunc

Func RmoCheck()
	$RmoStatus = RegRead("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance","fAllowToGetHelp")
	;MsgBox("mainform","mainform",$RmoStatus)
	If $RmoStatus = "1" Then
		$RmoChsStatus = "开启"
		GUICtrlSetData($Input4,$RmoChsStatus)
	Else
		$RmoChsStatus = "未开启"
		GUICtrlSetData($Input4,$RmoChsStatus)
	EndIf
	GUICtrlSetState($Input4,@SW_SHOW)
EndFunc

Func SrvChange()
	If $SrvStatus <> "running" Then
		RunasString("sc start termservice")
	EndIf
	SrvCheck()
EndFunc

Func RmoChange()
	$RmoStatus = RegRead("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance","fAllowToGetHelp")
	If $RmoStatus <> "1" Then
		RunasString($CommandString1)
	EndIf
	RmoCheck()
EndFunc

Func StartButton()
		If ProcessExists("msra.exe") <> "0" Then
			MsgBox ("mainform","mainform","程序在执行,关闭远程协助，然后执行程序")
			Return
		EndIf
		GUICtrlSetState($Button1,$GUI_DISABLE)
		GUICtrlSetData($Label6,"正在开启远程协助")
		GUICtrlSetColor($Label6, 0xff)
		SrvChange()
		RmoChange()
		RunasString($CommandString2)
		if FileExists($impFileDir & $impFileNam & ".msrcincident") Then
			FileDelete($impFileDir & $impFileNam & ".msrcincident")
		EndIf
		Run(@ComSpec & ' /c "' & $CommandString3 & '" ',"",@SW_HIDE)
		$MsrStatus = ProcessWait("msra.exe",89)
		$SumCount = 1
		While FileExists($impFileDir & $impFileNam & ".msrcincident") = "0"
			if $SumCount>= 30 Then
				$MsrStatus="0"
				ExitLoop
			EndIf
			RunWait(@ComSpec & " /c Ping 127.0.0.1 -n 3","",@SW_HIDE)
			$SumCount = $SumCount + 1
		WEnd
		If $MsrStatus <> "0" Then
			GUICtrlSetData($Label6,"远程执行成功")
			GUICtrlSetColor($Label6, 0xff)
		Else
			GUICtrlSetData($Label6,"远程出现问题")
			GUICtrlSetColor($Label6, 0xff)
		EndIf
		;MsgBox ("mainform","mainform",$MsrStatus)
		$DayTime = @YEAR & "/" & @MON & "/" & @MDAY & " <" & @HOUR & ":" & @MIN & ":" & @SEC & ">"
		IniWrite($iniFileNew,$Computer,"UserName",$UserName)
		IniWrite($iniFileNew,$Computer,"IPAddress",$IPAddress3)
		IniWrite($iniFileNew,$Computer,"SrvStatus",$SrvStatus)
		IniWrite($iniFileNew,$Computer,"RmoStatus",$RmoStatus)
		IniWrite($iniFileNew,$Computer,"impFileNam",$impFileNam)
		IniWrite($iniFileNew,$Computer,"impfilepas",$impFilePas)
		IniWrite($iniFileNew,$Computer,"MsrStatus",$MsrStatus)
		IniWrite($iniFileNew,$Computer,"DayTime",$DayTime)
		IniWrite($iniFileNew,$Computer,"FileDir",$impFileDir & $impFileNam & ".msrcincident")
		GUICtrlSetState($Button1,$Gui_Enable)
EndFunc






