

































































#include <Security.au3>
Local $aArrayOfData = _Security__LookupAccountSid("S-1-5-32-544")
; 如果没有发生错误则显示返回的数据
If IsArray($aArrayOfData) Then
	$AdminGroup=$aArrayOfData[0]
	$CommandSearch="net localgroup " & $AdminGroup & " | find /i ""GCTEADM"" > " & @TempDir & "\right.txt"
	RunWait(@ComSpec & " /c " & $CommandSearch,"",@SW_HIDE)
	if FileGetSize(@TempDir & "\right.txt")>10 Then

	Else
		msgbox ("","","错误：权限设置问题，请联系企画课！")
	EndIf
EndIf





