































































#include <MsgBoxConstants.au3>

 Local $sIPAddress = TCPNameToIP("ntstj01")
If @error Then
	MsgBox($MB_SYSTEMMODAL, "", "错误代码: " & @error)

Else
	; 显示 IP 地址.
	MsgBox($MB_SYSTEMMODAL, "", "域名的 IP 地址 :" & $sIPAddress)
EndIf
