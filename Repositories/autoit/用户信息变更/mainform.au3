#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <File.au3>
#include <ColorConstants.au3>
#Region ### START Koda GUI section ### Form=d:\autoit\用户信息变更\formmain.kxf

$Form1_1 = GUICreate("", 373, 207, 402, 342)
$GroupBox1 = GUICtrlCreateGroup("登录用户姓名", 8, 5, 265, 177)
GUICtrlSetFont(-1, 10, 800, 0, "MS Sans Serif")
$Label1 = GUICtrlCreateLabel("役职", 40, 43, 38, 19)
$Label2 = GUICtrlCreateLabel("分机号", 32, 75, 55, 20)
$Input2 = GUICtrlCreateInput("", 72, 40, 168, 21)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Input3 = GUICtrlCreateInput("", 72, 72, 168, 21)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Label3 = GUICtrlCreateLabel("部门名", 33, 106, 43, 20)
$combo = GUICtrlCreateCombo("", 72, 104, 168, 22)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button1 = GUICtrlCreateButton("更新(&U)", 285, 11, 75, 25)
GUICtrlSetState(-1, $GUI_DISABLE)
$Button2 = GUICtrlCreateButton("取消(&C)", 285, 44, 75, 25)
$Button3 = GUICtrlCreateButton("刷新(&H)", 285, 76, 75, 25)
GUICtrlSetState(-1, $GUI_DISABLE)
$label4 = GUICtrlCreateLabel("      正在获取数据，请稍后...",60,163,190,17)
GUICtrlSetColor($label4,$COLOR_RED)
$Label5 = GUICtrlCreateLabel("Author: Sun Baolu", 168, 184, 122, 17)
$Label6 = GUICtrlCreateLabel("Version: 1.0", 16, 184, 108, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$username= @UserName
$userfile=@TempDir&"\getusr.txt"
$comapath=@tempdir&"\"
$tel=""
$display=""
$title=""
$dept=""



RunWait(@ComSpec & ' /c copy \\172.26.32.251\softwa\dstools\dsquery.exe %temp% ', "", @SW_HIDE)
RunWait(@ComSpec & ' /c copy \\172.26.32.251\softwa\dstools\dsget.exe %temp% ', "", @SW_HIDE)
RunWait(@ComSpec & ' /c copy \\172.26.32.251\softwa\dstools\dsmod.exe %temp% ', "", @SW_HIDE)
RunWait(@ComSpec & ' /c %temp%\dsquery user -samid "' & $username & '" | %temp%\dsget user -tel -display -title -dept -l -c -q > "' & $userfile & '" ', "", @SW_HIDE)
if fileexists($userfile) then

	;文件数据整理
	_filewritetoline($userfile,1,"[getusr]",false)
	Local $iRetval = _ReplaceStringInFile($userfile, ":", "=")
	If $iRetval = -1 Then
		MsgBox($MB_SYSTEMMODAL, "错误", "获取服务器信息失败" & " 错误代码: " & @error)
		Exit
	Else
		$tel=iniread($userfile,"getusr","tel","")
		$display=iniread($userfile,"getusr","display","")
		$title=iniread($userfile,"getusr","title","")
		$dept=iniread($userfile,"getusr","dept","")
		guictrlsetdata($input2,$title)
		guictrlsetdata($input3,$tel)
		guictrlsetdata($groupbox1,$display)
		guictrlsetdata($combo,$dept&"|SPO <安全生产管理室>|R&D <技术中心>|QA <品质保证部>|PMD <部品加工部>|PED <生产技术部>|MD <资材部>|INTEC PD <INTEC制造部>|EQP PD <舣装制造推进部>|ANT PD <ANT制造推进部>|AD <管理部>",$dept)
		guictrlsetdata($label4,"提示：修改信息后点击更新按钮")
		guictrlsetstate($button1,$gui_enable)
		guictrlsetstate($button3,$gui_enable)



	EndIf







Else
	;msgbox ("","","文件不存在了")
endif






While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit





		Case $button1
			;msgbox(0,"提示","")
			ProgressOn("处理中请稍候...", "", "", 390,500 , 2 + 16)
			guictrlsetstate($button1,$GUI_DISABLE)
			ProgressSet(10, "已完成 10%", "正在连接服务器...")
			$tel2=guictrlread($Input3)
			$title2=guictrlread($input2)
			if $title2="" Then
				$title2="-"
			EndIf
			$dept2=guictrlread($combo)
			Sleep(1000)
			progressset(30,"已完成 30%","正在更新用户数据...")
			RunWait(@ComSpec & ' /c %temp%\dsquery user -samid "' & $username & '" | %temp%\dsmod user -u kcte12 -p kcte12.1 -tel "' & $tel2 & '" -title "' & $title2 & '" -dept "' & $dept2 & '" ', "", @SW_HIDE)
			progressset(70,"已完成 70%","正在更新用户数据...")
			sleep(1000)
			progressset(100,"已完成 100%","用户信息更新完成")
			;msgbox ("","","信息更新成功后需要等待几分钟生效！")
			guictrlsetstate($button1,$gui_enable)
			guictrlsetdata($label4,"提示:更新信息一天以后生效")
			sleep(1000)
			progressoff()



			;dsmod user -u kcte12 -p kcte12.1 -pwd sun801228.



		Case $Button2
			Exit






























		Case $Button3
			guictrlsetstate($button1,$GUI_DISABLE)
			guictrlsetstate($button3,$GUI_DISABLE)
			guictrlsetdata($label4,"      正在获取数据，请稍后...")
			RunWait(@ComSpec & ' /c %temp%\dsquery user -samid "' & $username & '" | %temp%\dsget user -tel -display -title -dept -l -c -q > "' & $userfile & '" ', "", @SW_HIDE)
			_filewritetoline($userfile,1,"[getusr]",false)
			Local $iRetval = _ReplaceStringInFile($userfile, ":", "=")
			$tel=iniread($userfile,"getusr","tel","")
			$display=iniread($userfile,"getusr","display","")
			$title=iniread($userfile,"getusr","title","")
			$dept=iniread($userfile,"getusr","dept","")
			$refresh="67"
			guictrlsetdata($input2,$title)
			guictrlsetdata($input3,$tel)
			guictrlsetdata($groupbox1,$display)
			guictrlsetdata($combo,"")
			guictrlsetdata($combo,$dept&"|SPO <安全生产管理室>|R&D <技术中心>|QA <品质保证部>|PMD <部品加工部>|PED <生产技术部>|MD <资材部>|INTEC PD <INTEC制造部>|EQP PD <舣装制造推进部>|ANT PD <ANT制造推进部>|AD <管理部>",$dept)
			guictrlsetstate($button1,$gui_enable)
			guictrlsetstate($button3,$gui_enable)
			guictrlsetdata($label4,"提示：修改信息后点击更新按钮")

	EndSwitch
WEnd











































