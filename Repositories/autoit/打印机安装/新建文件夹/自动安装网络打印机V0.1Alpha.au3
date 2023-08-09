#RequireAdmin
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_icon=..\..\..\..\..\..\Windows\system32\SHELL32.dll|-84
#PRE_Outfile=打印机自动安装程序V0.2.exe
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#cs -------------------------------------------------
AutoIt Version: v3.3.9.5
Author: Fiez Wang
Date: 2015.07.08
Version: V0.2 Alpha

Script Function:
    1.根据GUI选择打印机，自动安装
	2.根据系统的版本及架构，自动选择对应的驱动
	3.支持32位、64位的Win7、XP系统
	4.自动设置最后安装的打印机为默认打印机
	5.根据系统的版本及架构，自动选择对应的驱动
	6.支持32位、64位的Win7、XP系统
	7.自动设置最后安装的打印机为默认打印机
Version history:
	V0.1 Alpha 2015.07.07 提交全部功能程序
	V0.2 Alpha 2015.07.08修订部分系统无法正常安装的问题

#ce -------------------------------------------------
; Script Start - Add your code below here

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

; GUI Setup
#region ### START Koda GUI section ### Form=
$Form1 = GUICreate("打印机自动安装程序V0.2", 336, 300, -1, -1)
$Label1 = GUICtrlCreateLabel("请选择你要安装的打印机：", 24, 15, -1, -1)
$canon = GUICtrlCreateRadio("文印室Canon打印机", 48, 40, -1, -1)
$Sharp180 = GUICtrlCreateRadio("气压制造部Sharp 180打印机", 48, 70, -1, -1)
$Sharp316 = GUICtrlCreateRadio("气压工程部Sharp 316打印机", 48, 100, -1, -1)
$Button1 = GUICtrlCreateButton("安装", 128, 140, 75, 25)
$Label1 = GUICtrlCreateLabel("提示：", 24, 180, -1, -1)
$Label2 = GUICtrlCreateLabel("1.支持32位及64位的XP Win7系统", 24, 200, -1, -1)
$Label3 = GUICtrlCreateLabel("2.自动识别操作系统的版本", 24, 220, -1, -1)
$Label3 = GUICtrlCreateLabel("3.自动设置最后安装的打印机为默认打印机", 24, 240, -1, -1)
$Label4 = GUICtrlCreateLabel("版本号：V0.2 Alpha 2015.07.08", 24, 270, -1, -1)
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
				;文印室Canon打印机
				Case BitAND(GUICtrlRead($canon), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.16.13.29"
					$Name = "文印室Canon打印机"
					$Driver = "Canon iR2880 UFR II"
					If $osAr == "X86" Then
						$Path = "\\172.16.81.26\Software\04驱动程序\03打印机\Canon 2880\32BIT\win2k_vista\CNLB0C.INF"
					Else
						$Path = "\\172.16.81.26\Software\04驱动程序\03打印机\Canon 2880\64bit\Driver\CNLB0CA64.INF"
					EndIf
					_install($IP, $Name, $Path, $Driver)
				;气压制造部Sharp 180打印机
				Case BitAND(GUICtrlRead($Sharp180), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.16.11.28"
					$Name = "气压制造部Sharp 180打印机"
					$Driver = "SHARP MX-M180D PCL6"
					If $osAr == "X86" Then
						$Path = "\\172.16.81.26\Software\04驱动程序\03打印机\SHARP MX-M180D\sf3ejchs.inf"
					Else
						$Path = "\\172.16.81.26\Software\04驱动程序\03打印机\Sharp MX180D Win8Server2012\Chinese1\PCL6\64bit\sf3emchs.inf"
					EndIf
					_install($IP, $Name, $Path, $Driver)
				;气压工程部Sharp 316打印机
				Case BitAND(GUICtrlRead($Sharp316), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.16.20.25"
					$Name = "气压工程部Sharp 316打印机"
					$Driver = "SHARP AR-316L"
					If $osAr == "X86" Then
						$Path = "\\172.16.81.26\Software\04驱动程序\03打印机\SHARP AR 316L\2kxpVista\sk1bwchs.inf"
					Else
						$Driver = "SHARP AR-2628L"
						$Path = "\\172.16.81.26\Software\04驱动程序\03打印机\Sharp AR316_Win8Server2012\Printer\Chinese1\SPLC\64bit\sk3bmchs.inf"
					EndIf
					_install($IP, $Name, $Path, $Driver)
			EndSelect
	EndSwitch
WEnd

;setup pirnter
Func _install($IP, $Name, $Path, $Driver)
	ProgressOn("处理中,请稍候...", "", "", 100, 100, 2 + 16)
	ProgressSet(0, "已完成 0%", "正在创建变量...")
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
	;检测打印端口是否存在
	$i = 1
	$s = ""
	ProgressSet(10, "已完成 10%", "正在检测端口信息...")
	Sleep(300)

	Do
		$Var = RegEnumKey($RegPath, $i)
		$i = $i + 1
		ProgressSet(10 + $i, "已完成 " & 10 + $i & "%", "正在检测端口信息...")
		Sleep(300)
	Until StringLeft($Var, 3) <> "172"

	$x = StringInStr($Var, $IP)
	$PortName = $IP
	$NewRegPath = $RegPath & $PortName
	ProgressSet(30, "已完成 30%", "正在检测端口是否存在...")
	Sleep(300)

	;如果打印端口不存在，则利用注册表添加端口
	If $x = 0 Then
		ProgressSet(40, "已完成 40%", "端口不存在,在正在创建端口...")
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

		;添加端口后，需要重启print spool服务，才能识别端口
		ProgressSet(70, "已完成 70%", "正在停止打印服务...")
		RunWait(@ComSpec & " /c net stop spooler>nul", "", @SW_HIDE)
		ProgressSet(75, "已完成 80%", "正在启动打印服务...")
		RunWait(@ComSpec & " /c net start spooler", "", @SW_HIDE)
		ProgressSet(80, "已完成 80%", "准备添加打印机...")
		Sleep(1000)
	Else
		ProgressSet(60, "已完成 60%", "端口已经存在,准备添加打印机...")
		Sleep(300)
	EndIf
	Return $PortName
EndFunc   ;==>_addPortWin7

;add print port in XP
Func _addPortXP($IP)
	$i = 1
	$s = ""
	$RegPath001 = "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Print\Monitors\Standard TCP/IP Port\Ports\"
	ProgressSet(10, "已完成 10%", "正在检测端口信息...")
	Sleep(300)
	Do
		$Var = RegEnumKey($RegPath, $i)
		$i = $i + 1
		$s = $s & $Var & "/"
		ProgressSet(10 + $i, "已完成 " & 10 + $i & "%", "正在检测端口信息...")
		Sleep(300)
	Until StringLeft($Var, 3) <> "IP_"

	$x = StringInStr($s, "IP_" & $IP)
	$PortName = "IP_" & $IP
	$NewPatch = $RegPath & $PortName
	$NewPatch001 = $RegPath001 & $PortName
	ProgressSet(30, "已完成 30%", "正在检测端口是否存在...")

	Sleep(300)
	If $x = 0 Then
		ProgressSet(40, "已完成 40%", "端口不存在,在正在创建端口...")
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
		ProgressSet(60, "已完成 60%", "端口不存在,正在创建端口...")
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

		ProgressSet(70, "已完成 70%", "正在停止打印服务...")
		RunWait(@ComSpec & " /c sc stop spooler", "", @SW_HIDE)
		ProgressSet(75, "已完成 80%", "正在启动打印服务...")
		RunWait(@ComSpec & " /c sc start spooler", "", @SW_HIDE)
		ProgressSet(80, "已完成 80%", "准备添加打印机...")
		Sleep(1000)
	Else
		ProgressSet(60, "已完成 60%", "端口已经存在,准备添加打印机...")
		Sleep(300)
	EndIf
	Return $PortName
EndFunc   ;==>_addPortXP

;install Printer
Func _installPrint($Name, $Path, $PortName, $Driver)
	ProgressSet(90, "已完成 90%", "正在添加打印机...")
	;setup printer
	RunWait(@ComSpec & ' /c rundll32 printui.dll,PrintUIEntry /if /b "' & $Name & '" /f "' & $Path & '" /r "' & $PortName & '" /m "' & $Driver & '" ', "", @SW_HIDE)
	;set default
	RunWait(@ComSpec & ' /c rundll32 printui.dll,PrintUIEntry /y /n "' & $Name & '"  ', "", @SW_HIDE)
	Sleep(300)
	ProgressSet(100, "已完成 100%", "添加打印机完毕!")
	ProgressOff()
	RunWait("RUNDLL32 SHELL32.DLL,SHHelpShortcuts_RunDLL PrintersFolder")
	Sleep(500)
	Send("{F5}");需要刷新窗口，才能显示新添加的打印机
EndFunc   ;==>_installPrint


