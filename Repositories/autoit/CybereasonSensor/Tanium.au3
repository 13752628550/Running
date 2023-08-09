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










;��ʼ���������
Local $iniFile = "\\172.26.32.251\softwa\pcsetup\domain\inifile\printer.ini"
Local $Domain = @LogonDomain
Local $DomainAdmin = "ADMINISTRATOR"
Local $DomainPassword = "Mitsumi@11"
Local $TempDir = @TempDir
Local $OSVer = @OSVersion
Local $OSBit = @OSArch
Local $FilPath = "\\172.26.32.251\softwa\pcsetup\CybereasonSensor"
Local $LogFilPath = "\\172.26.32.251\softwa\pcsetup\CybereasonSensor\SavLogFil"
Local $FilNam = "SetupClient.exe"
Local $LogFilNam = "Sentinel.csv"
If $OSBit = "X86" Then
	Local $acvFil= "c:\Program Files\Tanium\Tanium Client"
Else
	Local $acvFil= "c:\Program Files (x86)\Tanium\Tanium Client"
EndIf

Local $InsComStr ="%temp%\SetupClient.exe /LogVerbosityLevel=1 /S"
Local $InsComStr1 ="copy  "& @TempDir & "\tanium-init.dat " & $acvFil 

Local $Result = FileExists($acvFil)

;~ MsgBox($MB_OK,"inscomstr",$InsComStr)






FileCopy($FilPath & "\" & $FilNam,$TempDir)
FileCopy($FilPath & "\" & "tanium-init.dat",$TempDir)
RunAsWait($DomainAdmin,$Domain,$DomainPassword,0,@ComSpec & " /c " & $InsComStr,"",@SW_HIDE)
MsgBox("","",$InsComStr1)
RunAsWait($DomainAdmin,$Domain,$DomainPassword,0, $InsComStr1,"",@SW_HIDE) 
If FileExists($acvFil & "\TaniumClient.exe")="1" Then
	$ResultI = "Completed"
Else
	$ResultI = "Not Installed"
EndIf








$addStrProgram = @YEAR & @MON & @MDAY & "," & @HOUR & @MIN & @SEC & "," & @ComputerName & "," & @UserName & "," & @IPAddress1 & "," & $ResultI
Local $hFileOpen = FileOpen($LogFilPath & "\" & $LogFilNam ,  $FO_APPEND  +   $FO_UTF8_NOBOM )
$iCheck = FileWriteLine($hFileOpen,$addStrProgram)
FileClose($hFileOpen)







;RunAsWait($DomainAdmin,$Domain,$DomainPassword,0,@ComSpec & " /c " & "RUNDLL32 SHELL32.DLL,SHHelpShortcuts_RunDLL PrintersFolder" ,"",@SW_HIDE)











































































































































































































































































































































































