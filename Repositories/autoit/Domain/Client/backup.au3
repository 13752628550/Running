
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
#Region ### START Koda GUI section ### Form=H:\Design\autoit\Domain\Client\userform.kxf
$Form1 = GUICreate("Userform", 382, 210, 422, 391)
$GroupBox1 = GUICtrlCreateGroup("������: " & @ComputerName, 8, 9, 265, 193)
$Label1 = GUICtrlCreateLabel("��ʾ������ִ�к����������", 48, 136, 172, 17)
GUICtrlSetColor(-1, 0xFF0000)
$Label2 = GUICtrlCreateLabel("����ǰ�����ļ��ر�", 80, 160, 124, 17)
GUICtrlSetColor(-1, 0xFF0000)
$Label3 = GUICtrlCreateLabel("ִ�У�", 24, 32, 40, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Label4 = GUICtrlCreateLabel("״̬��", 24, 72, 40, 20)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Label5 = GUICtrlCreateLabel("", 80, 32, 4, 4)
$Label6 = GUICtrlCreateLabel("", 80, 72, 4, 4)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button1 = GUICtrlCreateButton("����", 285, 16, 75, 25)
$Button2 = GUICtrlCreateButton("�˳�", 285, 48, 75, 25)
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

;�û�����״̬
Func Envionment()
	;*****************   CTE.AD.LOCAL �������Ӳ���,���ܷ��ʵ�ַ���Ƴ�   ********************
	TCPStartup()
	$sIPAddress = TCPNameToIP("CTE.AD.LOCAL")
	If @error Then
		msgbox (0+202144,"","����1-1�� ����������⣬����ϵ����Ա��" )
		Exit
	Else
		TCPShutdown()
	EndIf


	;****************** ����Ѿ�����CTE.AD.LOCAL���Ƴ�����ִ��   ******************
	If @OSArch="X86" Then
		$joinDomain= RegRead("HKLM\SYSTEM\ControlSet001\services\Tcpip\Parameters","Domain")
	Else
		$joinDomain= regread("HKLM64\SYSTEM\ControlSet001\services\Tcpip\Parameters","Domain")
	EndIf

	;If $LogonDNSDomain="EXAS.AD.LOCAL" and $joinDomain <> "CTE.AD.LOCAL" then
	;
	;Else
	;	msgbox ("","","����1-2�� �˼�����Ѿ�������ɣ����߲��ڹ�˾���磡")
	;	Exit
	;EndIf




	;****************** �����˻��ж�,���ڹ������Ƴ�   *********************



	;*****************   ϵͳ�汾�ж�,win2000 winxp ��ִ�нű�����   ********************
	If @OSVersion= "WIN_XP" Then
		MsgBox ("","","����1-3�� ����ϵͳ��֧��")
		Exit
	EndIf
	If @OSVersion="WIN_2000" Then
		MsgBox("","","����3�� ����ϵͳ��֧��")
		Exit
	EndIf
EndFunc


;��������������
Func DomainJoi()
IniWrite($inifile,$ComputerName,"User",$UserName) ;$
IniWrite($inifile,$ComputerName,"Date",@YEAR&"."&@MON&"."&@MDAY&" " &@HOUR&":"&@MIN&":"&@SEC )
IniWrite($inifile,$ComputerName,"System",@OSVersion)


;RunAsWait("administrator","cte.ad.local","Mitsumi@11",$RUN_LOGON_PROFILE,@ComSpec & " /c " & $DomainCommand1)
;�жϼ��������״̬ \\172.26.32.251\softwa\pcsetup\domain\savefile\���������.txt
if FileExists($SaveFile) Then
	IniWrite($inifile,$ComputerName,"User",$UserName) ;$
	IniWrite($inifile,$ComputerName,"Date",@YEAR&"."&@MON&"."&@MDAY&" " &@HOUR&":"&@MIN&":"&@SEC )
	IniWrite($inifile,$ComputerName,"System",@OSVersion)
	IniWrite($inifile,$ComputerName,"Complete","1")
	IniWrite($inifile,$ComputerName,"LogonDNSDomain",$LogonDNSDomain)

Else
	msgbox("","","����2-1:  ��������ʧ�ܣ�����ϵ�󻭿Σ�")
	Exit
EndIf
;������������
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

































