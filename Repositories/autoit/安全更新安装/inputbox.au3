$billid=inputbox("����","�����ӡ�����ţ�","",190,200)
if $billid = 0 then
	msgbox (0,"��ʾ","���뿨�Ų��ɹ�")

Else
	msgbox (0,"���뷵��ֵΪ��",$billid)


	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(����) FX ApeosPort-V C3373 T2\PrinterDriverData\UserInfo","SpecifyJobOwnerName_User","REG_SZ","EnterName")
	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(����) FX ApeosPort-V C3373 T2\PrinterDriverData\UserInfo","JobOwnerName_user","REG_SZ",$billid)
	;RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(����) FX ApeosPort-V C3373 T2\PrinterDriverData\UserInfo","JobOwnerNamePassword_popup","REG_SZ","")
	;RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(����) FX ApeosPort-V C3373 T2\PrinterDriverData\UserInfo","JobOwnerNamePassword_User","REG_SZ","")
	;RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(����) FX ApeosPort-V C3373 T2\PrinterDriverData\UserInfo","AccountSpecify","REG_SZ","JobOwner")
    ;RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(����) FX ApeosPort-V C3373 T2\PrinterDriverData\UserInfo","BillingID_User","REG_SZ",$billid)
	;HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(����) FX ApeosPort-V C3373 T2\PrinterDriverData\UserInfo








EndIf




