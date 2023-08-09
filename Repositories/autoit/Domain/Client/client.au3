#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\au3script_v10.ico
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
#include <Security.au3>
#Region ### START Koda GUI section ### Form=H:\Design\autoit\Domain\Client\userform.kxf
$Form1 = GUICreate("Userform", 382, 210, 422, 391)
$GroupBox1 = GUICtrlCreateGroup("机器名: " & @ComputerName, 8, 9, 265, 193)
$Label1 = GUICtrlCreateLabel("提示：程序执行后将重启计算机", 48, 136, 172, 17)
GUICtrlSetColor(-1, 0xFF0000)
$Label2 = GUICtrlCreateLabel("设置前将打开文件关闭", 80, 160, 126, 17)
GUICtrlSetColor(-1, 0xFF0000)
$Label3 = GUICtrlCreateLabel("执行：", 26, 32, 39, 22)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Label4 = GUICtrlCreateLabel("状态：", 26, 63, 39, 22)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Label5 = GUICtrlCreateLabel("", 78, 35, 178, 22)
$Label6 = GUICtrlCreateLabel("", 78, 67, 178, 22)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button1 = GUICtrlCreateButton("设置", 285, 16, 75, 25)
$Button2 = GUICtrlCreateButton("退出", 285, 48, 75, 25)
$Label7 = GUICtrlCreateLabel("", 288, 144, 4, 4)
$Label8 = GUICtrlCreateLabel("", 288, 168, 4, 4)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$LogonDNSDomain=@LogonDNSDomain
$inifile="\\172.26.32.251\softwa\pcsetup\domain\inifile\domain.ini"
$ComputerName=@ComputerName
$NewComputerName="A"& $ComputerName
$TempDir="\\172.26.32.251\softwa\pcsetup\domain\SAVEFILE"
$SaveFile=$Tempdir & "\" & $ComputerName & ".txt"
$NewDomain="CTE.AD.LOCAL"
$UserName=@UserName
$IpAddress=@IPAddress1
$DomainCommand1= "djoin /provision /domain " & $NewDomain & " /machine " & $NewComputerName & " /machineou ou=Clients,dc=CTE,dc=AD,dc=local /savefile " & $SaveFile & ">> \\172.26.32.251\softwa\pcsetup\domain\return" & "\" & $ComputerName & "_provision.txt"
$DomainCommand2= "djoin /requestODJ /loadfile " & $SaveFile & " /windowspath %SystemRoot% /localos >> \\172.26.32.251\softwa\pcsetup\domain\return" & "\" & $ComputerName & "_requestodj.txt"

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			GUICtrlSetData($Label5,"系统初始化...")
			GUICtrlSetData($label6,"已完成 1/3 ")
			Envionment()
			sleep(3000)
			GUICtrlSetData($Label5,"计算机设置中...")
			GUICtrlSetData($label6,"已完成 2/3 ")
			DomainJoi()
			sleep(3000)
			GUICtrlSetData($Label5,"设置完成机器将在60秒后再启动！")
			GUICtrlSetData($label6,"已完成 3/3 ")
			sleep(3000)
			guisetstate(@SW_HIDE)
			ResetPC()
		Case $Button2
			Exit
	EndSwitch
WEnd

;用户电脑状态
Func Envionment()
	;*****************   CTE.AD.LOCAL 网络链接测试,不能访问地址将推出   ********************
	TCPStartup()
	$sIPAddress = TCPNameToIP("CTE.AD.LOCAL")
	If @error Then
		msgbox ("","","错误1-1： 网络访问问题，请联系企画课！" )
		Exit
	Else
		TCPShutdown()
	EndIf

	;****************** 如果已经加入CTE.AD.LOCAL则推出程序执行   ******************
	$vComplete1=IniRead($inifile,$ComputerName,"Complete","")
	$vComplete2=IniRead($inifile,StringMid($ComputerName,2,StringLen($ComputerName)-1),"Complete","")

	if $vComplete1="2" or $vComplete2="2" Then
		msgbox ("","","错误1-2： 计算机已加入新域，无需执行程序！")
		Exit
	EndIf

	if $vComplete1="3" or $vComplete2="3" Then
		msgbox ("","","错误1-2： 计算机已加入新域，无需执行程序！")
		Exit
	EndIf

	If @OSArch="X86" Then
		$joinDomain= RegRead("HKLM\SYSTEM\ControlSet001\services\Tcpip\Parameters","Domain")
	Else
		$joinDomain= regread("HKLM64\SYSTEM\ControlSet001\services\Tcpip\Parameters","Domain")
	EndIf

	If $LogonDNSDomain="EXAS.AD.LOCAL" and $joinDomain <> "CTE.AD.LOCAL" then

	Else
		msgbox ("","","错误1-2： 此计算机已经设置完成，或者不在公司网络！")
		Exit
	EndIf

	;****************** 管理账户判断,不在管理组推出   *********************
	Local $aArrayOfData = _Security__LookupAccountSid("S-1-5-32-544")
	; 如果没有发生错误则显示返回的数据
	If IsArray($aArrayOfData) Then
		$AdminGroup=$aArrayOfData[0]
		$CommandSearch="net localgroup " & $AdminGroup & " | find /i ""GCTEADM"" > " & @TempDir & "\right.txt"
		RunWait(@ComSpec & " /c " & $CommandSearch,"",@SW_HIDE)
		if FileGetSize(@TempDir & "\right.txt")>10 Then
		Else
			msgbox ("","","错误1-3：权限设置问题，请联系企画课！")
			Exit
		EndIf
EndIf

	;*****************   系统版本判断,win2000 winxp 不执行脚本操作   ********************
	If @OSVersion= "WIN_XP" Then
		MsgBox ("","","错误1-4： 操作系统不支持")
		Exit
	EndIf
	If @OSVersion="WIN_2000" Then
		MsgBox("","","错误1-5： 操作系统不支持")
		Exit
	EndIf
EndFunc


;将计算机加入域控
Func DomainJoi()
IniWrite($inifile,$ComputerName,"Complete","0")
IniWrite($inifile,$ComputerName,"User",$UserName) ;$
IniWrite($inifile,$ComputerName,"ComputerNew",$NewComputerName)
IniWrite($inifile,$ComputerName,"Date",@YEAR&"."&@MON&"."&@MDAY&" " &@HOUR&":"&@MIN&":"&@SEC )
IniWrite($inifile,$ComputerName,"System",@OSVersion)
IniWrite($inifile,$ComputerName,"LogonDNSDomain",$LogonDNSDomain)
IniWrite($inifile,$ComputerName,"JoinDomain",$NewDomain)
IniWrite($inifile,$ComputerName,"Migrate","")
IniWrite($inifile,$ComputerName,"IPAddr",@IPAddress1)


RunAsWait("administrator","cte.ad.local","Mitsumi@11", $RUN_LOGON_PROFILE,@ComSpec & " /c " & $DomainCommand1,"",@SW_HIDE)
;判断计算机生成状态 \\172.26.32.251\softwa\pcsetup\domain\savefile\计算机名称.txt
if FileExists($SaveFile) Then
	IniWrite($inifile,$ComputerName,"Date",@YEAR&"."&@MON&"."&@MDAY&" " &@HOUR&":"&@MIN&":"&@SEC )
	IniWrite($inifile,$ComputerName,"Complete","1")

Else
	RunAsWait("kcte01","exas.ad.local","kcte01.1", $RUN_LOGON_PROFILE,@ComSpec & " /c " & $DomainCommand1,"",@SW_HIDE)
	if FileExists($SaveFile) Then
		IniWrite($inifile,$ComputerName,"Date",@YEAR&"."&@MON&"."&@MDAY&" " &@HOUR&":"&@MIN&":"&@SEC )
		IniWrite($inifile,$ComputerName,"Complete","1")
	Else
		msgbox("","","错误2-1:  计算机添加失败，请联系企画课！")
		Exit
	EndIf
EndIf
;电脑添加新域控
RunAsWait("administrator","cte.ad.local","Mitsumi@11", $RUN_LOGON_PROFILE,@ComSpec & " /c " & $DomainCommand2,"",@SW_HIDE )
If @OSArch="X86" Then
		$joinDomain= RegRead("HKLM\SYSTEM\ControlSet001\services\Tcpip\Parameters","Domain")
	Else
		$joinDomain= regread("HKLM64\SYSTEM\ControlSet001\services\Tcpip\Parameters","Domain")
	EndIf
If $joinDomain="CTE.AD.LOCAL" Then
	msgbox ("","","设置完成系统将再启动")
	IniWrite($inifile,$ComputerName,"Date",@YEAR&"."&@MON&"."&@MDAY&" " &@HOUR&":"&@MIN&":"&@SEC )
	IniWrite($inifile,$ComputerName,"Complete","2")
Else
	RunAsWait("kcte01","exas.ad.local","kcte01.1", $RUN_LOGON_PROFILE,@ComSpec & " /c " & $DomainCommand2,"",@SW_HIDE )
	If @OSArch="X86" Then
		$joinDomain= RegRead("HKLM\SYSTEM\ControlSet001\services\Tcpip\Parameters","Domain")
	Else
		$joinDomain= regread("HKLM64\SYSTEM\ControlSet001\services\Tcpip\Parameters","Domain")
	EndIf
	If $joinDomain="CTE.AD.LOCAL" Then
		msgbox ("","","设置完成系统将再启动")
		IniWrite($inifile,$ComputerName,"Date",@YEAR&"."&@MON&"."&@MDAY&" " &@HOUR&":"&@MIN&":"&@SEC )
		IniWrite($inifile,$ComputerName,"Complete","2")
	Else
		msgbox ("","","错误2-2： 计算机设置不成功，请联系企画课！")
		Exit
	EndIf
EndIf
EndFunc

;启动用户电脑
Func ResetPC()
	$Proform=GUICreate("60 秒重启计算机", 233, 100, 333, 333,"",$WS_EX_TOPMOST)
	Local $idProgressbar2 = GUICtrlCreateProgress(23, 33, 178, 31)
	GUICtrlSetData($idProgressbar2, 100)
	sleep(3000)
    GUISetState(@SW_SHOW)
	Local $iWait = 1000; 为下一个进度等待 1000 毫秒
    Local $iSavPos = 100; 保存进度位置
	Local $idMsg, $idM
	$idMsg = GUIGetMsg()
	For $i = 1 To 61
		GUICtrlSetData($idProgressbar2, $iSavPos)
		$iSavPos=$iSavPos-1.66
		WinSetTitle($Proform,"",60-$i+1&" 秒重启计算机")
		Sleep($iWait)
	Next
	RunAsWait("kcte01","exas.ad.local","kcte01.1", $RUN_LOGON_PROFILE,@ComSpec & " /c " & "shutdown -r -f -t 0","",@SW_HIDE )
	Shutdown(6)

























EndFunc




























