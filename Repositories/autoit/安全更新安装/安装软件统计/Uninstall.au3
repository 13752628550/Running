#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Version=Beta
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\au3script_v10.ico
#AutoIt3Wrapper_outfile=uninstall.exe
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_Language=2052
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#Region ;**** 编译指令由 by AutoIt3Wrapper_GUI 创建 ****
#EndRegion ;**** 编译指令由 by AutoIt3Wrapper_GUI 创建 ****
#Region ;**** 编译指令由 by AutoIt3Wrapper_GUI 创建 ****
#EndRegion ;**** 编译指令由 by AutoIt3Wrapper_GUI 创建 ****
#Region ;**** 缂栬瘧鎸囦护鐢?AutoIt3Wrapper 閫夐」缂栬瘧绐楀彛鍒涘缓 ****
#EndRegion ;**** 缂栬瘧鎸囦护鐢?AutoIt3Wrapper 閫夐」缂栬瘧绐楀彛鍒涘缓 ****
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GuiListView.au3>
#include <GuiListBox.au3>
#include <GuiComboBox.au3>
#include <Excel.au3>
#include <Array.au3>
#include <WinAPISys.au3>
#include <Date.au3>
#include <MsgBoxConstants.au3>
#include <ColorConstants.au3>


#Region ### START Koda GUI section ### Form=h:\autoit\瀹夊叏鏇存柊瀹夎\瀹夎杞欢缁熻\manform.kxf
$Form1_1 = GUICreate("software", 759, 686, 381, 167)
$ListView1 = GUICtrlCreateListView("名称|版本|安装日期", 28, 16, 689, 577,$LVS_SORTASCENDING,$LVS_EX_FULLROWSELECT+$LVS_EX_GRIDLINES)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 370)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 160)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 2, 160)
$Button1 = GUICtrlCreateButton("卸载", 48, 608, 97, 25)
$Label1 = GUICtrlCreateLabel("Author: Sun Baolu", 383, 639, 170, 17)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$Button2 = GUICtrlCreateButton("刷新", 160, 608, 105, 25)
$Label2 = GUICtrlCreateLabel("正在更新数据，请稍等", 383, 613, 180, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


;环境变量设置
#Region
$regPath1 = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
$regPath2 = "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
$regPath3 = ""
$oDomain = "EXAS.AD.LOCAL"
$rDomain = "CTE.AD.LOCAL"
$Domain = ""
$username = ""
$password = ""
$computer = @ComputerName
$LogonNumber = @UserName
$UpdateClock = ""
$IniFile = @tempdir & "\import.ini"
$LogFile = "\\172.26.32.251\softwa\pcsetup\inifile\Logfile.ini"
#EndRegion



;用户信息设置
#Region
If @LogonDNSDomain = $oDomain Then
	$Domain = $oDomain
	$username = "kcte12"
	$password = "kcte12.1"
	;MsgBox("O","O",$Domain & " " & $username & " " & $password)

ElseIf @LogonDNSDomain = $rDomain Then
	$Domain = $rDomain
	$username = "ADMINISTRATOR"
	$password = "Mitsumi@11"
	;msgbox("R","R",$Domain & " " & $username & " " & $password)
Else
	$Domain = $computer
	$username = "ADMINISTRATOR"
	$password = "cte.sys.admin"
EndIf

If @OSArch = "X86" Then
	$regPath3 = $regPath1
	$StrDir = "C:\Program Files\McAfee\Common Framework\"

ElseIf @OSArch = "X64" Then
	$regPath3 = $regPath2
	$StrDir = "C:\Program Files (x86)\McAfee\Common Framework\x86\"

EndIf

#EndRegion


Refresh_Software()
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			_delete()

		Case $Button2
			Refresh_Software()

	EndSwitch
WEnd



Func Refresh_Software()
	_GUICtrlListView_DeleteAllItems($ListView1)
	filedelete($IniFile)
	_import($regPath3)
EndFunc

Func _import($regPath)
	$DisplayName=""
	$DisplayVersion=""
	$InstallDate=""
	$UninstallString=""
	$InstallLocation=""
	$SoftwareCount = ""
	$i=1
	$Label2 = GUICtrlCreateLabel("正在更新数据，请稍等", 383, 613, 180, 17)
	;msgbox(0,"",$inifile)
	do
		$Var = RegEnumKey($RegPath, $i)
		;msgbox (0,"",$var)
		$DisplayName=regread ($regpath&"\"&$var,"DisplayName")
		$DisplayVersion=regread ($regpath&"\"&$var,"DisplayVersion")
		$InstallDate=regread ($regpath&"\"&$var,"InstallDate")
		$UninstallString=regread ($regpath&"\"&$var,"UninstallString")
		$InstallLocation=regread ($regpath&"\"&$var,"InstallLocation")
		if stringleft($var,3)="" then
			ExitLoop
		endif

		if regread($regpath&"\"&$var,"SystemComponent")="1" Then
			$i=$i+1
			ContinueLoop
		EndIf
		if regread($regpath&"\"&$var,"ParentKeyName")<>"" then
			;msgbox (0,"","安装补丁程序")
			$i=$i+1
			ContinueLoop
		endif
		if regread ($regpath&"\"&$var,"DisplayName")="" then
			;msgbox (0,"","显示名称为空")
			$i=$i+1
			ContinueLoop
		endif


		if $UninstallString=IniRead($IniFile,$DisplayName,"UninstallString","") Then
			$i=$i+1
			;msgbox (0,"ifthelo",$DisplayName)
			ContinueLoop
			;ContinueLoop
	 	EndIf

		If StringInStr($DisplayName,"McAfee")>0 then
			GUICtrlCreateListViewItem($DisplayName&"|"&$DisplayVersion&"|"&$InstallDate, $ListView1)
			;msgbox (0,"",$DisplayName&$DisplayVersion&$InstallDate&$UninstallString&$InstallLocation)
			$SoftwareCount = $SoftwareCount & " [" & $DisplayName & "] "
			iniwrite($IniFile,$DisplayName,"DisplayVersion",$DisplayVersion)
			iniwrite($IniFile,$DisplayName,"InstallDate",$InstallDate)
			iniwrite($IniFile,$DisplayName,"UninstallString",$UninstallString)
			iniwrite($IniFile,$DisplayName,"InstallLocation",$InstallLocation)
			;iniwrite($IniFile,$DisplayName,"",)
			;iniwrite($IniFile,$DisplayName,"",)
			;IniWrite($LogFile,$computer,"Username",$LogonNumber)
			;IniWrite($LogFile,$computer,"Update",@YEAR&"/"& @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & ":" & @SEC)
			;IniWrite($LogFile,$computer,"count",_guictrllistview_getitemcount($ListView1))
			;IniWrite($logfile,$computer,"software",$SoftwareCount)
		EndIf
		$i=$i+1
	until StringLeft($Var, 3) = ""
		;msgbox(0,"",$regpath)
		$Label2 = GUICtrlCreateLabel("需卸载软件数："& _guictrllistview_getitemcount($ListView1), 383, 613, 169, 13)
		;iniwrite($IniFile,$DisplayName,"DisplayVersion",$DisplayVersion)
		;iniwrite($IniFile,$DisplayName,"InstallDate",$InstallDate)
		;iniwrite($IniFile,$DisplayName,"UninstallString",$UninstallString)
		;iniwrite($IniFile,$DisplayName,"InstallLocation",$InstallLocation)
		;iniwrite($IniFile,$DisplayName,"",)
		;iniwrite($IniFile,$DisplayName,"",)
		IniWrite($LogFile,$computer,"Username",$LogonNumber)
		IniWrite($LogFile,$computer,"Update",@YEAR&"/"& @MON & "/" & @MDAY & " " & @HOUR & ":" & @MIN & ":" & @SEC)
		IniWrite($LogFile,$computer,"count",_guictrllistview_getitemcount($ListView1))
		IniWrite($logfile,$computer,"software",$SoftwareCount)

EndFunc


func _delete()
	$string = StringSplit(GUICtrlRead(GUICtrlRead($ListView1),1),"|")
	$UninstallString2=iniread($IniFile,$string[1],"UninstallString","")
	;MsgBox(3,"5",$UninstallString2)
	$software=iniread($IniFile,$string[1],"UninstallString","")



	If StringInStr($string[1],"agent")>0 Then

		RunAsWait($username,$Domain,$password,0,@ComSpec & " /c " & $UninstallString2 ,"c:\",@SW_MINIMIZE)


		RunAsWait($username,$Domain,$password,0,$StrDir  & "frminst /remove=agent" ,"c:\",@SW_MINIMIZE)
		;msgbox ("a","a",$uninstallstring2,8)
		RunAsWait($username,$Domain,$password,0,"C:\Program Files\McAfee\Agent\x86\frminst /remove=agent","c:\",@SW_MINIMIZE)


	ElseIf $uninstallstring2 <> "" Then
		RunAsWait($username,$Domain,$password,0,@ComSpec & " /c " & $UninstallString2 ,"c:\",@SW_MINIMIZE)

	EndIf



	Refresh_Software()






































































































































EndFunc
































































































































































































































































































































































