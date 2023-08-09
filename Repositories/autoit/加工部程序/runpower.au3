#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\MyAutoIt3_Blue.ico
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#include <AutoItConstants.au3>
#include <WinAPIShellEx.au3>
#include <Process.au3>
$g_szVersion = "userinfo"
If WinExists($g_szVersion) Then Exit
AutoItWinSetTitle($g_szVersion)
hotkeyset("!h","_exiwhile")





















$pptfile="c:\クレーム0継続日数-6.pptm"
$WinTitle6="Microsoft PowerPoint - [クレーム0継続日数-6]"
$WinTitle7="PowerPoint 幻灯片放映 - [クレーム0継続日数-6]"
$WebIcon=@DesktopDir & "\设备每日工作显示.URL"
$webTitle="成型机运行状态 - Mozilla Firefox"
$CheckProgram=1
if fileexists($WebIcon) = 0 then
	msgbox (0,"","web file is not found")
	Exit
endif
if WinExists($webTitle) = 0 Then

		ShellExecute($WebIcon)
		;msgbox (0,"","progress is not found")
		WinWait($webTitle)
	endif



if fileexists($pptfile) = 0 then
	msgbox (0,"","ppt file is not found")
	Exit
endif

if WinExists($WinTitle6) = 0 Then

		ShellExecute($pptfile)
		;msgbox (0,"","progress is not found")
		WinWait($WinTitle6)
	endif
    if winexists($WinTitle7) = 0  Then
		;msgbox (0,"","progress8 is not found")
		winactivate($WinTitle6)
		winwait($WinTitle6)
		send("{F5}")
	EndIf


while 1



	if $CheckProgram =1 then
		if WinExists($WinTitle6) = 0 Then
			ShellExecute($pptfile)
			WinWait($WinTitle6)
		endif
		if winexists($WinTitle7) = 0  Then
			winactivate($WinTitle6)
			winwait($WinTitle6)
			send("{F5}")
		EndIf

		WinWait($WinTitle7)
		winactivate($wintitle7)
		$CheckProgram=0
	Else
		if WinExists($webTitle) = 0 Then
			ShellExecute($WebIcon)
			winactivate($webTitle)
			WinWait($webTitle)
		endif
			winactivate($webTitle)
			WinWait($webTitle)
			$CheckProgram=1
	EndIf

	sleep(60000)
	;_showrun()
wend




func _exiwhile()
	Exit
EndFunc

Func _WinExiSetAct_AndWaitAct($WinTitle,$WinText)
	WinWait($WinTitle,$WinText)
	WinActivate($WinTitle,$WinText)
	WinWaitActive($WinTitle,$WinText)
EndFunc