#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include <AutoItConstants.au3>


;msgbox (0,"",@DesktopCommonDir)
$aArray = DriveGetDrive($DT_FIXED)
For $i = 1 To $aArray[0]
	$dirins=StringUpper($aArray[$i])&"\LOTUS\"
	$dirdata=$dirins & "data\"
Next
$install='\\172.26.32.251\softwa\software\English\EN\setup /S /V"ADDFEATURES=ALL PROGDIR=' & $dirins &  " DATADIR=" & $dirdata & ' /qb+"'
$install6='\\172.26.32.251\softwa\software\english\en\setup /S /V"ADDFEATURES=ALL PROGDIR=h:\lotus\ "DATADIR=H:\LOTUS\DATA /qb+"'
$uninstall='msiexec /x "\\172.26.32.251\softwa\software\English\EN\IBM Notes 9.0.1 Social Edition.msi" /qb+'
$status1=""
$status2=""
$status3=0

;msgbox(0,"",$install)
;msgbox(0,"",$uninstall)





;msgbox (0,"",$dirins)
;msgbox (0,"",$dirdata)
;msgbox (0,"", '"' & "mitsumi" & '"')
if not FileExists(@DesktopCommonDir & "\ibm notes.lnk")  then

	;msgbox (0,"","mexist")
	;msgbox (0,"","install")
	runwait(@ComSpec & " /c " & $install,"",@SW_HIDE )
	msgbox (0,"","install66")




	runwait($install6)





EndIf
if FileExists(@DesktopCommonDir & "\ibm notes.lnk") and (regread("HKEY_CURRENT_USER\Software\IBM\Notes\Installer","DATADIR") <> $dirdata ) Then
	;msgbox (0,"","install")
	;msgbox (0,"",regread("HKEY_CURRENT_USER\Software\IBM\Notes\Installer","DATADIR"))
	;msgbox (0,"","uninstall")


	runwait($uninstall)
	;msgbox (0,"","install")
	runwait($install)

EndIf