#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\au3script_v10.ico
#AutoIt3Wrapper_UseX64=n
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <GUIImageList.au3>
#include <GUIListView.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ColorConstants.au3>
#include <MsgBoxConstants.au3>
#include <array.au3>
#include <file.au3>
#include <constants.au3>
#include <stringconstants.au3>


;初始化程序变量
Local $iniFile = "\\172.26.32.251\softwa\pcsetup\domain\inifile\Software.ini"
Local $sUpdate = IniRead($iniFile,"parameter","update","")
Local $Domain = IniRead($iniFile,"parameter","Domain","")
Local $DomainAdmin = IniRead($iniFile,"parameter","DomainAdmin","")
Local $DomainPassword = IniRead($iniFile,"parameter","DomainPassword","")
Local $oldDomain = IniRead($iniFile,"parameter","oldDomain","")
Local $oldDomainAdmin = IniRead($iniFile,"parameter","oldDomainAdmin","")
Local $oldDomainPassword = IniRead($iniFile,"parameter","oldDomainPassword","")
Local $CommonDir = "\\172.26.32.251\softwa\software\"
Local $TempDir = @TempDir
Local $OSBit = @OSArch
$Form1 = GUICreate("Form1", 596, 437, 590, 131)
$Button1 = GUICtrlCreateButton("全选", 48, 392, 57, 25)
$Button2 = GUICtrlCreateButton("取消", 136, 392, 65, 25)
$Button3 = GUICtrlCreateButton("安装", 228, 392, 65, 25)
$Label1 = GUICtrlCreateLabel("请选择程序", 328, 392, 64, 17)
$Label2 = GUICtrlCreateLabel("数据更新日：", 437, 400, 76, 17)
$Label3 = GUICtrlCreateLabel("作者：孙宝禄", 509, 400, 76, 17)
GUISetState(@SW_SHOW)
refreshListView()


Func refreshListView()

	$ListViewMenuitem = ""
	$ListViewMenuitem = IniRead($iniFile,"parameter","ListViewMenuitem","")
	$idListView = GUICtrlCreateListView($ListViewMenuitem, 16, 16, 561, 361)

	MsgBox("Information","listviewmenuitem",$DomainAdmin)
	$i=0
	$j=0
	$k=1
	$sDeptInf=""
	$ArrIniFile=IniReadSectionNames($iniFile)
	for $i= 1  to $ArrIniFile[0]
		$sDeptInf=IniRead($iniFile,$ArrIniFile[$i],"department","")

	Next




	#cs
	Local $hImage	=_GUIImageList_Create(16, 32)
	_GUIImageList_AddBitmap($hImage,"h:\blue.bmp")
	_GUICtrlListView_AddColumn($ListView1,"lista",100)
	_GUICtrlListView_AddColumn($ListView1,"listb",100)
	_GUICtrlListView_AddColumn($ListView1,"listh",100)
	_GUICtrlListView_SetImageList($ListView1,$hImage,1)
	_GUICtrlListView_AddItem($ListView1,"aaaaaaaa",$hImage)
	#ce



EndFunc








#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1

		Case $Button2

		Case $Button3



	EndSwitch
WEnd









