#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_Icon=Printer.ico
#AutoIt3Wrapper_Outfile=打印机安装787878.exe
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>




#Region ### START Koda GUI section ### Form=C:\print.kxf
$Form1 = GUICreate("打印机安装", 490, 320, 420, 249)
$PageControl1 = GUICtrlCreateTab(8, 45, 480, 177)
$TabSheet1 = GUICtrlCreateTabItem("车载一部")
$Radio1 = GUICtrlCreateRadio("HP P2015 Series", 48, 77, 115, 37)
;GUICtrlSetFont(-1, 8, 400, 0, "Arial")
$Radio2 = GUICtrlCreateRadio("(仓库) HP 5000", 248, 77, 116, 33)
;GUICtrlSetFont(-1, 8, 400, 0, "Arial")
$Radio3 = GUICtrlCreateRadio("FX DocuCentre-v C4475 T2 ", 48, 125, 166, 25)
;GUICtrlSetFont(-1, 8, 400, 0, "Arial")
$Radio4 = GUICtrlCreateRadio("(一楼仓库) HP 5200", 248, 125, 133, 26)
;GUICtrlSetFont(-1, 8, 400, 0, "Arial")
$Radio5 = GUICtrlCreateRadio("HP M126NW", 48, 165, 73, 33)
;GUICtrlSetFont(-1, 8, 400, 0, "Arial")
;GUICtrlSetState(-1, $GUI_HIDE)
$Radio6 = GUICtrlCreateRadio("Radio6", 248, 165, 105, 33)
;GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlSetState(-1, $GUI_HIDE)
$TabSheet2 = GUICtrlCreateTabItem("车载二部")
$Radio7 = GUICtrlCreateRadio("(生管) HP 5200", 48, 85, 105, 25)
;GUICtrlSetFont(-1, 8, 400, 0, "Arial")
$Radio8 = GUICtrlCreateRadio("Canon iR-ADV 4045", 248, 85, 145, 25)
;GUICtrlSetFont(-1, 8, 400, 0, "Arial")
$Radio9 = GUICtrlCreateRadio("(生管) HP LaserJet 400 M401n", 48, 125, 177, 25)
;GUICtrlSetFont(-1, 8, 400, 0, "Arial")
$Radio10 = GUICtrlCreateRadio("(三楼仓库) HP 5000", 248, 125, 137, 25)
;GUICtrlSetFont(-1, 8, 400, 0, "Arial")
$Radio11 = GUICtrlCreateRadio("Canon C5255", 48, 156, 81, 33)
;GUICtrlSetFont(-1, 8, 400, 0, "Arial")
;GUICtrlSetState(-1, $GUI_HIDE)
$Radio12 = GUICtrlCreateRadio("Radio12", 248, 165, 129, 33)
;GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlSetState(-1, $GUI_HIDE)
$TabSheet3 = GUICtrlCreateTabItem("技术中心/Intec")
$Radio13 = GUICtrlCreateRadio("(技术中心) Canon iR-ADV C3520 UFR II", 60, 93, 190, 25)
;GUICtrlSetFont(-1, 8, 400, 0, "Arial")
;$Radio14 = GUICtrlCreateRadio("(技术中心) Canon iR-ADV 4045", 260, 90, 197, 32)
$Radio14 = GUICtrlCreateRadio("(技术中心2) Canon iR-ADV C3520 UFR II", 260, 90, 197, 32)
;GUICtrlSetFont(-1, 8, 400, 0, "Arial")
$Radio15 = GUICtrlCreateRadio("(技术中心) HP LaserJet 5100 Series", 60, 133, 177, 33)
;GUICtrlSetFont(-1, 8, 400, 0, "Arial")
$Radio16 = GUICtrlCreateRadio("(Intec) Canon iR-ADV C3520 UFR II", 260, 133, 178, 33)
;GUICtrlSetFont(-1, 8, 400, 0, "Arial")
;GUICtrlSetState(-1, $GUI_HIDE)
$Radio17 = GUICtrlCreateRadio("Radio17", 64, 173, 145, 33)
;GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlSetState(-1, $GUI_HIDE)
$Radio18 = GUICtrlCreateRadio("Radio18", 248, 165, 137, 41)
;GUICtrlSetFont(-1, 8, 400, 0, "Arial")
GUICtrlSetState(-1, $GUI_HIDE)
$TabSheet4 = GUICtrlCreateTabItem("生产技术部")
$Radio19 = GUICtrlCreateRadio("HP Color LaserJet 3600", 40, 85, 153, 25)
$Radio20 = GUICtrlCreateRadio("HP DesignJet T730", 248, 85, 137, 25)
$Radio21 = GUICtrlCreateRadio("ApeosPort-V C3373 T2", 40, 125, 161, 33)
$Radio22 = GUICtrlCreateRadio("Radio22", 248, 125, 129, 33)
GUICtrlSetState(-1, $GUI_HIDE)
$Radio23 = GUICtrlCreateRadio("Radio23", 40, 165, 137, 33)
GUICtrlSetState(-1, $GUI_HIDE)
$Radio24 = GUICtrlCreateRadio("Radio24", 248, 165, 137, 33)
GUICtrlSetState(-1, $GUI_HIDE)
$TabSheet5 = GUICtrlCreateTabItem("品证部/资材部")
$Radio25 = GUICtrlCreateRadio("(品证部) HP 5550", 56, 93, 145, 25)
$Radio26 = GUICtrlCreateRadio("(资材部) Canon LBP6300", 300, 93, 161, 25)
$Radio27 = GUICtrlCreateRadio("(资材部) Xerox DocuCentre-V C2265", 56, 125,230 , 25)
;GUICtrlSetState(-1, $GUI_HIDE)
$Radio28 = GUICtrlCreateRadio("(品证部) Xerox C3371", 300, 119, 179, 33)
;GUICtrlSetState(-1, $GUI_HIDE)
$Radio29 = GUICtrlCreateRadio("Radio29", 80, 157, 137, 41)
GUICtrlSetState(-1, $GUI_HIDE)
$Radio30 = GUICtrlCreateRadio("Radio30", 232, 165, 153, 25)
GUICtrlSetState(-1, $GUI_HIDE)
$TabSheet6 = GUICtrlCreateTabItem("加工部/管理部")
GUICtrlSetState(-1,$GUI_SHOW)
$Radio31 = GUICtrlCreateRadio("(加工部生管) HP LaserJet 5100 Series", 16, 85, 233, 33)
$Radio32 = GUICtrlCreateRadio("(加工部) DocuCentre-II 4000", 253, 85, 193, 33)
$Radio33 = GUICtrlCreateRadio("(管理部) Canon imageCLASS C3500", 16, 125, 225, 33)
$Radio34 = GUICtrlCreateRadio("(管理部) ApeosPort-V C3375 T2", 253, 125, 193, 33)
$Radio35 = GUICtrlCreateRadio("Radio35", 16, 165, 209, 33)
GUICtrlSetState(-1, $GUI_HIDE)
$Radio36 = GUICtrlCreateRadio("Radio36", 253, 165, 177, 33)
GUICtrlSetState(-1, $GUI_HIDE)
GUICtrlCreateTabItem("")
$Button1 = GUICtrlCreateButton("安装", 326, 264, 59, 25)
$Button2 = GUICtrlCreateButton("退出", 390, 264, 59, 25)
$Label1 = GUICtrlCreateLabel("提示：", 18, 239, 40, 17)
$Label2 = GUICtrlCreateLabel("1. 自动识别32位及64位XP Win7操作系统", 19, 256, 267, 17)
$Label3 = GUICtrlCreateLabel("2. 自动设置打印机为默认打印机", 19, 273, 267, 17)
$Label4 = GUICtrlCreateLabel("3. 必须连接公司网络使用", 19, 290, 267, 17)
$Label5 = GUICtrlCreateLabel("程序设计 孙宝禄", 350, 295, 91, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

global $tabsele=guictrlread($pagecontrol1,0)
Global Const $osAr = @OSArch
Global Const $osVer = @OSVersion
;Regedit path
Global Const $RegPath = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Monitors\Standard TCP/IP Port\Ports\"
;runwait(@comspec & " /c" & "\\172.26.32.251\softwa\hotfix\kb2596754.exe /passive /norestart")
runwait(@comspec & " /c" & "net use \\172.26.32.251\ipc$ /user:exas\kcte99 kcte99." ,@SW_HIDE)





While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $Form1


		Case $Button1
			Select
				#CS
					Case BitAND(GUICtrlRead($radio), $GUI_CHECKED) = $GUI_CHECKED
					$IP = ""
 					$Name = ""
 					$Driver = ""
 					If $osAr == "X86" Then
 						$Path = ""
 					Else
 						$Path = ""
 					EndIf
 					_install($IP, $Name, $Path, $Driver)
                #CE

				;radio1 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio1), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.39.240"
					$Name = "(车载一部) HP LaserJet P2015"
					$Driver = "HP LaserJet P2015 Series PCL 6"
					If $osAr == "X86" Then
						$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet P2015 Series\x86\hppcp604.inf"
					Else
						$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet P2015 Series\x64\hppdp604.inf"
					EndIf
					_install($IP, $Name, $Path, $Driver)
				;radio2 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio2), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.39.246"
					$Name = "(车载一部仓库) HP LaserJet 5000"
					$Driver = "HP LaserJet 5200 PCL 6"
					If $osAr == "X86" Then
						$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet 5200\x86\hpc520xc.inf"
					Else
						$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet 5200\x64\hpc520xu.inf"
					EndIf
					_install($IP, $Name, $Path, $Driver)
				;radio3 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio3), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.36.250"
 					$Name = "(车载一部) DocuCentre-V C4475 T2"
 					$Driver = "FX DocuCentre-V C4475 T2 PCL 6"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\Xerox\DocuCentre-V C4475 T2\x86\FX6SFAL.inf"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\Xerox\DocuCentre-V C4475 T2\x64\FX6SFAL.inf"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)

                    ;用户卡号到打印机
                    $cardhao=inputbox("输入","输入打印机卡号：")
					if $cardhao= 0 then
						msgbox (0,"提示","输入卡号不成功")
					Else
						;msgbox (0,"输入返回值为：",$billid)
						$return7=RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(车载一部) DocuCentre-V C4475 T2\PrinterDriverData\UserInfo","SpecifyJobOwnerName_User","REG_SZ","EnterName")
						$return8=RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(车载一部) DocuCentre-V C4475 T2\PrinterDriverData\UserInfo","JobOwnerName_user","REG_SZ",$cardhao)
					    if $return7=1 and $return8=1 Then
							sleep(300)
							msgbox (0,"提示","卡号设置成功")
						Else
							sleep(300)
							msgbox (0,"提示","卡号设置不成功")
						EndIf
					EndIf
				;radio4 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio4), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.37.246"
 					$Name = "(车载一部 一楼仓库) HP LaserJet 5200"
 					$Driver = "HP LaserJet 5200 PCL 6"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet 5200\x86\hpc520xc.inf"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet 5200\x64\hpc520xu.inf"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)
				;radio5 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio5), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.39.250"
 					$Name = "(车载一部) HP M126NW"
 					$Driver = "HP LaserJet Pro MFP M125-M126 PCLmS"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\HP\hp126nw\x86\hpcm125126.inf"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\HP\hp126nw\x64\hpcm125126.inf"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)

				;radio6 选择打印机进行安装
				;radio7 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio7), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.36.244"
 					$Name = "(车载二部生管) HP LaserJet 5200"
 					$Driver = "HP LaserJet 5200 PCL 6"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet 5200\x86\hpc520xc.inf"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet 5200\x64\hpc520xu.inf"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)
				;radio8 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio8), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.36.247"
 					$Name = "(车载二部) Canon iR-ADV 4045/4051"
 					$Driver = "Canon iR-ADV 4045/4051 UFR II"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\Canon\IR-ADV 4045\x86\CNLB0C.INF"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\Canon\IR-ADV 4045\x64\CNLB0CA64.INF"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)
				;radio9 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio9), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.36.248"
 					$Name = "(车载二部 生管) HP LaserJet 400 m401"
 					$Driver = "HP LaserJet 400 M401 PCL 6"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet 400\x86\hpcm401c.inf"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet 400\x64\hpcm401u.inf"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)
				;radio10 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio10), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.38.245"
 					$Name = "(车载二部三楼仓库) HP LaserJet 5200"
 					$Driver = "HP LaserJet 5200 PCL 6"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet 5200\x86\hpc520xc.inf"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet 5200\x64\hpc520xu.inf"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)
				;radio11 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio11), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.39.243"
 					$Name = "(车载二部) Canon C5255"
 					$Driver = "Canon iR-ADV C5250/5255 UFR II"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\Canon\C5255\x86\CNLB0C.INF"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\Canon\C5255\x64\CNLB0CA64.INF"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)

					if $osAr=="X86" then
						run("N:\AVC製品部\对外服务\SmartControl_V3.a.2.0_20160630\SmartControl_V3.a.2.0_20160630\Installer\CFGTool\CFGTool.exe","")
						$title="智控打印 配置工具"
						$text="请选择您需要配置的项目"
						_WinExiSetAct_AndWaitAct($title,$text)
						ControlCommand($title,"安装打印处理器","Button3","Check")
						ControlCommand($title,"配置基本版随行打印","Button6","UnCheck")
						ControlCommand($title,"配置增强版随行打印 - 设备端","Button9","UnCheck")
						ControlCommand($title,"配置增强版随行打印 - 客户端","Button10","UnCheck")
						ControlClick($title,"下一步(&N)","Button12")

						$title="智控打印 配置工具"
						$text="打印处理器"
						_WinExiSetAct_AndWaitAct($title,$text)
						ControlCommand($title,"全选/取消全选","Button1","Check")
						ControlClick($title,"执行","Button14")
						$title="智控打印 配置工具"
						$text="是否要执行设置操作？"
						_WinExiSetAct_AndWaitAct($title,$text)
						ControlClick($title,"是(&Y)","Button1")
						$title="智控打印 配置工具 V1.0.3.0"
						$text="设置成功"
						_WinExiSetAct_AndWaitAct($title,$text)
						ControlClick($title,"确定","Button1")
						winkill("智控打印 配置工具","执行")
						RunWait("RUNDLL32 SHELL32.DLL,SHHelpShortcuts_RunDLL PrintersFolder")

					else
						run("N:\AVC製品部\对外服务\SmartControl_V3.a.2.0_20160630\SmartControl_V3.a.2.0_20160630\Installer\CFGTool\CFGTool64.exe","")
						$title="智控打印 配置工具"
						$text="请选择您需要配置的项目"
						_WinExiSetAct_AndWaitAct($title,$text)
						ControlCommand($title,"安装打印处理器","Button3","Check")
						ControlCommand($title,"配置基本版随行打印","Button6","UnCheck")
						ControlCommand($title,"配置增强版随行打印 - 设备端","Button9","UnCheck")
						ControlCommand($title,"配置增强版随行打印 - 客户端","Button10","UnCheck")
						ControlClick($title,"下一步(&N)","Button12")

						$title="智控打印 配置工具"
						$text="打印处理器"
						_WinExiSetAct_AndWaitAct($title,$text)
						ControlCommand($title,"全选/取消全选","Button1","Check")
						ControlClick($title,"执行","Button14")
						$title="智控打印 配置工具"
						$text="是否要执行设置操作？"
						_WinExiSetAct_AndWaitAct($title,$text)
						ControlClick($title,"是(&Y)","Button1")
						$title="智控打印 配置工具 V1.0.3.0"
						$text="设置成功"
						_WinExiSetAct_AndWaitAct($title,$text)
						ControlClick($title,"确定","Button1")
						winkill("智控打印 配置工具","执行")
						RunWait("RUNDLL32 SHELL32.DLL,SHHelpShortcuts_RunDLL PrintersFolder")
					EndIf

				;radio12 选择打印机进行安装
				;radio13 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio13), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.39.242"
 					$Name = "(技术中心) Canon iR-ADV C3520 UFR II"
 					$Driver = "Canon iR-ADV C3520 UFR II"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\Canon\iR-ADV C3520\x86\CNLB0C.INF"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\Canon\iR-ADV C3520\x64\CNLB0CA64.INF"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)
				;radio14 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio14), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.39.247"
 					;$Name = "(技术中心) Canon iR-ADV 4045/4051"
 					;$Driver = "Canon iR-ADV 4045/4051 UFR II"
 					;If $osAr == "X86" Then
 					;	$Path = "\\172.26.32.251\softwa\print\Driver\Canon\IR-ADV 4045\x86\CNLB0C.INF"
 					;Else
 					;	$Path = "\\172.26.32.251\softwa\print\Driver\Canon\IR-ADV 4045\x64\CNLB0CA64.INF"
 					;EndIf
 					$Name = "(技术中心2) Canon iR-ADV C3520 UFR II"
 					$Driver = "Canon iR-ADV C3520 UFR II"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\Canon\iR-ADV C3520\x86\CNLB0C.INF"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\Canon\iR-ADV C3520\x64\CNLB0CA64.INF"
 					EndIf
					_install($IP, $Name, $Path, $Driver)
				;radio15 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio15), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.39.248"
 					$Name = "(技术中心) HP LaserJet 5100"
 					$Driver = "HP LaserJet 5100 PCL 6"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet 5100 Series\x86\hpc5100c.inf"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet 5100 Series\x64\hpc5100u.inf"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)
				;radio16 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio16), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.37.251"
 					$Name = "(Intec) Canon iR-ADV C3520 UFR II"
 					$Driver = "Canon iR-ADV C3520 UFR II"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\Canon\iR-ADV C3520\x86\CNLB0C.INF"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\Canon\iR-ADV C3520\x64\CNLB0CA64.INF"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)

				;radio17 选择打印机进行安装
				;radio18 选择打印机进行安装
				;radio19 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio19), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.37.244"
 					$Name = "(生产技术部) HP Color LaserJet 3600"
 					$Driver = "HP Color LaserJet 3600"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet 3600\x86\hpc3600e.inf"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet 3600\x64\hpc3600w.inf"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)
				;radio20 选择打打印机进行安装
				Case BitAND(GUICtrlRead($radio20), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.36.243"
 					$Name = "(生产技术部) HP DesignJet T730"
 					$Driver = ""
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\HP\HP DesignJet T730\x86\hpi5dgah.inf"
						$driver="HP DesignJet T730"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\HP\HP DesignJet T730\x64\hpi5dgax.inf"
						$driver="HP DesignJet T730"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)
				;radio21 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio21), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.36.246"
 					$Name = "(生产技术部) FX ApeosPort-V C3373 T2"
 					$Driver = "FX ApeosPort-V C3373 T2 PCL 6"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\Xerox\ApeosPort-V C3373 T2\x86\FX6SFAL.inf"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\Xerox\ApeosPort-V C3373 T2\x64\FX6SFAL.inf"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)

					;用户卡号到打印机
                    $cardhao=inputbox("输入","输入打印机卡号：")
					if $cardhao= 0 then
						msgbox (0,"提示","输入卡号不成功")
					Else
						;msgbox (0,"输入返回值为：",$billid)
						$return7=RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(生产技术部) FX ApeosPort-V C3373 T2\PrinterDriverData\UserInfo","SpecifyJobOwnerName_User","REG_SZ","EnterName")
						$return8=RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(生产技术部) FX ApeosPort-V C3373 T2\PrinterDriverData\UserInfo","JobOwnerName_user","REG_SZ",$cardhao)
					    if $return7=1 and $return8=1 Then
							sleep(300)
							msgbox (0,"提示","卡号设置成功")
						Else
							sleep(300)
							msgbox (0,"提示","卡号设置不成功")
						EndIf
					EndIf
				;radio22 选择打印机进行安装
				;radio23 选择打印机进行安装
				;radio24 选择打印机进行安装
				;radio25 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio25), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.37.241"
 					$Name = "(品证部) HP Color LaserJet 5550"
 					$Driver = "HP Color LaserJet 5550 PCL 5"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet 5550\x86\prnhp001.Inf"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet 5550\x64\prnhp001.Inf"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)
				;radio26 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio26), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.37.252"
 					$Name = "(资材部) Canon LBP6300"
 					$Driver = "Canon LBP6300"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\Canon\LBP6300\x86\CNABBSTK.INF"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\Canon\LBP6300\x64\CNABBSTD.INF"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)
				;radio27 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio27), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.37.240"
 					$Name = "(资材部) Xerox DocuCentre-V C2265 PCL 6"
 					$Driver = "FX DocuCentre-V C2265 PCL 6"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\Xerox\DocuCentre-V C2265\x86\001\FX6MBAL.inf"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\Xerox\DocuCentre-V C2265\x64\001\FX6MBAL.inf"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)

					;用户卡号到打印机
                    $cardhao=inputbox("输入","输入打印机卡号：")
					if $cardhao= 0 then
						msgbox (0,"提示","输入卡号不成功")
					Else
						;msgbox (0,"输入返回值为：",$billid)
						$return7=RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(资材部) Xerox DocuCentre-V C2265 PCL 6\PrinterDriverData\UserInfo","SpecifyJobOwnerName_User","REG_SZ","EnterName")
						$return8=RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(资材部) Xerox DocuCentre-V C2265 PCL 6\PrinterDriverData\UserInfo","JobOwnerName_user","REG_SZ",$cardhao)
					    if $return7=1 and $return8=1 Then
							msgbox (0,"提示","卡号设置成功")
						Else
							msgbox (0,"提示","卡号设置不成功")
						EndIf
					EndIf
				;radio28 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio28), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.38.248"
 					$Name = "(品证部) FX ApeosPort-V C3373 T2"
 					$Driver = "FX ApeosPort-V C3373 T2 PCL 6"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\Xerox\ApeosPort-V C3373 T2\x86\FX6SFAL.inf"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\Xerox\ApeosPort-V C3373 T2\x64\FX6SFAL.inf"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)

					;用户卡号到打印机
                    $cardhao=inputbox("输入","输入打印机卡号：")
					if $cardhao= 0 then
						msgbox (0,"提示","输入卡号不成功")
					Else
						;msgbox (0,"输入返回值为：",$billid)
						$return7=RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(品证部) FX ApeosPort-V C3373 T2\PrinterDriverData\UserInfo","SpecifyJobOwnerName_User","REG_SZ","EnterName")
						$return8=RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(品证部) FX ApeosPort-V C3373 T2\PrinterDriverData\UserInfo","JobOwnerName_user","REG_SZ",$cardhao)
					    if $return7=1 and $return8=1 Then
							sleep(300)
							msgbox (0,"提示","卡号设置成功")
						Else
							sleep(300)
							msgbox (0,"提示","卡号设置不成功")
						EndIf
					EndIf
				;radio29 选择打印机进行安装
				;radio30 选择打印机进行安装
				;radio31 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio31), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.35.241"
 					$Name = "(加工部生管) HP LaserJet 5100"
 					$Driver = "HP LaserJet 5100 PCL 6"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet 5100 Series\x86\hpc5100c.inf"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet 5100 Series\x64\hpc5100u.inf"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)
				;radio32 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio32), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.35.247"
 					$Name = "(加工部) FX DocuCentre-II 4000"
 					$Driver = "FX DocuCentre-II 4000 PCL 6"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\Xerox\DocuCentre-II 4000\x86\fx6ngie.inf"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\Xerox\DocuCentre-II 4000\x64\fx6ngie.inf"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)
				;radio33 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio33), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.35.245"
 					$Name = "(管理部) Canon imageCLASS C3500"
 					$Driver = "Canon imageCLASS C3500"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\Canon\imageCLASS C3500\x86\CNLAC32.inf"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\Canon\imageCLASS C3500\x86\CNLAC32.inf"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)
				;radio34 选择打印机进行安装
				Case BitAND(GUICtrlRead($radio34), $GUI_CHECKED) = $GUI_CHECKED
					$IP = "172.26.35.246"
 					$Name = "(管理部) FX ApeosPort-V C3373 T2"
 					$Driver = "FX ApeosPort-V C3373 T2 PCL 6"
 					If $osAr == "X86" Then
 						$Path = "\\172.26.32.251\softwa\print\Driver\Xerox\ApeosPort-V C3375 T2\x86\FX6SFAL.inf"
 					Else
 						$Path = "\\172.26.32.251\softwa\print\Driver\Xerox\ApeosPort-V C3375 T2\x64\FX6SFAL.inf"
 					EndIf
 					_install($IP, $Name, $Path, $Driver)

					;用户卡号到打印机
                    $cardhao=inputbox("输入","输入打印机卡号：")
					if $cardhao= 0 then
						msgbox (0,"提示","输入卡号不成功")
					Else
						;msgbox (0,"输入返回值为：",$billid)
						$return7=RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(管理部) FX ApeosPort-V C3373 T2\PrinterDriverData\UserInfo","SpecifyJobOwnerName_User","REG_SZ","EnterName")
						$return8=RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(管理部) FX ApeosPort-V C3373 T2\PrinterDriverData\UserInfo","JobOwnerName_user","REG_SZ",$cardhao)
					    if $return7=1 and $return8=1 Then
							msgbox (0,"提示","卡号设置成功")
						Else
							msgbox (0,"提示","卡号设置不成功")
						EndIf
					EndIf

				;radio35 选择打印机进行安装
				;radio36 选择打印机进行安装

				Case Else
					msgbox (0,"提示","选择打印机后再安装")

			EndSelect

		Case $Button2
			Exit


        ;标签到翻页时控件将进行初始操作
	    Case $pagecontrol1

			if guictrlread($pagecontrol1,0)<>$tabsele then
		        ;msgbox (0,"提示",$tabsele)
				$tabsele=guictrlread($pagecontrol1,0)
		        $radionum="$radio"
				;guictrlsetstate(eval("radio" & $i ),4)

				for $i= 1 to 36 step 1
			        guictrlsetstate(eval("radio"& $i),4)
				Next
                $ip=""
				$name=""
				$driver=""
				$path=""
				$portname=""
				;msgbox (0,"提示",guictrlgetstate($radio1))
			endif

	EndSwitch
		WEnd








;setup pirnter
Func _install($IP, $Name, $Path, $Driver)
	ProgressOn("处理中请稍候...", "", "", 100, 100, 2 + 16)
	ProgressSet(0, "已完成 0%", "正在侦测系统...")
	Sleep(300)
	Select
		Case $osVer == "WIN_XP"
			$PortName = _addPortXP($IP)
		Case $osVer == "WIN_7"
			;MsgBox(0,"", $osAr & "   " & $osVer)
			$PortName = _addPortWin7($IP)
		case $osver == "WIN_10"
		    ;MsgBox(0,"", $osAr & "   " & $osVer)
			$PortName=_addPortWin7($ip)

	EndSelect
	_installPrint($Name, $Path, $PortName, $Driver)
EndFunc   ;==>_install

;add print port in Win7
Func _addPortWin7($IP)
	;检测打印端口是否存在
	$i = 1
	$s = ""
	ProgressSet(10, "已完成 10%", "正在检测端口信息...")
	Sleep(300)

	Do
		$Var = RegEnumKey($RegPath, $i)
		$i = $i + 1
		ProgressSet(10 + $i, "已完成 " & 10 + $i & "%", "正在检测端口信息...")
		Sleep(300)
		;msgbox (0,"提示",$Var)
		$x=StringInStr($Var,$IP)
        if $x<>0 then
			ExitLoop
		EndIf
	Until StringLeft($Var, 3) <> "172"
    #cs
	;$x = StringInStr($Var, $IP)
    ;msgbox (0,"提示",$Var)
	;msgbox (0,"提示",$ip)
	;msgbox (0,"提示",$x)
	#ce

	$PortName = $IP
	$NewRegPath = $RegPath & $PortName
	ProgressSet(30, "已完成 30%", "正在检测端口是否存在...")
	Sleep(300)

	;如果打印端口不存在，则利用注册表添加端口
	If $x = 0 Then
		ProgressSet(40, "已完成 40%", "端口不存在,正在创建端口...")
		Sleep(300)
		RegWrite($NewRegPath)
		RegWrite($NewRegPath, "HostName", "REG_SZ", $IP)
		RegWrite($NewRegPath, "HWAddress", "REG_SZ", "")
		RegWrite($NewRegPath, "IPAddress", "REG_SZ", "")
		RegWrite($NewRegPath, "PortMonMibPortIndex", "REG_DWORD", "00000001")
		RegWrite($NewRegPath, "PortNumber", "REG_DWORD", "9100")
		RegWrite($NewRegPath, "Protocol", "REG_DWORD", "00000001")
		RegWrite($NewRegPath, "SNMP Community", "REG_SZ", "public")
		RegWrite($NewRegPath, "SNMP Enabled", "REG_DWORD", "00000000")
		RegWrite($NewRegPath, "SNMP Index", "REG_DWORD", "00000000")
		RegWrite($NewRegPath, "Version", "REG_DWORD", "00000002")

		;添加端口后，需要重启print spool服务，才能识别端口
		ProgressSet(70, "已完成 70%", "正在停止打印服务...")
		RunWait(@ComSpec & " /c net stop spooler>nul", "", @SW_HIDE)
		ProgressSet(75, "已完成 80%", "正在启动打印服务...")
		RunWait(@ComSpec & " /c net start spooler", "", @SW_HIDE)
		ProgressSet(80, "已完成 80%", "准备添加打印机...")
		Sleep(1000)
	Else
		ProgressSet(60, "已完成 60%", "端口已经存在,准备添加打印机...")
		Sleep(300)
	EndIf
	Return $PortName
EndFunc   ;==>_addPortWin7

;add print port in XP
Func _addPortXP($IP)
	$i = 1
	$s = ""
	$RegPath001 = "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Print\Monitors\Standard TCP/IP Port\Ports\"
	ProgressSet(10, "已完成 10%", "正在检测端口信息...")
	Sleep(300)
	Do
		$Var = RegEnumKey($RegPath, $i)
		$i = $i + 1
		$s = $s & $Var & "/"
		ProgressSet(10 + $i, "已完成 " & 10 + $i & "%", "正在检测端口信息...")
		Sleep(300)
	Until StringLeft($Var, 3) <> "IP_"

	$x = StringInStr($s, "IP_" & $IP)
	$PortName = "IP_" & $IP
	$NewPatch = $RegPath & $PortName
	$NewPatch001 = $RegPath001 & $PortName
	ProgressSet(30, "已完成 30%", "正在检测端口是否存在...")

	Sleep(300)
	If $x = 0 Then
		ProgressSet(40, "已完成 40%", "端口不存在,在正在创建端口...")
		Sleep(300)
		RegWrite($NewPatch)
		RegWrite($NewPatch, "Protocol", "REG_DWORD", "00000001")
		RegWrite($NewPatch, "Version", "REG_DWORD", "00000001")
		RegWrite($NewPatch, "HostName", "REG_SZ", "")
		RegWrite($NewPatch, "IPAddress", "REG_SZ", $IP)
		RegWrite($NewPatch, "HWAddress", "REG_SZ", "")
		RegWrite($NewPatch, "PortNumber", "REG_DWORD", "9100")
		RegWrite($NewPatch, "SNMP Community", "REG_SZ", "public")
		RegWrite($NewPatch, "SNMP Enabled", "REG_DWORD", "00000001")
		RegWrite($NewPatch, "SNMP Index", "REG_DWORD", "00000001")
		ProgressSet(60, "已完成 60%", "端口不存在,正在创建端口...")
		Sleep(300)
		RegWrite($NewPatch001)
		RegWrite($NewPatch001, "Protocol", "REG_DWORD", "00000001")
		RegWrite($NewPatch001, "Version", "REG_DWORD", "00000001")
		RegWrite($NewPatch001, "HostName", "REG_SZ", "")
		RegWrite($NewPatch001, "IPAddress", "REG_SZ", $IP)
		RegWrite($NewPatch001, "HWAddress", "REG_SZ", "")
		RegWrite($NewPatch001, "PortNumber", "REG_DWORD", "9100")
		RegWrite($NewPatch001, "SNMP Community", "REG_SZ", "public")
		RegWrite($NewPatch001, "SNMP Enabled", "REG_DWORD", "00000001")
		RegWrite($NewPatch001, "SNMP Index", "REG_DWORD", "00000001")

		ProgressSet(70, "已完成 70%", "正在停止打印服务...")
		RunWait(@ComSpec & " /c sc stop spooler", "", @SW_HIDE)
		ProgressSet(75, "已完成 80%", "正在启动打印服务...")
		RunWait(@ComSpec & " /c sc start spooler", "", @SW_HIDE)
		ProgressSet(80, "已完成 80%", "准备添加打印机...")
		Sleep(1000)
	Else
		ProgressSet(60, "已完成 60%", "端口已经存在,准备添加打印机...")
		Sleep(300)
	EndIf
	Return $PortName
EndFunc   ;==>_addPortXP

;install Printer
Func _installPrint($Name, $Path, $PortName, $Driver)
	ProgressSet(90, "已完成 90%", "正在添加打印机...")
	;setup printer
	RunWait(@ComSpec & ' /c rundll32 printui.dll,PrintUIEntry /if /b "' & $Name & '" /f "' & $Path & '" /r "' & $PortName & '" /m "' & $Driver & '" ', "", @SW_HIDE)
	;set default
	RunWait(@ComSpec & ' /c rundll32 printui.dll,PrintUIEntry /y /n "' & $Name & '"  ', "", @SW_HIDE)
	Sleep(300)
	ProgressSet(100, "已完成 100%", "添加打印机完毕!")
	ProgressOff()
	RunWait("RUNDLL32 SHELL32.DLL,SHHelpShortcuts_RunDLL PrintersFolder")
	Sleep(500)
	Send("{F5}");需要刷新窗口，才能显示新添加的打印机
EndFunc   ;==>_installPrint

;车载二部打印机
Func _WinExiSetAct_AndWaitAct($WinTitle,$WinText)
	WinWait($WinTitle,$WinText)
	WinActivate($WinTitle,$WinText)
	WinWaitActive($WinTitle,$WinText)
EndFunc






;radio1 选择打印机进行安装
;radio2 选择打印机进行安装
;radio3 选择打印机进行安装
;radio4 选择打印机进行安装
;radio5 选择打印机进行安装
;radio6 选择打印机进行安装
;radio7 选择打印机进行安装
;radio8 选择打印机进行安装
;radio9 选择打印机进行安装
;radio10 选择打印机进行安装
;radio11 选择打印机进行安装
;radio12 选择打印机进行安装
;radio13 选择打印机进行安装
;raido14 选择打印机进行安装
;radio15 选择打印机进行安装
;radio16 选择打印机进行安装
;radio17 选择打印机进行安装
;radio18 选择打印机进行安装
;radio19 选择打印机进行安装
;radio20 选择打印机进行安装
;radio21 选择打印机进行安装
;radio22 选择打印机进行安装
;radio23 选择打印机进行安装
;radio24 选择打印机进行安装
;radio25 选择打印机进行安装
;radio26 选择打印机进行安装
;radio27 选择打印机进行安装
;radio28 选择打印机进行安装
;radio29 选择打印机进行安装
;radio30 选择打印机进行安装
;radio31 选择打印机进行安装
;radio32 选择打印机进行安装
;radio33 选择打印机进行安装
;radio34 选择打印机进行安装
;radio35 选择打印机进行安装
;radio35 选择打印机进行安装












































































































































































































































































































































































