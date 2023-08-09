#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\au3script_v10.ico
#AutoIt3Wrapper_UseX64=n
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
#include <stringconstants.au3>
local $TempDir = "C:\Windows\Temp\"
Local $Domain = @LogonDomain
Local $DomainAdmin = "ADMINISTRATOR"
Local $DomainPassword = "Mitsumi@11"
Local $OSBit = @OSArch





Local $FilPath = "\\172.26.32.251\softwa\pcsetup\CybereasonSensor\ProgramFiles"
Local $ScrFil = "StartupScript.bat"
Local $TokFil = "tanium-init.dat"
Local $InsComStr= $TempDir & $ScrFil
If $OSBit = "X86" Then
	Local $acvFil= "c:\Program Files\Tanium\Tanium Client"
Else
	Local $acvFil= "c:\Program Files (x86)\Tanium\Tanium Client"
EndIf 







































FileCopy($FilPath & "\*.*",$TempDir,1)

RunAsWait($DomainAdmin,$Domain,$DomainPassword,0,@ComSpec & " /c " & $InsComStr,"",@SW_SHOW)















If FileExists("C:\TaniumClient_Install.log")="1" Then
	MsgBox("","","程序安装正常")
Else
	$ResultI = "Not Installed"
	MsgBox("","","请联系企画课")
EndIf		

