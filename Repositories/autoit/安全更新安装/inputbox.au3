$billid=inputbox("输入","输入打印机卡号：","",190,200)
if $billid = 0 then
	msgbox (0,"提示","输入卡号不成功")

Else
	msgbox (0,"输入返回值为：",$billid)


	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(管理部) FX ApeosPort-V C3373 T2\PrinterDriverData\UserInfo","SpecifyJobOwnerName_User","REG_SZ","EnterName")
	RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(管理部) FX ApeosPort-V C3373 T2\PrinterDriverData\UserInfo","JobOwnerName_user","REG_SZ",$billid)
	;RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(管理部) FX ApeosPort-V C3373 T2\PrinterDriverData\UserInfo","JobOwnerNamePassword_popup","REG_SZ","")
	;RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(管理部) FX ApeosPort-V C3373 T2\PrinterDriverData\UserInfo","JobOwnerNamePassword_User","REG_SZ","")
	;RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(管理部) FX ApeosPort-V C3373 T2\PrinterDriverData\UserInfo","AccountSpecify","REG_SZ","JobOwner")
    ;RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(管理部) FX ApeosPort-V C3373 T2\PrinterDriverData\UserInfo","BillingID_User","REG_SZ",$billid)
	;HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(管理部) FX ApeosPort-V C3373 T2\PrinterDriverData\UserInfo








EndIf




