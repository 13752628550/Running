































































#include <MsgBoxConstants.au3>

 Local $sIPAddress = TCPNameToIP("ntstj01")
If @error Then
	MsgBox($MB_SYSTEMMODAL, "", "�������: " & @error)

Else
	; ��ʾ IP ��ַ.
	MsgBox($MB_SYSTEMMODAL, "", "������ IP ��ַ :" & $sIPAddress)
EndIf
