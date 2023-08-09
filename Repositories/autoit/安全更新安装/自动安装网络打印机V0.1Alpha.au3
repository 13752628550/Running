#RequireAdmin
#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_icon=..\..\..\..\..\..\Windows\system32\SHELL32.dll|-84
#PRE_Outfile=��ӡ���Զ���װ����V0.2.exe
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#cs -------------------------------------------------
AutoIt Version: v3.3.9.5
Author: Fiez Wang
Date: 2015.07.08
Version: V0.2 Alpha

Script Function:
    1.����GUIѡ���ӡ�����Զ���װ
	2.����ϵͳ�İ汾���ܹ����Զ�ѡ���Ӧ������
	3.֧��32λ��64λ��Win7��XPϵͳ
	4.�Զ��������װ�Ĵ�ӡ��ΪĬ�ϴ�ӡ��
	5.����ϵͳ�İ汾���ܹ����Զ�ѡ���Ӧ������
	6.֧��32λ��64λ��Win7��XPϵͳ
	7.�Զ��������װ�Ĵ�ӡ��ΪĬ�ϴ�ӡ��
Version history:
	V0.1 Alpha 2015.07.07 �ύȫ�����ܳ���
	V0.2 Alpha 2015.07.08�޶�����ϵͳ�޷�������װ������

#ce -------------------------------------------------
; Script Start - Add your code below here

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

; GUI Setup
#region ### START Koda GUI section ### Form=
$Form1 = GUICreate("��ӡ���Զ���װ����V0.2", 336, 300, -1, -1)
$Label1 = GUICtrlCreateLabel("��ѡ����Ҫ��װ�Ĵ�ӡ����", 24, 15, -1, -1)
$canon = GUICtrlCreateRadio("��ӡ��Canon��ӡ��", 48, 40, -1, -1)
$Sharp180 = GUICtrlCreateRadio("��ѹ���첿Sharp 180��ӡ��", 48, 70, -1, -1)
$Sharp316 = GUICtrlCreateRadio("��ѹ���̲�Sharp 316��ӡ��", 48, 100, -1, -1)
$Button1 = GUICtrlCreateButton("��װ", 128, 140, 75, 25)
$Label1 = GUICtrlCreateLabel("��ʾ��", 24, 180, -1, -1)
$Label2 = GUICtrlCreateLabel("1.֧��32λ��64λ��XP Win7ϵͳ", 24, 200, -1, -1)
$Label3 = GUICtrlCreateLabel("2.�Զ�ʶ�����ϵͳ�İ汾", 24, 220, -1, -1)
$Label3 = GUICtrlCreateLabel("3.�Զ��������װ�Ĵ�ӡ��ΪĬ�ϴ�ӡ��", 24, 240, -1, -1)
$Label4 = GUICtrlCreateLabel("�汾�ţ�V0.2 Alpha 2015.07.08", 24, 270, -1, -1)
GUICtrlSetState($canon, $GUI_CHECKED)
GUISetState(@SW_SHOW)
#endregion ### END Koda GUI section ###

Global Const $osAr = @OSArch
Global Const $osVer = @OSVersion
;Regedit path
Global Const $RegPath = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Monitors\Standard TCP/IP Port\Ports\"

; Main Loop
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $Button1
			Select
				;��ӡ��Canon��ӡ��
				Case BitAND(GUICtrlRead($canon), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.16.13.29"
					$Name = "��ӡ��Canon��ӡ��"
					$Driver = "Canon iR2880 UFR II"
					If $osAr == "X86" Then
						$Path = "\\172.16.81.26\Software\04��������\03��ӡ��\Canon 2880\32BIT\win2k_vista\CNLB0C.INF"
					Else
						$Path = "\\172.16.81.26\Software\04��������\03��ӡ��\Canon 2880\64bit\Driver\CNLB0CA64.INF"
					EndIf
					_install($IP, $Name, $Path, $Driver)
				;��ѹ���첿Sharp 180��ӡ��
				Case BitAND(GUICtrlRead($Sharp180), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.16.11.28"
					$Name = "��ѹ���첿Sharp 180��ӡ��"
					$Driver = "SHARP MX-M180D PCL6"
					If $osAr == "X86" Then
						$Path = "\\172.16.81.26\Software\04��������\03��ӡ��\SHARP MX-M180D\sf3ejchs.inf"
					Else
						$Path = "\\172.16.81.26\Software\04��������\03��ӡ��\Sharp MX180D Win8Server2012\Chinese1\PCL6\64bit\sf3emchs.inf"
					EndIf
					_install($IP, $Name, $Path, $Driver)
				;��ѹ���̲�Sharp 316��ӡ��
				Case BitAND(GUICtrlRead($Sharp316), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.16.20.25"
					$Name = "��ѹ���̲�Sharp 316��ӡ��"
					$Driver = "SHARP AR-316L"
					If $osAr == "X86" Then
						$Path = "\\172.16.81.26\Software\04��������\03��ӡ��\SHARP AR 316L\2kxpVista\sk1bwchs.inf"
					Else
						$Driver = "SHARP AR-2628L"
						$Path = "\\172.16.81.26\Software\04��������\03��ӡ��\Sharp AR316_Win8Server2012\Printer\Chinese1\SPLC\64bit\sk3bmchs.inf"
					EndIf
					_install($IP, $Name, $Path, $Driver)
			EndSelect
	EndSwitch
WEnd

;setup pirnter
Func _install($IP, $Name, $Path, $Driver)
	ProgressOn("������,���Ժ�...", "", "", 100, 100, 2 + 16)
	ProgressSet(0, "����� 0%", "���ڴ�������...")
	Sleep(300)
	Select
		Case $osVer == "WIN_XP"
			$PortName = _addPortXP($IP)
		Case $osVer == "WIN_7"
			;MsgBox(0,"", $osAr & "   " & $osVer)
			$PortName = _addPortWin7($IP)
	EndSelect
	_installPrint($Name, $Path, $PortName, $Driver)
EndFunc   ;==>_install

;add print port in Win7
Func _addPortWin7($IP)
	;����ӡ�˿��Ƿ����
	$i = 1
	$s = ""
	ProgressSet(10, "����� 10%", "���ڼ��˿���Ϣ...")
	Sleep(300)

	Do
		$Var = RegEnumKey($RegPath, $i)
		$i = $i + 1
		ProgressSet(10 + $i, "����� " & 10 + $i & "%", "���ڼ��˿���Ϣ...")
		Sleep(300)
	Until StringLeft($Var, 3) <> "172"

	$x = StringInStr($Var, $IP)
	$PortName = $IP
	$NewRegPath = $RegPath & $PortName
	ProgressSet(30, "����� 30%", "���ڼ��˿��Ƿ����...")
	Sleep(300)

	;�����ӡ�˿ڲ����ڣ�������ע�����Ӷ˿�
	If $x = 0 Then
		ProgressSet(40, "����� 40%", "�˿ڲ�����,�����ڴ����˿�...")
		Sleep(300)
		RegWrite($NewRegPath)
		RegWrite($NewRegPath, "HostName", "REG_SZ", $IP)
		RegWrite($NewRegPath, "HWAddress", "REG_SZ", "")
		RegWrite($NewRegPath, "IPAddress", "REG_SZ", "")
		RegWrite($NewRegPath, "PortMonMibPortIndex", "REG_DWORD", "00000001")
		RegWrite($NewRegPath, "PortNumber", "REG_DWORD", "9100")
		RegWrite($NewRegPath, "Protocol", "REG_DWORD", "00000001")
		RegWrite($NewRegPath, "SNMP Community", "REG_SZ", "public")
		RegWrite($NewRegPath, "SNMP Enabled", "REG_DWORD", "00000000")
		RegWrite($NewRegPath, "SNMP Index", "REG_DWORD", "00000000")
		RegWrite($NewRegPath, "Version", "REG_DWORD", "00000002")

		;��Ӷ˿ں���Ҫ����print spool���񣬲���ʶ��˿�
		ProgressSet(70, "����� 70%", "����ֹͣ��ӡ����...")
		RunWait(@ComSpec & " /c net stop spooler>nul", "", @SW_HIDE)
		ProgressSet(75, "����� 80%", "����������ӡ����...")
		RunWait(@ComSpec & " /c net start spooler", "", @SW_HIDE)
		ProgressSet(80, "����� 80%", "׼����Ӵ�ӡ��...")
		Sleep(1000)
	Else
		ProgressSet(60, "����� 60%", "�˿��Ѿ�����,׼����Ӵ�ӡ��...")
		Sleep(300)
	EndIf
	Return $PortName
EndFunc   ;==>_addPortWin7

;add print port in XP
Func _addPortXP($IP)
	$i = 1
	$s = ""
	$RegPath001 = "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Print\Monitors\Standard TCP/IP Port\Ports\"
	ProgressSet(10, "����� 10%", "���ڼ��˿���Ϣ...")
	Sleep(300)
	Do
		$Var = RegEnumKey($RegPath, $i)
		$i = $i + 1
		$s = $s & $Var & "/"
		ProgressSet(10 + $i, "����� " & 10 + $i & "%", "���ڼ��˿���Ϣ...")
		Sleep(300)
	Until StringLeft($Var, 3) <> "IP_"

	$x = StringInStr($s, "IP_" & $IP)
	$PortName = "IP_" & $IP
	$NewPatch = $RegPath & $PortName
	$NewPatch001 = $RegPath001 & $PortName
	ProgressSet(30, "����� 30%", "���ڼ��˿��Ƿ����...")

	Sleep(300)
	If $x = 0 Then
		ProgressSet(40, "����� 40%", "�˿ڲ�����,�����ڴ����˿�...")
		Sleep(300)
		RegWrite($NewPatch)
		RegWrite($NewPatch, "Protocol", "REG_DWORD", "00000001")
		RegWrite($NewPatch, "Version", "REG_DWORD", "00000001")
		RegWrite($NewPatch, "HostName", "REG_SZ", "")
		RegWrite($NewPatch, "IPAddress", "REG_SZ", $IP)
		RegWrite($NewPatch, "HWAddress", "REG_SZ", "")
		RegWrite($NewPatch, "PortNumber", "REG_DWORD", "9100")
		RegWrite($NewPatch, "SNMP Community", "REG_SZ", "public")
		RegWrite($NewPatch, "SNMP Enabled", "REG_DWORD", "00000001")
		RegWrite($NewPatch, "SNMP Index", "REG_DWORD", "00000001")
		ProgressSet(60, "����� 60%", "�˿ڲ�����,���ڴ����˿�...")
		Sleep(300)
		RegWrite($NewPatch001)
		RegWrite($NewPatch001, "Protocol", "REG_DWORD", "00000001")
		RegWrite($NewPatch001, "Version", "REG_DWORD", "00000001")
		RegWrite($NewPatch001, "HostName", "REG_SZ", "")
		RegWrite($NewPatch001, "IPAddress", "REG_SZ", $IP)
		RegWrite($NewPatch001, "HWAddress", "REG_SZ", "")
		RegWrite($NewPatch001, "PortNumber", "REG_DWORD", "9100")
		RegWrite($NewPatch001, "SNMP Community", "REG_SZ", "public")
		RegWrite($NewPatch001, "SNMP Enabled", "REG_DWORD", "00000001")
		RegWrite($NewPatch001, "SNMP Index", "REG_DWORD", "00000001")

		ProgressSet(70, "����� 70%", "����ֹͣ��ӡ����...")
		RunWait(@ComSpec & " /c sc stop spooler", "", @SW_HIDE)
		ProgressSet(75, "����� 80%", "����������ӡ����...")
		RunWait(@ComSpec & " /c sc start spooler", "", @SW_HIDE)
		ProgressSet(80, "����� 80%", "׼����Ӵ�ӡ��...")
		Sleep(1000)
	Else
		ProgressSet(60, "����� 60%", "�˿��Ѿ�����,׼����Ӵ�ӡ��...")
		Sleep(300)
	EndIf
	Return $PortName
EndFunc   ;==>_addPortXP

;install Printer
Func _installPrint($Name, $Path, $PortName, $Driver)
	ProgressSet(90, "����� 90%", "������Ӵ�ӡ��...")
	;setup printer
	RunWait(@ComSpec & ' /c rundll32 printui.dll,PrintUIEntry /if /b "' & $Name & '" /f "' & $Path & '" /r "' & $PortName & '" /m "' & $Driver & '" ', "", @SW_HIDE)
	;set default
	RunWait(@ComSpec & ' /c rundll32 printui.dll,PrintUIEntry /y /n "' & $Name & '"  ', "", @SW_HIDE)
	Sleep(300)
	ProgressSet(100, "����� 100%", "��Ӵ�ӡ�����!")
	ProgressOff()
	RunWait("RUNDLL32 SHELL32.DLL,SHHelpShortcuts_RunDLL PrintersFolder")
	Sleep(500)
	Send("{F5}");��Ҫˢ�´��ڣ�������ʾ����ӵĴ�ӡ��
EndFunc   ;==>_installPrint


