#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=H:\Design\autoit\Domain\Admin\Migrate.kxf
$Form1 = GUICreate("Migrate", 367, 194, -1, -1)
$ButtonOk = GUICtrlCreateButton("Migrate", 134, 144, 75, 25, $BS_NOTIFY)
$ButtonCancel = GUICtrlCreateButton("Cancel", 255, 144, 75, 25, $BS_NOTIFY)
$Label1 = GUICtrlCreateLabel("计算机：", 32, 32, 52, 17)
$Label2 = GUICtrlCreateLabel("用户名：", 32, 64, 52, 17)
$Input1 = GUICtrlCreateInput("", 104, 32, 177, 21)
$Input2 = GUICtrlCreateInput("", 104, 64, 177, 21)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $ButtonOk
			Buttonok()

		Case $ButtonCancel
			Exit

	EndSwitch
WEnd

Func ButtonOk()
	$inifile9="\\172.26.32.251\softwa\pcsetup\domain\inifile\domain.ini"
	$vInput1=GUICtrlRead($Input1)
	$vInput2=GUICtrlRead($Input2)
	$Command1="admt user /n " & $vInput2 & " /sd:exas /td:cte /to:Accounts /if:yes /mgs:no >> \\172.26.32.251\softwa\pcsetup\domain\return" & "\" & $vInput2 & "_8.txt"  ;用户迁移指令
	$Command2="dsquery user -samid " & $vInput2 & " dc=cte,dc=ad,dc=local > \\172.26.32.251\softwa\pcsetup\domain\return" & "\" & $vInput2 & "_9.txt"                  ;用户查询指令
	$Command3="dsquery user -limit 0 ou=Accounts,dc=cte,dc=ad,dc=local | dsmod user -mustchpwd no > \\172.26.32.251\softwa\pcsetup\domain\inifile\mustchpwd.txt"    ;取消变更密码指令

	if $vInput1="" or $vInput2="" Then
		msgbox ("","","请把信息填写完整")
		Return
	EndIf
	$Search=IniRead($inifile9,$vInput1,"User","")
	if $vInput2 <> $Search Then
		msgbox ("","","不存在输入信息")
	Else
		RunWait(@ComSpec & " /c " & $Command1,"",@SW_HIDE )
		sleep(1000)
		RunWait(@ComSpec & " /c " & $Command2,"",@SW_HIDE )
		If FileGetSize("\\172.26.32.251\softwa\pcsetup\domain\return" & "\" & $vInput2 & "_9.txt") > 30 Then
			IniWrite($Inifile9,$vInput1,"Complete","3")
			IniWrite($Inifile9,$vInput1,"Date",@YEAR&"."&@MON&"."&@MDAY&" " &@HOUR&":"&@MIN&":"&@SEC)
			IniWrite($Inifile9,$vInput1,"Migrate","Normal")
		Else
			IniWrite($Inifile9,$vInput1,"Migrate","False")
		EndIf
		RunWait(@ComSpec & " /c " & $Command3,"",@SW_HIDE)
	EndIf
EndFunc























































































