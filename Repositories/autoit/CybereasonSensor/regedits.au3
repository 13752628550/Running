;For $i= 1 to 1000
;    $var = RegEnumKey("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall", $i)
;    If @error <> 0 then ExitLoop
;    MsgBox(4096, "SubKey #" & $i & " under HKLM\Software: ", $var)
;Next
runwait(@comspec & " /c" & "reg export HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall %temp%\hotfix.reg /y","",@SW_HIDE)
$hotfix=fileread(@tempdir & "\hotfix.reg")

if stringinstr($hotfix,"2526086")="0" then
	msgbox (0,"��ʾ","��ǰϵͳûװ Office SP3 ����, ���ȷ����ʼ��װ")
	runwait(@comspec & " /c" & "\\172.26.32.251\softwa\hotfix\office2007sp3.exe /passive /norestart")
EndIf
if stringinstr($hotfix,"2596754")="0" then
	msgbox (0,"��ʾ","��ǰϵͳûװ KB2596754 ����, ���ȷ����ʼ��װ")
	runwait(@comspec & " /c" & "\\172.26.32.251\softwa\hotfix\kb2596754.exe /passive /norestart")
EndIf
if stringinstr($hotfix,"2825644")="0" Then
	msgbox (0,"��ʾ","��ǰϵͳûװ KB2825644 ����, ���ȷ����ʼ��װ")
	runwait(@comspec & " /c" & "\\172.26.32.251\softwa\hotfix\kb2825644 /passive /norestart")
endif



































































