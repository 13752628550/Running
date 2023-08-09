
#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
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
Local $iniFile="\\172.26.32.251\softwa\pcsetup\domain\inifile\printer.ini"
Local $tmpFile=@TempDir & "\" & "depSelect.ini"
Local $sUpdate=IniRead($iniFile,"parameter","update","")
Local $ArrIniFile=IniReadSectionNames($iniFile)
Local $ArrDeptInf[1]
Global Const $RegPath = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Monitors\Standard TCP/IP Port\Ports\"
Local $i,$j,$k=1
if Not @error Then
	for $i= 1 to $ArrIniFile[0]
		$sDeptInf=IniRead($iniFile,$ArrIniFile[$i],"department","")
		if $sDeptInf="" Then
			ContinueLoop
		EndIf
		local $sLogic="false"
		for $j = 1 to UBound($ArrDeptInf)-1
			if $sDeptInf=$ArrDeptInf[$j] Then
				$sLogic="true"
			EndIf
		Next
		if $slogic="false" Then
			ReDim $ArrDeptInf[ubound($ArrDeptInf)+1]
			$ArrDeptInf[$k]=$sDeptInf
			$k=$k+1
		EndIf
	Next
EndIf
;_ArrayDisplay($ArrDeptInf)
#Region ### START Koda GUI section ### Form=H:\Design\autoit\打印机安装\mainf.kxf
$Form1_1 = GUICreate("打印机安装Ver3", 308, 346, 736, 346)
;GUISetBkColor(0xFFFFFF)
$idCombox = GUICtrlCreateCombo("请选择部门", 16, 32, 185, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
for $i= 1 to UBound($ArrDeptInf)-1
	GUICtrlSetData($idCombox,$ArrDeptInf[$i])
	GUICtrlSetFont($idCombox,13,1000)
	;GUICtrlSetBkColor($idCombox,0x336699)
	GUICtrlSetColor($idCombox,0x0078D7)
Next
$OKButton = GUICtrlCreateButton("安   装", 216, 32, 73, 25)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$PrinterList = GUICtrlCreateList("", 16, 72, 273, 236,BitOR($WS_VSCROLL,$WS_HSCROLL))
GUICtrlSetFont($PrinterList,10,700)
;GUICtrlSetBkColor($PrinterList,0x99CCCC)
GUICtrlSetColor($PrinterList,0x0078D7) ;0xFF0033
$Label7 = GUICtrlCreateLabel("数据更新日: " & $sUpdate, 22, 320, 135, 17)
$Label8 = GUICtrlCreateLabel("程序: 孙宝禄", 212, 320, 87, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $idCombox
			$sComboValue=GUICtrlRead($idCombox)
			$sCombocheck="6"
			ComSelect($sComboValue,$sCombocheck)
			;msgbox ("","",GUICtrlRead($idCombox))
			PrintRefresh()
		Case $PrinterList
			;MsgBox ("","",$PrinterList)
		Case $OKButton
			$sPrinterSelect=_GUICtrlListBox_GetCurSel($PrinterList)
			if $sPrinterSelect>= 0 Then
				GUICtrlSetState($OKButton,128)
				$sSetPrinterIP=""
				$sSetPrinterDrive=""
				$drvPathX64=""
				$drvPathx86=""
				$sSetPrinterCommand=""
				$sSetPrinterIP=IniRead($tmpFile,$sPrinterSelect,"SetPrinterIP","")
				$sSetPrinterDrive=IniRead($tmpFile,$sPrinterSelect,"SetPrinterDrive","")
				$drvPathX64=IniRead($tmpFile,$sPrinterSelect,"drvPathX64","")
				$drvPathx86=IniRead($tmpFile,$sPrinterSelect,"drvPathX86","")
				$sSetPrinterCommand=IniRead($tmpFile,$sPrinterSelect,"SetPrinterCommand","")
				if $sSetPrinterIP <> ""  Then
					;MsgBox ("","",$sSetPrinterIP & $sSetPrinterDrive & $drvPathX64 & $drvPathx86)
					if @OSArch="X86" Then
						_install($sSetPrinterIP,$sSetPrinterDrive,$drvPathx86,$sSetPrinterDrive)
					Else
						_install($sSetPrinterIP,$sSetPrinterDrive,$drvPathX64,$sSetPrinterDrive)
					EndIf
				EndIf

				Select
					Case $sSetPrinterCommand=""

					Case $sSetPrinterCommand="CardNum_Xerox"
						CardNum_Xerox()
					Case $sSetPrinterCommand="CardNum_Ricoh"
						CardNum_Ricoh()
				EndSelect
				GUICtrlSetState($OKButton,64)
			EndIf
	EndSwitch
WEnd

Func ComSelect (ByRef $sComboValue, ByRef $sCombocheck)
	FileDelete($tmpFile)
	$i=0
	$j=0
	$k=1
	$sDeptInf=""
	$ArrIniFile=IniReadSectionNames($iniFile)
	for $i= 1  to $ArrIniFile[0]
		$sDeptInf=IniRead($iniFile,$ArrIniFile[$i],"department","")
		if $sDeptInf= $sComboValue Then
			IniWrite($tmpFile,$j,"update",IniRead($iniFile,$ArrIniFile[$i],"update",""))
			IniWrite($tmpFile,$j,"department",IniRead($iniFile,$ArrIniFile[$i],"department",""))
			IniWrite($tmpFile,$j,"SetPrinterIP",IniRead($iniFile,$ArrIniFile[$i],"SetPrinterIP",""))
			IniWrite($tmpFile,$j,"SetPrinterDrive",IniRead($iniFile,$ArrIniFile[$i],"SetPrinterDrive",""))
			IniWrite($tmpFile,$j,"SetPrinterCommand",IniRead($iniFile,$ArrIniFile[$i],"SetPrinterCommand",""))
			IniWrite($tmpFile,$j,"disPrinterName",IniRead($iniFile,$ArrIniFile[$i],"disPrinterName",""))
			IniWrite($tmpFile,$j,"drvPathX64",IniRead($iniFile,$ArrIniFile[$i],"drvPathX64",""))
			IniWrite($tmpFile,$j,"drvPathX86",IniRead($iniFile,$ArrIniFile[$i],"drvPathX86",""))
			$j=$j+1
			$k=$k+1
		EndIf
	Next

EndFunc

Func PrintRefresh()
	$getCount=_GUICtrlListBox_GetCount($PrinterList)
	;MsgBox("","",$getCount)
	if $getCount<>0 Then
		for $i=1 to $getCount
			_GUICtrlListBox_DeleteString($PrinterList,0)
		Next
	EndIf
	if GUICtrlRead($idCombox)<> "请选择部门" Then
		$ArrTmpFile=IniReadSectionNames($tmpFile)
		$i=0
		$j=0
		$k=1
		for $i=1 to $ArrTmpFile[0]
			$sPrintInf=IniRead($tmpFile,$ArrTmpFile[$i],"disPrinterName","")
			_GUICtrlListBox_InsertString($PrinterList,$sPrintInf,-1)
			_GUICtrlListBox_SetItemHeight($PrinterList,19)
			$j=$j+1
			$k=$k+1
			;msgbox ("","",$ArrTmpFile[$i] & $sPrintInf)
		Next
	EndIf
EndFunc

;setup pirnter
Func _install($IP, $Name, $Path, $Driver)
	ProgressOn("处理中请稍候...", "", "", 100, 100, 2 + 16)
	ProgressSet(0, "已完成 0%", "正在侦测系统...")
	Sleep(300)
	$osVer=@OSVersion
	Select
		Case $osVer == "WIN_XP"
			$PortName = _addPortXP($IP)
		Case $osVer == "WIN_7"
			;MsgBox(0,"", $osAr & "   " & $osVer)
			$PortName = _addPortWin7($IP)
		case $osver == "WIN_10"
		    ;MsgBox(0,"", $osAr & "   " & $osVer)
			$PortName=_addPortWin7($ip)

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
		;msgbox (0,"提示",$Var)
		$x=StringInStr($Var,$IP)
        if $x<>0 then
			ExitLoop
		EndIf
	Until StringLeft($Var, 3) <> "172"

	$PortName = $IP
	$NewRegPath = $RegPath & $PortName
	ProgressSet(30, "已完成 30%", "正在检测端口是否存在...")
	Sleep(300)

	;如果打印端口不存在，则利用注册表添加端口
	If $x = 0 Then
		ProgressSet(40, "已完成 40%", "端口不存在,正在创建端口...")
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

Func CardNum_Xerox()
	;用户卡号到打印机
	$cardhao=inputbox("输入","输入打印机卡号：")
	if $cardhao= 0 then
		msgbox (0,"提示","输入卡号不成功")
	Else

		;msgbox (0,"输入返回值为：",$billid)
		$return7=RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\"& $sSetPrinterDrive & "\PrinterDriverData\UserInfo","SpecifyJobOwnerName_User","REG_SZ","EnterName")
		$return8=RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\"& $sSetPrinterDrive & "\PrinterDriverData\UserInfo","JobOwnerName_user","REG_SZ",$cardhao)


		if $return7=1 and $return8=1 Then
			sleep(300)
			msgbox (0,"提示","卡号设置成功")
		Else
			sleep(300)
			msgbox (0,"提示","卡号设置不成功")
		EndIf


	EndIf

EndFunc

Func CardNum_Ricoh()
	;msgbox (0,"CardNum_Ricoh","卡号设置代码块")
	RunWait(@ComSpec & ' /c regedit /s \\172.26.32.251\softwa\print\Driver\Ricoh\IMC3000\IM_C3000_C3500\username.reg',"", @SW_HIDE)
	RunWait(@ComSpec & ' /c regedit /s \\172.26.32.251\softwa\print\Driver\Ricoh\IMC3000\IM_C3000_C3500\Black.reg',"", @SW_HIDE)
EndFunc





























































































































































































































































































































































