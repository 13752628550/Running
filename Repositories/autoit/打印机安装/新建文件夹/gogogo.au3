#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_Icon=Printer.ico
#AutoIt3Wrapper_Outfile=gogogo.exe
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <File.au3>


























filecopy("\\172.26.32.251\softwa\print\driver\6.reg",@tempdir,$FC_OVERWRITE )
Global Const $RegPath="HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers"
$i = 1
$s = ""
Sleep(300)

Do
	$Var = RegEnumKey($RegPath, $i)
	$i = $i + 1
	Sleep(300)
	if stringleft($var,3)="" then
		exitloop
	endif
	;msgbox (0,"提示",$Var)

	if stringinstr($var,"fx") then
		msgbox (0,"设置打印机",$var,6)
		_FileWriteToLine(@tempdir & "\6.reg", 4, '"' & $var & '"' & "=hex:28,00,a1,7b,06,74,e8,90,29,00,20,00,46,00,\", True)

	EndIf

$runstr="reg import %temp%\6.reg"
;(@ComSpec & " /c " & "commandName");
local $ireturn7=runwait(@comspec & " /c" & "reg import %temp%\6.reg","","",@SW_HIDE )
;ShellExecuteWait("reg import %temp%\6.reg")

Until StringLeft($Var, 3) = ""

RunWait("RUNDLL32 SHELL32.DLL,SHHelpShortcuts_RunDLL PrintersFolder")
Sleep(500)
Send("{F5}");需要刷新窗口，才能显示新添加的打印机

































































