#RequireAdmin
#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_Outfile=pcsetup.exe
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#include <MsgBoxConstants.au3>
;需要管理权限
if not IsAdmin() Then
	msgbox ("","","需要管理员权限，联络系统人员！")
	Exit
EndIf




;开始程序安装



local $ireturn7=runwait(@comspec & " /c" & "xcopy \\172.26.32.251\softwa\pcsetup\import c:\ /s /e /y")
$cteuser=@UserName
$fileexi=fileexists("\\172.26.32.251\softwa\pcsetup\" & $cteuser)
;msgbox ("","",$fileexi)
if $fileexi =1 then
	local $ireturn8=runwait(@comspec & " /c" & "copy /y \\172.26.32.251\softwa\pcsetup\" & $cteuser & "\*.* " & @desktopdir)
Else
	while fileexists("\\172.26.32.251\softwa\pcsetup\" & $cteuser)<> 1
		$cteuser=inputbox("","请输入您系统用户名！")
		;msgbox ("","",$cteuser)
		if $cteuser="" then
			$cteuser="cte123456"
		EndIf
	WEnd
    runwait(@comspec & " /c" & "copy /y \\172.26.32.251\softwa\pcsetup\" & $cteuser & "\*.* " & @desktopdir)
EndIf

local $ireturn9=run("\\172.26.32.251\softwa\pcsetup\InternationalPrimoPDF.exe")
$title="PrimoPDF Setup"
$text="This wizard will guide you through the"
_WinExiSetAct_AndWaitAct($title,$text)
;msgbox ("","","install button")
ControlClick("PrimoPDF Setup","&Next >","Button2")

$title="PrimoPDF Setup"
$text="Please review the license terms before installing"
_WinExiSetAct_AndWaitAct($title,$text)
ControlClick("PrimoPDF Setup","I &Agree","Button2")

$title="PrimoPDF Setup"
$text="Thank you for installing PrimoPDF"
_WinExiSetAct_AndWaitAct($title,$text)
ControlClick("PrimoPDF Setup","&Next >","Button2")

$title="PrimoPDF Setup"
$text="Completing the PrimoPDF"
_WinExiSetAct_AndWaitAct($title,$text)
ControlClick("PrimoPDF Setup","&Finish","Button2")







msgbox ("","","程序已经安装完成，请运行桌面程序！")
Func _WinExiSetAct_AndWaitAct($WinTitle,$WinText)
	WinWait($WinTitle,$WinText)
	WinActivate($WinTitle,$WinText)
	WinWaitActive($WinTitle,$WinText)
EndFunc

