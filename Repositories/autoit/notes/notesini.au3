$username=@UserName                  ;��½�û���
$inifile="\\172.26.32.251\softwa\notes\userid\import.ini"                                   ;ini �ļ�·������
$idfile=iniread ($inifile,$username,"IDFILE","")                        ;id�����ļ���
$idsoupath=iniread($inifile,$username,"IDSOUPATH","")                   ;id�ļ�Դ·��
$iddespath=regread("HKEY_CURRENT_USER\Software\IBM\Notes\Installer","PROGDIR")                                              ;id�ļ�Ŀ��·��
$userpasswd=iniread($inifile,$username,"USERPASSWD","")			        ;�û�Ĭ������
$notesnames=iniread($inifile,$username,"NOTESNAMES","")                 ;ibm notes �����û���
$notesserver=iniread($inifile,$username,"NOTESSERVER","")               ;ibm notes ����������
$desktoplnk=@DesktopCommonDir & "\ibm notes.lnk"      ;notes�����ݷ�ʽ
$notesini=$iddespath & "notes.ini"
;msgbox (0,"",$userpasswd)
Sleep(3000)
iniwrite($notesini,"Notes","SINGLE_LOGON_INSTALLED_TURNOFF","1")