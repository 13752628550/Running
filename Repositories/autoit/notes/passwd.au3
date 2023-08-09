#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\au3script_v10.ico
#AutoIt3Wrapper_Outfile=passwd.exe
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****

;#AutoIt3Wrapper_Res_requestedExecutionLevel=requireAdministrator *** AutoIt3Wrapper 添加常量包含文件 -- 开始 ***
#include <AutoItConstants.au3>
#include <WinAPIConstants.au3>
; *** AutoIt3Wrapper 添加常量包含文件 -- 结束 ***
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <Process.au3>
#Region ### START Koda GUI section ### Form=


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
;$notesini=$iddespath & "notes.ini"                                      ;notes.ini 文件存储位置
;iniwrite($notesini,"Notes","SINGLE_LOGON_INSTALLED_TURNOFF","1")
;msgbox (0,"",$userpasswd)
Sleep(3000)

; *****************   文件复制操作     *****************
; *                                                  *
; *        1.  Local 本地文件夹建立                    *
; *        2. 判断用户文件存在，否则复制文件              *
; *                                                  *
; ****************************************************

$result6=msgbox($MB_OKCANCEL,"密码","是否初始化Notes密码")
;msgbox (0,"",$result6)
if $result6=1 then
filecopy($idsoupath & "\" & $idfile ,$iddespath & "data\",$FC_OVERWRITE )
Sleep(3000)
	msgbox (0,"完成","密码初始完成，默认登陆密码： " & $userpasswd)
EndIf































































