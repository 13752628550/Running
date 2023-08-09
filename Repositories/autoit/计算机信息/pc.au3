#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=C:\Program Files\autoit3\Aut2Exe\Icons\windows.ico
#AutoIt3Wrapper_Res_Comment=简单的硬件信息查看工具
#AutoIt3Wrapper_Res_Description=硬件信息查看工具
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_LegalCopyright=叁恨居士
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#Region ;**** 参数创建于 ACNWrapper_GUI ****
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <GUIConstants.au3>
#include <Misc.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
Opt('MustDeclareVars', 1)
Opt("GUIOnEventMode", 1)

_Singleton("Hardware_info")

Global $hGui,$bios,$board,$cpu,$display,$sound,$network,$mem,$os


SplashImageOn("logo","Splash.jpg",425,200,-1,-1,1)

$hGui=GUICreate ("                       硬件信息查看器",450,400,-1,-1)
GUISetOnEvent($GUI_EVENT_CLOSE, "_hGuiMsg")


GUICtrlCreateGroup ("信息选项", 10, 10, 430, 360)

GUICtrlCreateButton("C  P  U",25,40,80,30)
$cpu=GUICtrlCreateInput("",120,40,270,30,$ES_READONLY)

GUICtrlCreateButton("B I O S",25,80,80,30)
$bios=GUICtrlCreateInput("",120,80,270,30,$ES_READONLY)


GUICtrlCreateButton("主    板",25,120,80,30)
$board=GUICtrlCreateInput("",120,120,270,30,$ES_READONLY)


GUICtrlCreateButton("显    卡",25,160,80,30)
$display=GUICtrlCreateInput("",120,160,270,30,$ES_READONLY)

GUICtrlCreateButton("声    卡",25,200,80,30)
$sound=GUICtrlCreateInput("",120,200,270,30,$ES_READONLY)

GUICtrlCreateButton("网    卡",25,240,80,30)
$network=GUICtrlCreateInput("",120,240,270,30,$ES_READONLY)

GUICtrlCreateButton("内    存",25,280,80,30)
$mem=GUICtrlCreateInput("",120,280,270,30,$ES_READONLY)

GUICtrlCreateButton("操作系统",25,320,80,30)
$os=GUICtrlCreateInput("",120,320,270,30,$ES_AUTOHSCROLL+$ES_READONLY)

GUICtrlCreateGroup ("",-99,-99,1,1)
GUICtrlCreateLabel("Autoit 中文论坛 www.autoit.net.cn 倾情奉献",15,370,300,30)
GUICtrlCreateLabel("Make By Sanhen",350,370,100,30)



GUISetState()

info()
SplashOff()
While 1

Local $ai_Handle = DllCall("kernel32.dll", 'int', 'OpenProcess', 'int', 0x1f0fff, 'int', False, 'int', @AutoItPID)
Local $ai_Return = DllCall("psapi.dll", 'int', 'EmptyWorkingSet', 'long', $ai_Handle[0])
DllCall("kernel32.dll" , 'int', 'CloseHandle', 'int', $ai_Handle[0])
Sleep(1000)

Wend

Func _hGuiMsg()
  Switch @GUI_CTRLID

	    Case  $GUI_EVENT_CLOSE
		         Exit
        Case $GUI_EVENT_MINIMIZE
                guisetstate(@SW_MINIMIZE)
        Case $GUI_EVENT_RESTORE
                guisetstate(@SW_RESTORE)
		EndSwitch

EndFunc  ;==>_hGuiMsg()

Func info()

Global $objWMIService,$colBios,$colBoard,$colSettings,$colMemory,$colCPU,$colVideoinfo,$colSound ,$colNIC

Local $object,$objOperatingSystem
$objWMIService = objget("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
$colBios = $objWMIService.ExecQuery("Select * from Win32_BIOS")
$colBoard = $objWMIService.ExecQuery("SELECT * FROM Win32_BaseBoard")
$colSettings = $objWMIService.ExecQuery("Select * from Win32_OperatingSystem")
$colMemory = $objWMIService.ExecQuery("Select * from Win32_ComputerSystem")
$colCPU = $objWMIService.ExecQuery("Select * from CIM_Processor")
$colVideoinfo = $objWMIService.ExecQuery("Select * from Win32_VideoController")
$colSound = $objWMIService.ExecQuery("Select * from Win32_SoundDevice")
$colNIC = $objWMIservice.ExecQuery("Select * from Win32_NetworkAdapter WHERE Netconnectionstatus = 2")

For $object in $colCPU
        GUICtrlSetData($cpu, StringStripWS($object.Name,1))
Next

For $object in $colBios
        GUICtrlSetData($bios,StringMid($object.Caption,1))
Next



For $object in $colBoard
        GUICtrlSetData($board,$object.Product)

Next




For $object in $colVideoinfo
        GUICtrlSetData($display, StringStripWS($object.Description ,1))

Next

For $object in $colSound
        GUICtrlSetData($sound, StringStripWS($object.Description ,1))
  Next

For $object in $colNIC
        GUICtrlSetData($network, StringStripWS($object.name ,1))

Next


For $objOperatingSystem in $colSettings

GUICtrlSetData($os,$objOperatingSystem.Caption & " Build " & $objOperatingSystem.BuildNumber & " Sp " & $objOperatingSystem.ServicePackMajorVersion & "." & $objOperatingSystem.ServicePackMinorVersion )

Next
for $object  in $colMemory
        GUICtrlSetData($mem,String(Int(Number($object.TotalPhysicalMemory) / (1024 * 1024))) & " Mb")
		;msgbox (0,"",$object.model)
Next

EndFunc  ;==>Info()
