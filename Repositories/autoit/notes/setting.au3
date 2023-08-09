; *** AutoIt3Wrapper 添加常量包含文件 -- 开始 ***
#include <WinAPIConstants.au3>
; *** AutoIt3Wrapper 添加常量包含文件 -- 结束 ***
#RequireAdmin
#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\au3script_v10.ico
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Add_Constants=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <Process.au3>
#include <GuiListBox.au3>
#include <GuiButton.au3>
#include <GuiImageList.au3>



#cs
$Form1 = GUICreate("Form1",  388, 125, 826, 836, $WS_POPUP, BitOR($WS_EX_TOOLWINDOW,$WS_EX_LAYERED,$WS_EX_TOPMOST))
;设置GUI背景颜色
GUISetBkColor(0xABCDEF)

$Label1 = GUICtrlCreateLabel("请稍等", 89, 48, 147,60)
GUICtrlSetFont(-1, 28, 800, 0, "Microsoft YaHei UI")
GUICtrlSetColor(-1, 0x000080)
$Label2 = GUICtrlCreateLabel("当前任务(1/5):", 16, 16, 143, 28)
GUICtrlSetFont(-1, 13, 800, 0, "Microsoft YaHei UI")
GUICtrlSetColor(-1, 0x000080)
$Label3 = GUICtrlCreateLabel("设置主页", 168, 16, 138, 28)
GUICtrlSetFont(-1, 13, 800, 0, "Microsoft YaHei UI Light")
GUICtrlSetColor(-1, 0x000080)
$Label6 = GUICtrlCreateLabel("Author: SunBaolu", 103, 99, 101, 22)
GUICtrlSetFont(-1, 8, 800, 0, "Microsoft YaHei UI")
GUICtrlSetColor(-1, 0x000080)
GUISetState(@SW_SHOW)
_API_SetLayeredWindowAttributes($Form1, 0xABCDEF)
;msgbox (0,"","window")
GUISetState(@SW_SHOW)

#ce

;perform1
$title="Discover - IBM Notes"
$text="Search Yahoo!"
_WinExiSetAct_AndWaitAct($title,"")
controlclick($title,"","SWT_Window03")
$irc=blockinput(1)
send("{DOWN 7}{right}{APPSKEY}")
sleep(900)
send("{h}")
sleep(900)
blockinput(0)
sleep(900)
$title6="Set Home Page"
$text6="Workspace' as current Home Page"
;_WinExiSetAct_AndWaitAct($title6,"")
controlclick($title6,"","Button1")

#cs
;perform2
;$Label2 = GUICtrlCreateLabel("当前任务(2/5):",  16, 16, 143, 28)
;GUICtrlSetFont(-1, 13, 800, 0, "Microsoft YaHei UI")
;GUICtrlSetColor(-1, 0x000080)
;$Label3 = GUICtrlCreateLabel("选项设置", 168, 16, 138, 28)
;GUICtrlSetFont(-1, 13, 800, 0, "Microsoft YaHei UI Light")
;GUICtrlSetColor(-1, 0x000080)
$title="Workspace - IBM Notes"
$text="Workspace"
_WinExiSetAct_AndWaitAct($title,"")
$irc=blockinput(1)
sleep(900)
send("!f")
sleep(900)
send("f")
sleep(900)
blockinput(0)
sleep(900)
$title="Preferences"
$text="Workspace"
_WinExiSetAct_AndWaitAct($title,"")
ControlTreeView($title,"","SysTreeView321","Select","#1")
sleep(1500)
$hwnd6=ControlGetHandle($title,"","ListBox4")
_GUICtrlListBox_SetCaretIndex($hwnd6,"16")
if _GUICtrlListBox_GetSel($hwnd6,"16")=false Then
	_GUICtrlListBox_ClickItem($hwnd6,16,"left",True)
EndIf
;msgbox (0,"",$title)

sleep(1000)


ControlTreeView($title,"","SysTreeView321","Select","#11")
$title="Preferences"
$text="Compress network data"
_WinExiSetAct_AndWaitAct($title,$text)
sleep(1500)
if ControlCommand($title,"","Button18","IsChecked")="" then
	ControlCommand($title,"","Button18","Check")
endif

if ControlCommand($title,"","Button19","IsChecked")="" then
	ControlCommand($title,"","Button19","Check")
endif

if ControlCommand($title,"","Button20","IsChecked")="" then
	ControlCommand($title,"","Button20","Check")
endif

if ControlCommand($title,"","Button21","IsChecked")="" then
	ControlCommand($title,"","Button21","Check")
endif


if ControlCommand($title,"","Button22","IsChecked")="" then
	ControlCommand($title,"","Button22","Check")
endif

if ControlCommand($title,"","Button23","IsChecked")="" then
	ControlCommand($title,"","Button23","Check")
endif
sleep(1000)

ControlTreeView($title,"","SysTreeView321","Select","#6")
$title="Preferences"
$text="Change your operating system settings"
_WinExiSetAct_AndWaitAct($title,$text)
sleep(1500)
$hwnd7=ControlGetHandle($title,"","Button100")
controlclick($title,"","Button100")
$irc=blockinput(1)
sleep(1500)
send("{home}{down}{space}")
sleep(1500)
send("{enter}")
blockinput(0)

sleep(1000)
ControlTreeView($title,"","SysTreeView321","Select","#4")
$title="Preferences"
$text="Format"
_WinExiSetAct_AndWaitAct($title,$text)
$hwnd8=ControlGetHandle($title,"","NotesRichText1")
_GUICtrlListBox_SetCaretIndex($hwnd8,"2")
#ce














































;激活窗口操作
Func _WinExiSetAct_AndWaitAct($WinTitle,$WinText)
	$RC6=WinWait($WinTitle,$WinText,66)
	if $RC6=0 then
		msgbox(0+202144,"","窗口加载出错，请联系管理员！")
		Exit
	EndIf
	WinActivate($WinTitle,$WinText)
	$RC7=WinWaitActive($WinTitle,$WinText)
	;if $RC7=0 then
	;	msgbox(0+202144,"","窗口加载出错，请联系管理员！")
	;	Exit
	;EndIf
EndFunc
;文字颜色设置
Func _API_SetLayeredWindowAttributes($hwnd, $i_transcolor, $Transparency = 255, $isColorRef = False)
	Local Const $AC_SRC_ALPHA = 1
	Local Const $ULW_ALPHA = 2
	Local Const $LWA_ALPHA = 0x2
	Local Const $LWA_COLORKEY = 0x1
	If Not $isColorRef Then
		$i_transcolor = Hex(String($i_transcolor), 6)
		$i_transcolor = Execute('0x00' & StringMid($i_transcolor, 5, 2) & StringMid($i_transcolor, 3, 2) & StringMid($i_transcolor, 1, 2))
	EndIf
	Local $Ret = DllCall("user32.dll", "int", "SetLayeredWindowAttributes", "hwnd", $hwnd, "long", $i_transcolor, "byte", $Transparency, "long", $LWA_COLORKEY + $LWA_ALPHA)
	Select
		Case @error
			Return SetError(@error, 0, 0)
		Case $Ret[0] = 0
			Return SetError(4, 0, 0)
		Case Else
			Return 1
	EndSelect
EndFunc   ;==>_API_SetLayeredWindowAttributes



























