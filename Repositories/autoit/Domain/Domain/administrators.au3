

































































#include <Security.au3>
Local $aArrayOfData = _Security__LookupAccountSid("S-1-5-32-544")
; ���û�з�����������ʾ���ص�����
If IsArray($aArrayOfData) Then
	$AdminGroup=$aArrayOfData[0]
	$CommandSearch="net localgroup " & $AdminGroup & " | find /i ""GCTEADM"" > " & @TempDir & "\right.txt"
	RunWait(@ComSpec & " /c " & $CommandSearch,"",@SW_HIDE)
	if FileGetSize(@TempDir & "\right.txt")>10 Then

	Else
		msgbox ("","","����Ȩ���������⣬����ϵ�󻭿Σ�")
	EndIf
EndIf





