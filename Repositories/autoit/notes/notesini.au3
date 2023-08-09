$username=@UserName                  ;登陆用户名
$inifile="\\172.26.32.251\softwa\notes\userid\import.ini"                                   ;ini 文件路径设置
$idfile=iniread ($inifile,$username,"IDFILE","")                        ;id复制文件名
$idsoupath=iniread($inifile,$username,"IDSOUPATH","")                   ;id文件源路径
$iddespath=regread("HKEY_CURRENT_USER\Software\IBM\Notes\Installer","PROGDIR")                                              ;id文件目标路径
$userpasswd=iniread($inifile,$username,"USERPASSWD","")			        ;用户默认密码
$notesnames=iniread($inifile,$username,"NOTESNAMES","")                 ;ibm notes 设置用户名
$notesserver=iniread($inifile,$username,"NOTESSERVER","")               ;ibm notes 服务器名称
$desktoplnk=@DesktopCommonDir & "\ibm notes.lnk"      ;notes桌面快捷方式
$notesini=$iddespath & "notes.ini"
;msgbox (0,"",$userpasswd)
Sleep(3000)
iniwrite($notesini,"Notes","SINGLE_LOGON_INSTALLED_TURNOFF","1")