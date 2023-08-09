#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\SciTE\Tool_Icon\Icon_0303.ico
#AutoIt3Wrapper_Outfile=PDF_APP.exe
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ColorConstantS.au3>
#include <MsgBoxConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("setup", 335, 178, 776, 687,-1,$WS_EX_TOPMOST)
$GroupBox1 = GUICtrlCreateGroup("APP_PDF", 16, 9, 297, 129)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
;$Progress1 = GUICtrlCreateProgress(32, 104, 257, 17)
$Label1 = GUICtrlCreateLabel("点击开始按钮安装", 40, 40, 234, 17)
GUICtrlSetColor($Label1,$COLOR_BLUE)
$Label2 = GUICtrlCreateLabel("", 40, 72, 242, 17)
guictrlsetcolor($Label2,$COLOR_BLUE)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button1 = GUICtrlCreateButton("开始", 89, 143, 75, 25)
$Button2 = GUICtrlCreateButton("关闭", 178, 143, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###











$TempDir=@TempDir
$InsSource="\\172.26.32.251\softwa\software\APP_PDF"
$OSBit=@OSArch
$Admin="Administrator"
$Domain=@ComputerName
$Password="cte.sys.admin"
$iReturn=""
$RegPath321="HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
$RegPath322="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
$RegPath641="HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			_setup()
		case $Button2
			Exit
	EndSwitch
WEnd

func _setup()
	GUICtrlSetState($Button1,$GUI_DISABLE)
	$Progress1 = GUICtrlCreateProgress(32, 104, 257, 17)
	GUICtrlSetData($Label1,"PDF Editor 安装...")
	guictrlsetdata($Label2,"")
	filecopy($InsSource & "\" & "pdf_editor_setup.exe",$TempDir)
	GUICtrlSetData($Progress1,30)
	$iReturn=RunAsWait($Admin,$Domain,$Password,1,$TempDir & "\" & "pdf_editor_setup.exe")
	;msgbox (0,"",$iReturn)
	GUICtrlSetData($Progress1,50)
	if $OSBit="X86" Then
		filecopy ($InsSource & "\" & "jre-8u211-windows-i586.exe",$tempdir)
		filecopy ($Inssource & "\" & "pdfsam-3.3.7.msi",$tempdir)
		GUICtrlSetData($Progress1,70)
		GUICtrlSetData($Label1,"Java 安装...")
		$iReturn=RunAsWait($Admin,$Domain,$Password,1,$TempDir & "\" & "jre-8u211-windows-i586.exe")
		;msgbox (0,"",$iReturn)
		GUICtrlSetData($Progress1,80)
		GUICtrlSetData($Label1,"PDFSAM 安装...")
		$iReturn=RunAsWait($Admin,$Domain,$Password,1,@ComSpec & " /c " & $TempDir & "\" & "pdfsam-3.3.7.msi",@SystemDir,@SW_HIDE)
		;msgbox (0,"",$iReturn)
	Else
		filecopy ($InsSource & "\pdfsam-4.0.3\" & "pdfsam-4.0.3.msi",$tempdir)
		GUICtrlSetData($Progress1,78)
		GUICtrlSetData($Label1,"PDFSAM 安装...")
		$iReturn=RunAsWait($Admin,$Domain,$Password,1, @ComSpec & " /c " & $TempDir & "\" & "pdfsam-4.0.3.msi",@SystemDir,@SW_HIDE )
		;msgbox (0,"",$iReturn)
	EndIf
	GUICtrlSetState($button1,$GUI_ENABLE)
	GUICtrlSetData($Progress1,100)
	If _chk("Icecream PDF Editor")= "1" Then
		GUICtrlSetData($Label1,"PDF Editor 已安装")
		GUICtrlSetColor($Label1,$COLOR_BLUE)
	Else
		Guictrlsetdata($Label1,"PDF Editor 未成功安装")
		GUICtrlSetColor($Label1,$COLOR_RED)
	EndIf

	if $osbit="X86" then
		If _chk("pdfsam")="1" Then
			GUICtrlSetData($Label2,"PDFSAM     已安装")
			GUICtrlSetColor($Label2,$COLOR_BLUE)
		Else
			GUICtrlSetData($Label2,"PDFSAM     未成功安装")
			GUICtrlSetColor($Label2,$COLOR_RED)
		EndIf
	Else
		;$Value=regread ("HKEY_LOCAL_MACHINE64\SOFTWARE\PDFsam Basic\Capabilities","ApplicationName")
		;MsgBox(0,"",$Value)
		if regread ("HKEY_LOCAL_MACHINE64\SOFTWARE\PDFsam Basic\Capabilities","ApplicationName")="PDFSAM Basic" then
			GUICtrlSetData($Label2,"PDFSAM     已安装")
			GUICtrlSetColor($Label2,$COLOR_BLUE)
		Else
			GUICtrlSetData($Label2,"PDFSAM     未成功安装")
			GUICtrlSetColor($Label2,$COLOR_RED)
		EndIf
	EndIf
	GUICtrlDelete($Progress1)

EndFunc

Func _chk($Regname)
	$RetCode="0"
	;msgbox(0,"",$Regname)
	if $OSBit="X86" Then
		$i=1
		do
		$Var= RegEnumKey($RegPath321, $i)
		if  StringInStr(regread ($RegPath321&"\"&$var,"DisplayName"),$Regname)>0 then
			$RetCode="1"
			Return $RetCode
		EndIf
		$i=$i+1
		until StringLeft($Var, 3) = ""

		$i=1
		do
		$Var= RegEnumKey($RegPath322, $i)
		if StringInStr(regread ($RegPath322&"\"&$var,"DisplayName"),$Regname)>0 then
			$RetCode="1"
			Return $RetCode
		EndIf
		$i=$i+1
		until StringLeft($Var, 3) = ""
	Else
		$i=1
		do
		$Var= RegEnumKey($RegPath321, $i)
		if StringInStr(regread ($RegPath321&"\"&$var,"DisplayName"),$Regname)>0 then
			$RetCode="1"
			Return $RetCode
		EndIf
		$i=$i+1
		until StringLeft($Var, 3) = ""

		$i=1
		do
		$Var= RegEnumKey($Regpath322, $i)
		if StringInStr(regread ($RegPath322&"\"&$var,"DisplayName"),$Regname)>0 then
			$RetCode="1"
			Return $RetCode
		EndIf
		$i=$i+1
		until StringLeft($Var, 3) = ""

		$i=1
		do
		$Var= RegEnumKey($RegPath641, $i)
		;msgbox(0,"",regread ($RegPath641&"\"&$var,"DisplayName"))
		if StringInStr(regread ($RegPath641&"\"&$var,"DisplayName"),$Regname)>0 then
			$RetCode="1"
			Return $RetCode
		EndIf
		$i=$i+1
		until StringLeft($Var, 3) = ""
	EndIf
	Return $RetCode
EndFunc





