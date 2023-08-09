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
Local $acvFil= "C:\Program Files\SentinelOne\Sentinel agent 22.3.4.612\Sentinelagent.exe"
Local $LogFilNam = "Sentinel.csv"
If $OSBit = "X86" Then
	Local $FilNam = "SentinelInstaller_windows_32bit_v22_3_4_612.msi"
Else
	Local $FilNam = "SentinelInstaller_windows_64bit_v22_3_4_612.msi"
EndIf

;~ Local $InsComStr =@TempDir & "\" & $FilNam & ' /SITE_TOKEN="eyJ1cmwiOiAiaHR0cHM6Ly9hcG5lMS0xMDAyLnNlbnRpbmVsb25lLm5ldCIsICJzaXRlX2tleSI6ICIxYTliYWYzY2NmNDgwNzY1In0=" /SILENT /SERVER_PROXY=http://172.25.65.115:8080 '
Local $InsComStr ="msiexec -i " & @TempDir & "\" & $FilNam &  " SERVER_PROXY=http://172.25.65.115:8080/  SITE_TOKEN=eyJ1cmwiOiAiaHR0cHM6Ly9hcG5lMS0xMDAyLnNlbnRpbmVsb25lLm5ldCIsICJzaXRlX2tleSI6ICIxYTliYWYzY2NmNDgwNzY1In0= /qn"
Local $Result = FileExists($acvFil)

;~ MsgBox($MB_OK,"inscomstr",$InsComStr)


If $Result <> "1" Then
	;MsgBox($MB_OK,"runok",$Result)
	;MsgBox($MB_OK,@ComputerName,$Result)

	;If $OSVer <> "WIN_81" Then
		;MsgBox($MB_OK,"����","ϵͳ�����㰲װҪ��")
	;	Exit
	;EndIf


	FileCopy($FilPath & "\" & $FilNam,$TempDir)
	RunAsWait($DomainAdmin,$Domain,$DomainPassword,0,@ComSpec & " /c " & $InsComStr,"",@SW_HIDE)
	If FileExists($acvFil)="1" Then
		$ResultI = "Completed"
	Else
		$ResultI = "Not Installed"
	EndIf
	$addStrProgram = @YEAR & @MON & @MDAY & "," & @HOUR & @MIN & @SEC & "," & @ComputerName & "," & @UserName & "," & @IPAddress1 & "," & $ResultI
	Local $hFileOpen = FileOpen($LogFilPath & "\" & $LogFilNam ,  $FO_APPEND  +   $FO_UTF8_NOBOM )
	$iCheck = FileWriteLine($hFileOpen,$addStrProgram)
	FileClose($hFileOpen)







;RunAsWait($DomainAdmin,$Domain,$DomainPassword,0,@ComSpec & " /c " & "RUNDLL32 SHELL32.DLL,SHHelpShortcuts_RunDLL PrintersFolder" ,"",@SW_HIDE)
EndIf










































































































































































































































































































































































