#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\MyAutoIt3_Green.ico
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#Region ### START Koda GUI section ### Form=H:\autoit\安全更新安装\测试文件夹权限\security.kxf
$Form1 = GUICreate("About", 280, 134, -1, -1)
$DirectoryEdit = GUICtrlCreateInput("", 8, 32, 233, 21, $GUI_SS_DEFAULT_INPUT)
$ButtonSetup = GUICtrlCreateButton("Setup", 102, 96, 75, 25, $BS_NOTIFY)
$ButtonCancel = GUICtrlCreateButton("&Cancel", 183, 96, 75, 25, $BS_NOTIFY)
$DirectoryLabel = GUICtrlCreateLabel("当前设置目录", 8, 12, 76, 17, 0)
GUICtrlSetColor(-1, 0x000080)
$SettingsLable = GUICtrlCreateLabel("", 88, 72, 99, 17)
GUICtrlSetColor(-1, 0xFF0000)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###










While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $ButtonCancel
			Exit
        Case $ButtonSetup
			; 创建一个局部恒定变量, 存储 FileSelectFolder() 的显示信息文本.
			;Local Const $sMessage = "选择文件夹"
			; 显示选择文件的"打开文件对话框".
			Local $sFileSelectFolder = FileSelectFolder("选择文件夹", "")
			If @error Then
				; 显示发生错误消息.
				MsgBox($MB_SYSTEMMODAL, "", "没有选择任何文件夹.")
			Else
		        ;显示选择的文件夹.
				;MsgBox($MB_SYSTEMMODAL, "", "您选择以下文件夹:" & @CRLF & $sFileSelectFolder)
				if stringright($sFileSelectFolder,1)="\" then
					$sFileSelectFolder=StringLeft($sFileSelectFolder,stringlen($sFileSelectFolder)-1)
				EndIf
				GUICtrlSetData($DirectoryEdit,$sFileSelectFolder)
				guictrlsetdata($settingslable,"设置中请稍后...")
				$DosCommand="icacls """ & $sFileSelectFolder & """ /t /c /grant exas\" & @username & ":F "
				;msgbox ($MB_SYSTEMMODAL,"",$DosCommand)
				Local $iReturn = RunAsWait ("administrator",@ComputerName,"cte.sys.admin", $RUN_LOGON_NOPROFILE, @ComSpec & " /c " & $DosCommand, "", @SW_MAXIMIZE)
				guictrlsetdata($settingslable,"文件权限设置完成")
				;msgbox($MB_SYSTEMMODAL,"","文件权限设置完成")
			EndIf




























	EndSwitch
WEnd

































































































































