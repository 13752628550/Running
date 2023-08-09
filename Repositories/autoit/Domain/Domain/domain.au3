 #Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\au3script_v10.ico
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>



#Region ### START Koda GUI section ### Form=O:\Domain\MainForm.kxf
$Form1 = GUICreate("domain", 364, 197, -1, -1)
$ButtonOk = GUICtrlCreateButton("&Start", 190, 160, 75, 25, $BS_NOTIFY)
$ButtonCancel = GUICtrlCreateButton("&Cancel", 271, 160, 75, 25, $BS_NOTIFY)
$Group1 = GUICtrlCreateGroup("当前设置明细", 16, 8, 329, 145)
$Label1 = GUICtrlCreateLabel("计算机：", 32, 56, 56, 17)
$Label2 = GUICtrlCreateLabel("用户名：", 32, 80, 56, 17)
$Label3 = GUICtrlCreateLabel("识别码：", 32, 104, 56, 17)
$Label5 = GUICtrlCreateLabel("Label5", 104, 56, 189, 17)
$Label6 = GUICtrlCreateLabel("Label6", 104, 80, 189, 17)
$Label7 = GUICtrlCreateLabel("Label7", 104, 104, 189, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Label4 = GUICtrlCreateLabel("1", 33, 33, 67, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

hotkeyset("!h","exitform")
$Inifile7="\\172.26.32.251\softwa\pcsetup\domain\inifile\domain.ini"       	;用户配置文件
$Inifile8="\\172.26.32.251\softwa\pcsetup\domain\inifile\domain_bk.ini"    	;查询配置文件
$Computer=""        														;计算机名称
$User=""																	;识别用户名
$Complete=""																;用户识别码  1: 创建计算机    2：计算机移动完成     3： 用户移动完成
$Command1="admt user /n " & $User & " /sd:exas /td:cte /to:Accounts /if:yes /mgs:no >> \\172.26.32.251\softwa\pcsetup\domain\return" & "\" & $User & "_8.txt"  ;用户迁移指令
$Command2="dsquery user -samid " & $User & " dc=cte,dc=ad,dc=local > \\172.26.32.251\softwa\pcsetup\domain\return" & "\" & $User & "_9.txt"                  ;用户查询指令
$Command3="dsquery user -limit 0 ou=Accounts,dc=cte,dc=ad,dc=local | dsmod user -mustchpwd no > \\172.26.32.251\softwa\pcsetup\domain\inifile\mustchpwd.txt"    ;取消变更密码指令
$iCount=""

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $ButtonOk
			ButtonOk()
		Case $ButtonCancel
			Exit
	EndSwitch
WEnd

Func ButtonOk()
	$iCount=1
	While 1
		;iCount
		GUICtrlSetData($Label4,$iCount)
		FileCopy($Inifile7,$Inifile8,$FC_OVERWRITE)
		Local $iniArray = IniReadSectionNames($Inifile8)
		For $i = 1 To $iniArray[0]
			$Complete=IniRead($Inifile8,$iniArray[$i],"Complete","")
			if $Complete="2" Then
				$Computer=$iniArray[$i]
				$User=IniRead($Inifile8,$iniArray[$i],"User","")
				$Command1="admt user /n " & $User & " /sd:exas /td:cte /to:Accounts /if:yes /mgs:no >> \\172.26.32.251\softwa\pcsetup\domain\return" & "\" & $User & "_8.txt"  ;用户迁移指令
				$Command2="dsquery user -samid " & $User & " dc=cte,dc=ad,dc=local > \\172.26.32.251\softwa\pcsetup\domain\return" & "\" & $User & "_9.txt"                  ;用户查询指令
				$Command3="dsquery user -limit 0 ou=Accounts,dc=cte,dc=ad,dc=local | dsmod user -mustchpwd no > \\172.26.32.251\softwa\pcsetup\domain\inifile\mustchpwd.txt"    ;取消变更密码指令
				GUICtrlSetData($Label5,$Computer)
				GUICtrlSetData($label6,$User)
				GUICtrlSetData($label7,$Complete)
				RunWait(@ComSpec & " /c " & $Command1,"",@SW_HIDE )
				sleep(1000)
				RunWait(@ComSpec & " /c " & $Command2,"",@SW_HIDE )
				If FileGetSize("\\172.26.32.251\softwa\pcsetup\domain\return" & "\" & $User & "_9.txt") > 30 Then
					IniWrite($Inifile7,$Computer,"Complete","3")
					IniWrite($Inifile8,$Computer,"Complete","3")
					IniWrite($Inifile7,$Computer,"Date",@YEAR&"."&@MON&"."&@MDAY&" " &@HOUR&":"&@MIN&":"&@SEC)
					IniWrite($Inifile8,$Computer,"Date",@YEAR&"."&@MON&"."&@MDAY&" " &@HOUR&":"&@MIN&":"&@SEC)
					IniWrite($Inifile7,$Computer,"Migrate","Normal")
					IniWrite($Inifile8,$Computer,"Migrate","Normal")
				Else
					IniWrite($Inifile7,$Computer,"Migrate","False")
					IniWrite($Inifile8,$Computer,"Migrate","False")
				EndIf
				GUICtrlSetData($Label5,"")
				GUICtrlSetData($label6,"")
				GUICtrlSetData($label7,"")
			EndIf
		Next
		RunWait(@ComSpec & " /c " & $Command3,"",@SW_HIDE)
		$iCount=$iCount+1
		Sleep(689)
	WEnd
EndFunc

Func exitform()

	Exit
EndFunc




































