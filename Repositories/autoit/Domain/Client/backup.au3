
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
#Region ### START Koda GUI section ### Form=H:\Design\autoit\Domain\Client\userform.kxf
$Form1 = GUICreate("Userform", 382, 210, 422, 391)
$GroupBox1 = GUICtrlCreateGroup("机器名: " & @ComputerName, 8, 9, 265, 193)
$Label1 = GUICtrlCreateLabel("提示：程序执行后将重启计算机", 48, 136, 172, 17)
GUICtrlSetColor(-1, 0xFF0000)
$Label2 = GUICtrlCreateLabel("设置前将打开文件关闭", 80, 160, 124, 17)
GUICtrlSetColor(-1, 0xFF0000)
$Label3 = GUICtrlCreateLabel("执行：", 24, 32, 40, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Label4 = GUICtrlCreateLabel("状态：", 24, 72, 40, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Label5 = GUICtrlCreateLabel("", 80, 32, 4, 4)
$Label6 = GUICtrlCreateLabel("", 80, 72, 4, 4)
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
$TempDir="\\172.26.32.251\softwa\pcsetup\domain\SAVEFILE"
$SaveFile=$Tempdir & "\" & $ComputerName & ".txt"
$NewDomain="CTE.AD.LOCAL"
$UserName=@UserName
$IpAddress=@IPAddress1
$DomainCommand1= "djoin /provision /domain " & $NewDomain & " /machine " & $ComputerName & " /savefile " & $SaveFile & ">> \\172.26.32.251\softwa\pcsetup\domain\return" & "\" & $ComputerName & "_7.txt"
$DomainCommand2= "djoin /requestODJ /loadfile " & $SaveFile & " /windowspath %SystemRoot% /localos >> \\172.26.32.251\softwa\pcsetup\domain\return" & "\" & $ComputerName & "_8.txt"

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			Envionment()
			DomainJoi()
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
		msgbox (0+202144,"","错误1-1： 网络访问问题，请联系管理员！" )
		Exit
	Else
		TCPShutdown()
	EndIf


	;****************** 如果已经加入CTE.AD.LOCAL则推出程序执行   ******************
	If @OSArch="X86" Then
		$joinDomain= RegRead("HKLM\SYSTEM\ControlSet001\services\Tcpip\Parameters","Domain")
	Else
		$joinDomain= regread("HKLM64\SYSTEM\ControlSet001\services\Tcpip\Parameters","Domain")
	EndIf

	;If $LogonDNSDomain="EXAS.AD.LOCAL" and $joinDomain <> "CTE.AD.LOCAL" then
	;
	;Else
	;	msgbox ("","","错误1-2： 此计算机已经设置完成，或者不在公司网络！")
	;	Exit
	;EndIf




	;****************** 管理账户判断,不在管理组推出   *********************



	;*****************   系统版本判断,win2000 winxp 不执行脚本操作   ********************
	If @OSVersion= "WIN_XP" Then
		MsgBox ("","","错误1-3： 操作系统不支持")
		Exit
	EndIf
	If @OSVersion="WIN_2000" Then
		MsgBox("","","错误3： 操作系统不支持")
		Exit
	EndIf
EndFunc


;将计算机加入域控
Func DomainJoi()
IniWrite($inifile,$ComputerName,"User",$UserName) ;$
IniWrite($inifile,$ComputerName,"Date",@YEAR&"."&@MON&"."&@MDAY&" " &@HOUR&":"&@MIN&":"&@SEC )
IniWrite($inifile,$ComputerName,"System",@OSVersion)


;RunAsWait("administrator","cte.ad.local","Mitsumi@11",$RUN_LOGON_PROFILE,@ComSpec & " /c " & $DomainCommand1)
;判断计算机生成状态 \\172.26.32.251\softwa\pcsetup\domain\savefile\计算机名称.txt
if FileExists($SaveFile) Then
	IniWrite($inifile,$ComputerName,"User",$UserName) ;$
	IniWrite($inifile,$ComputerName,"Date",@YEAR&"."&@MON&"."&@MDAY&" " &@HOUR&":"&@MIN&":"&@SEC )
	IniWrite($inifile,$ComputerName,"System",@OSVersion)
	IniWrite($inifile,$ComputerName,"Complete","1")
	IniWrite($inifile,$ComputerName,"LogonDNSDomain",$LogonDNSDomain)

Else
	msgbox("","","错误2-1:  计算机添加失败，请联系企画课！")
	Exit
EndIf
;电脑添加新域控
RunAsWait("administrator","cte.ad.local","Mitsumi@11",$RUN_LOGON_PROFILE,@ComSpec & " /c " & $DomainCommand2 )
If @OSArch="X86" Then
		$joinDomain= RegRead("HKLM\SYSTEM\ControlSet001\services\Tcpip\Parameters","Domain")
	Else
		$joinDomain= regread("HKLM64\SYSTEM\ControlSet001\services\Tcpip\Parameters","Domain")
	EndIf
If $joinDomain="CTE.AD.LOCAL" Then
	msgbox ("","","joinok")
	IniWrite($inifile,$ComputerName,"User",$UserName) ;$
	IniWrite($inifile,$ComputerName,"Date",@YEAR&"."&@MON&"."&@MDAY&" " &@HOUR&":"&@MIN&":"&@SEC )
	IniWrite($inifile,$ComputerName,"System",@OSVersion)
	IniWrite($inifile,$ComputerName,"Complete","1")
	IniWrite($inifile,$ComputerName,"LogonDNSDomain",$LogonDNSDomain)
	IniWrite($inifile,$ComputerName,"JoinDomain",$joinDomain)
	iniwrite($inifile,$ComputerName,"IPadd",@IPAddress1)
Else
	msgbox ("","","joinng")
EndIf







EndFunc

































