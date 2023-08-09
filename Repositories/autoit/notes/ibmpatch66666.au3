; *** AutoIt3Wrapper 添加常量包含文件 -- 开始 ***
#include <AutoItConstants.au3>
#include <WinAPIConstants.au3>
; *** AutoIt3Wrapper 添加常量包含文件 -- 结束 ***
#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\au3script_v10.ico
#AutoIt3Wrapper_Outfile=config.exe
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_requestedExecutionLevel=requireAdministrator
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
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Form1",  388, 125, 826, 836, $WS_POPUP, BitOR($WS_EX_TOOLWINDOW,$WS_EX_LAYERED,$WS_EX_TOPMOST))
;设置GUI背景颜色
GUISetBkColor(0xABCDEF)

$Label1 = GUICtrlCreateLabel("请稍等", 89, 48, 147,60)
GUICtrlSetFont(-1, 28, 800, 0, "Microsoft YaHei UI")
GUICtrlSetColor(-1, 0x000080)
$Label2 = GUICtrlCreateLabel("当前任务(1/3):", 16, 16, 143, 28)
GUICtrlSetFont(-1, 13, 800, 0, "Microsoft YaHei UI")
GUICtrlSetColor(-1, 0x000080)
$Label3 = GUICtrlCreateLabel("加载程序", 168, 16, 138, 28)
GUICtrlSetFont(-1, 13, 800, 0, "Microsoft YaHei UI Light")
GUICtrlSetColor(-1, 0x000080)
$Label6 = GUICtrlCreateLabel("Author: SunBaolu", 103, 99, 101, 22)
GUICtrlSetFont(-1, 8, 800, 0, "Microsoft YaHei UI")
GUICtrlSetColor(-1, 0x000080)
GUISetState(@SW_SHOW)
_API_SetLayeredWindowAttributes($Form1, 0xABCDEF)
;msgbox (0,"","window")
GUISetState(@SW_SHOW)
;guictrlsetdata($label3,"hello world!")
;msgbox (0,"","window1")
;$label1=GUICtrlCreateLabel("请稍等", 168, 56, 36, 17)
#EndRegion ### END Koda GUI section ###

; ******************  环境变量设置   *******************
; *                                                  *
; *        1. 判断是否安装notes,否则执行程序安装          *
; *        2. 设置变量参数                             *
; *                                                  *
; ****************************************************
; perform 1
$aArray = DriveGetDrive($DT_FIXED)
For $i = 1 To $aArray[0]
	if StringUpper ($aArray[$i])>"H:" then
		ExitLoop
	EndIf
	$dirins=StringUpper($aArray[$i])&"\LOTUS\"
	$dirdata=$dirins & "data\"
Next

if FileExists(@DesktopCommonDir & "\ibm notes.lnk") and (regread("HKEY_CURRENT_USER\Software\IBM\Notes\Installer","DATADIR"))=$dirdata Then
	$status1=1
Else
	$status1=0
endif

if @osarch = "x86" then
	;msgbox (0,"","x86")
	$patchreg="HKEY_LOCAL_MACHINE\SOFTWARE\IBM\Lotus\Expeditor\{5BA7CD07-4D6C-4D16-B1A6-2B50DD5F17AD}"
else
	;msgbox (0,"","x64")
	$patchreg="HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\IBM\Lotus\Expeditor\{5BA7CD07-4D6C-4D16-B1A6-2B50DD5F17AD}"
endif
if regread($patchreg,"xpdHotfixVersion") = "FP8 SHF216" Then
	$status2=2
Else
	$status2=0
endif
if $status1+$status2<3 then
	msgbox (0+202144,"","Status:" & $status1+$status2 & " IBM Notes安装问题请再安装！")
	Exit
endif


TCPStartup()
$sIPAddress = TCPNameToIP("ntstj01")
If @error Then
	msgbox (0+202144,"","网络访问问题，请联系管理员！" )
	Exit

Else
	TCPShutdown()
EndIf




; perform 2
;$dirdata                             ibm notes 安装路径变量
$username=@UserName                  ;登陆用户名
$inifile="\\172.26.32.251\softwa\notes\userid\import.ini"                                   ;ini 文件路径设置
$idfile=iniread ($inifile,$username,"IDFILE","")                        ;id复制文件名
$idsoupath=iniread($inifile,$username,"IDSOUPATH","")                   ;id文件源路径
$iddespath=regread("HKEY_CURRENT_USER\Software\IBM\Notes\Installer","PROGDIR")                                              ;id文件目标路径
$userpasswd=iniread($inifile,$username,"USERPASSWD","")			        ;用户默认密码
$notesnames=iniread($inifile,$username,"NOTESNAMES","")                 ;ibm notes 设置用户名
$notesserver=iniread($inifile,$username,"NOTESSERVER","")               ;ibm notes 服务器名称
$desktoplnk=@DesktopCommonDir & "\ibm notes.lnk"      ;notes桌面快捷方式
$notesini=$iddespath & "notes.ini"                                      ;notes.ini 文件存储位置
iniwrite($notesini,"Notes","SINGLE_LOGON_INSTALLED_TURNOFF","1")
;msgbox (0,"",$userpasswd)
Sleep(3000)

; *****************   文件复制操作     *****************
; *                                                  *
; *        1.  Local 本地文件夹建立                    *
; *        2. 判断用户文件存在，否则复制文件              *
; *                                                  *
; ****************************************************
$Label2 = GUICtrlCreateLabel("当前任务(2/3):",  16, 16, 143, 28)
GUICtrlSetFont(-1, 13, 800, 0, "Microsoft YaHei UI")
GUICtrlSetColor(-1, 0x000080)
$Label3 = GUICtrlCreateLabel("ID 文件复制中...", 168, 16, 138, 28)
GUICtrlSetFont(-1, 13, 800, 0, "Microsoft YaHei UI Light")
GUICtrlSetColor(-1, 0x000080)
;perform 1
dircreate($iddespath & "data\local")
;if fileexists($destination & "\" & $filename) then

;endif

;perform 2
filecopy($idsoupath & "\" & $idfile ,$iddespath & "data\")
Sleep(3000)

; *****************   程序相关设置     *****************
; *                                                  *
; *        1. IBM Notes                              *
; *        2. 输入用户名及服务器                        *
; *        3. ID 文件选择导入                          *
; *                                                  *
; *                                                  *
; *                                                  *
; ****************************************************

$Label2 = GUICtrlCreateLabel("当前任务(3/3):",  16, 16, 143, 28)
GUICtrlSetFont(-1, 13, 800, 0, "Microsoft YaHei UI")
GUICtrlSetColor(-1, 0x000080)
$Label3 = GUICtrlCreateLabel("IBM Notes用户信息设置",  168, 16, 198, 28)
GUICtrlSetFont(-1, 13, 800, 0, "Microsoft YaHei UI Light")
GUICtrlSetColor(-1, 0x000080)
;perform1
$iRc =shellexecute($desktoplnk)
if $iRc=0 Then
	msgbox (0+202144,"","IBM Notes 程序不能打开，请联系管理员！")
	Exit
endif

;perform2
$title="IBM Notes Social Edition Client Configuration"
$text="Welcome"
_WinExiSetAct_AndWaitAct($title,$text)
controlclick($title,"","IRIS.bmpbutton1")
;controlclick($title,"","Button7")
$title="IBM Notes Social Edition Client Configuration"
$text="User Information"
_WinExiSetAct_AndWaitAct($title,$text)
ControlSetText( "", "", "Edit2", $notesnames,0)
ControlSetText( "", "", "Edit3", $notesserver,0)
controlclick($title,"","IRIS.bmpbutton1")
;perform3
$title="IBM Notes Social Edition Client Configuration"
$text="Notes ID File"
_WinExiSetAct_AndWaitAct($title,$text)
ControlSetText( "", "", "Edit1", $iddespath & "data\" & $idfile,0)
controlclick($title,"","IRIS.bmpbutton1")
$title="IBM Notes"
$text="Password"
_WinExiSetAct_AndWaitAct($title,$text)
ControlSetText( "", "", "IRIS.password1", $userpasswd)
controlclick($title,"","Button1")
$title="IBM Notes Social Edition Client Configuration"
$text="Additional Services"
_WinExiSetAct_AndWaitAct($title,$text)
msgbox (0+262144,"","完成配置程序，稍后进入邮件！" )
controlclick($title,"","IRIS.bmpbutton1")
Sleep(3000)



ShellExecute ("\\172.26.32.251\softwa\notes\setting.exe")




























guidelete($Form1)
;msgbox(0,"","windows2")







;激活窗口操作
Func _WinExiSetAct_AndWaitAct($WinTitle,$WinText)
	$RC6=WinWait($WinTitle,$WinText,66)
	if $RC6=0 then
		msgbox(0+202144,"","窗口加载出错，请联系管理员！")
		Exit
	EndIf
	WinActivate($WinTitle,$WinText)
	$RC7=WinWaitActive($WinTitle,$WinText,66)
	if $RC7=0 then
		msgbox(0+202144,"","窗口加载出错，请联系管理员！")
		Exit
	EndIf
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






























































