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
	if StringUpper ($aArray[$i])>"H:" then
		ExitLoop
	EndIf
	$dirins=StringUpper($aArray[$i])&"\LOTUS\"
	$dirdata=$dirins & "data\"
Next
$install='\\172.26.32.251\softwa\software\English\EN\setup /S /V"ADDFEATURES=ALL PROGDIR=' & $dirins &  " DATADIR=" & $dirdata & ' /qb+"'
$uninstall='msiexec /x "\\172.26.32.251\softwa\software\English\EN\IBM Notes 9.0.1 Social Edition.msi" /qb+'
$status1=""
$status2=""
$status3=0

;msgbox(0,"",$install)
;msgbox(0,"",$uninstall)





;msgbox (0,"",""$dirins)
;msgbox (0,"",$dirdata)
;msgbox (0,"", '"' & "mitsumi" & '"')
if not FileExists(@DesktopCommonDir & "\ibm notes.lnk")  then

	;msgbox (0,"","mexist")
	;msgbox (0,"","install")
	runwait(@ComSpec & " /c " & $install,"",@SW_HIDE)
EndIf
if FileExists(@DesktopCommonDir & "\ibm notes.lnk") and (regread("HKEY_CURRENT_USER\Software\IBM\Notes\Installer","DATADIR") <> $dirdata ) Then






	runwait($uninstall)
	;msgbox (0,"","install")
	runwait(@ComSpec & " /c " & $install,"",@SW_HIDE)

EndIf

;patch install
;msgbox (0,"","patch install")
if @osarch = "x86" then
	;msgbox (0,"","x86")
	$patchreg="HKEY_LOCAL_MACHINE\SOFTWARE\IBM\Lotus\Expeditor\{5BA7CD07-4D6C-4D16-B1A6-2B50DD5F17AD}"
else
	;msgbox (0,"","x64")
	$patchreg="HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\IBM\Lotus\Expeditor\{5BA7CD07-4D6C-4D16-B1A6-2B50DD5F17AD}"
endif
;msgbox (0,"",$patchreg)
if regread($patchreg,"xpdHotfixVersion") <> "FP8 SHF216" then
	ShellExecute("\\172.26.32.251\softwa\software\english\901FP8SHF216_W32_standard.exe","")
	;Run("\\172.26.32.251\softwa\software\english\901FP8SHF216_W32_standard.exe","")


	$title="IBM Notes 9.0.1 FP8 SHF216 - InstallShield Wizard"
	$text="The InstallShield"
	_WinExiSetAct_AndWaitAct($title,$text)
	controlclick($title,"&Next >","Button1")

	$title="IBM Notes 9.0.1 FP8 SHF216 - InstallShield Wizard"
	$text="InstallShield"
	_WinExiSetAct_AndWaitAct($title,$text)
	controlclick($title,"","Button3")
	controlclick($title,"","Button7")

	$title="IBM Notes 9.0.1 FP8 SHF216 - InstallShield Wizard"
	$text="Select Next to install FP8 SHF216"
	_WinExiSetAct_AndWaitAct($title,$text)
	controlclick($title,"","Button1")
	$title="IBM Notes 9.0.1 FP8 SHF216 - InstallShield Wizard"
	$text="Click install to proceed"
	_WinExiSetAct_AndWaitAct($title,$text)
	controlclick($title,"","Button1")

	$title="IBM Notes 9.0.1 FP8 SHF216 - InstallShield Wizard"
	$text="Show the Windows Installer log"
	_WinExiSetAct_AndWaitAct($title,$text)
	controlclick($title,"","Button1")

endif




;runwait ("","",)




;msgbox (0,"","allover")
if FileExists(@DesktopCommonDir & "\ibm notes.lnk") and (regread("HKEY_CURRENT_USER\Software\IBM\Notes\Installer","DATADIR"))=$dirdata Then
	$status1="正常"
	$status2=""
	$status3=$status3+0
else
	$status1="未成功"
	$status2=""
	$status3=$status3+1
endif
if regread($patchreg,"xpdHotfixVersion") = "FP8 SHF216" Then
	$status2="正常"
	$status3=$status3+0
Else
	$status2="未成功"
	$status3=$status3+1
endif
if $status3>0 then
	$goodluck="程序安装失败"
Else
	$goodluck="程序安装成功"
endif
$regdata=RegRead("HKEY_CURRENT_USER\Software\IBM\Notes\Installer","DATADIR")
$osversion=@OSVersion
runwait(@comspec & " /c" & "echo %computername%      %username%      " & $OSVersion & "      " & $regdata & "      " & $status1 & "      " & $status2 & ">> \\172.26.32.251\softwa\outlook2010_jp\ibmpatch.txt","",@SW_HIDE)
sleep(6000)
$Form1 = GUICreate("IBM NOTES 安装状态监测", 337, 244, 433, 386)
$GroupBox1 = GUICtrlCreateGroup($goodluck, 8, 8, 305, 185)
GUICtrlSetFont(-1, 10, 400, 0, "MS Sans Serif")
$Label1 = GUICtrlCreateLabel("程序安装状态：", 48, 66, 93, 20)
$Label2 = GUICtrlCreateLabel("补丁安装状态：", 48, 96, 93, 20)
$Label4 = GUICtrlCreateLabel("测试", 168, 96, 28, 20)
$Label3 = GUICtrlCreateLabel("测试6", 168, 66, 48, 17)
;$Label5 = GUICtrlCreateLabel("请稍等", 112, 144, 40, 20)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button1 = GUICtrlCreateButton("&OK", 26, 206, 75, 25, 0)
$Label6 = GUICtrlCreateLabel("Author:   Sun Baolu", 168, 212, 188, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)
$label3=GUICtrlCreateLabel($status1,168,66,53,19)
$label4=GUICtrlCreateLabel($status2,168,96,53,19)
$label5=GUICtrlCreateLabel("",66,135,188,19)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		case $Button1
			Exit
	EndSwitch
WEnd

Func _WinExiSetAct_AndWaitAct($WinTitle,$WinText)
	WinWait($WinTitle,$WinText)
	WinActivate($WinTitle,$WinText)
	WinWaitActive($WinTitle,$WinText)
EndFunc



































































































































































