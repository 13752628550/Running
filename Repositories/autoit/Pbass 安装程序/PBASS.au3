#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>
#include <ColorConstants.au3>
#Region ### START Koda GUI section ### Form=H:\Design\autoit\Pbass ��װ����\windows.kxf
$Form2 = GUICreate("PBASS 安装", 361, 291, 765, 468)
$GroupBox1 = GUICtrlCreateGroup("", 22, 25, 305, 204)
$Label1 = GUICtrlCreateLabel("番号：", 45, 51, 40, 17)
$Label2 = GUICtrlCreateLabel("用户名：", 43, 91, 52, 17)
$Label4 = GUICtrlCreateLabel("打印机：", 43, 156, 52, 17)
$Label3 = GUICtrlCreateLabel("端末名：", 44, 127, 52, 17)
$Input1= GUICtrlCreateInput(@UserName, 92, 46, 121, 21)
$Label6 = GUICtrlCreateLabel("Label6", 107, 92, 136, 17)
$Label7 = GUICtrlCreateLabel("Label7", 107, 126, 99, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Label8 = GUICtrlCreateLabel("Label8", 107, 156, 99, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Button2 = GUICtrlCreateButton("刷新", 238, 48, 39, 22)
$Label9 = GUICtrlCreateLabel("备用端末：", 43, 189, 64, 17)
$Label10 = GUICtrlCreateLabel("Label10", 108, 189, 99, 17)
GUICtrlSetFont(-1, 8, 800, 0, "MS Sans Serif")
$Button3 = GUICtrlCreateButton("<= 生成", 216, 126, 66, 21) 
$Button4 = GUICtrlCreateButton("<= 生成", 216, 156, 66, 22) 
$Button5 = GUICtrlCreateButton("<= 生成", 216, 186, 66, 22) 
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button1 = GUICtrlCreateButton("一键全部生成", 26, 237, 81, 25, 0)
$Label5 = GUICtrlCreateLabel("Author: Sun Baolu",128, 239, 287, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
$UsrNum=""
$UsrNam=""
$WorkStation=""
$BakWorkStation=""
$Printer=""
$Update=""
$IP=@IPAddress1
$Computer=@ComputerName
$iniFil="\\172.26.32.251\softwa\pcsetup\Pbass\inifile.ini"
$wksFil="\\172.26.32.251\softwa\pcsetup\Pbass\WorkStation.ws"
$wksBakFil="\\172.26.32.251\softwa\pcsetup\Pbass\BakWorkStation.ws"
$priFil="\\172.26.32.251\softwa\pcsetup\Pbass\Printer.ws"
flash()

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			;~ flash()
			Printer()
			WorkStation("Wrk")
			WorkStation("Bak")
		Case $Button2
			flash()
		Case $Button3
			;~ flash()
			WorkStation("Wrk")
		Case $Button4
			;~ flash()
			Printer()
		Case $Button5
			;~ flash()
			WorkStation("Bak")
	EndSwitch
WEnd
Func flash()
	$UsrNum=GUICtrlRead($Input1)
	$UsrNam=IniRead($iniFil,$UsrNum,"USERNAME","")
	$WorkStation=iniread($iniFil,$UsrNum,"WorkStationID","")
	$BakWorkStation=iniread($iniFil,$UsrNum,"BakWorkStationID","")
	$Printer=IniRead($iniFil,$UsrNum,"Printer","")
	GUICtrlSetData($Label6 ,$UsrNam)
	GUICtrlSetData($Label7 ,$WorkStation)
	GUICtrlSetData($Label8 ,$Printer)
	GUICtrlSetData($Label10 ,$BakWorkStation)
EndFunc

func WorkStation($iValueWrk)
	;~ MsgBox("","",$iValueWrk)
	If $iValueWrk= "Wrk" Then
		If $WorkStation= ""  Then
			Return
		EndIf
		$i=FileCopy($wksFil,@DesktopDir&"\"&$WorkStation&".ws",1)
		$j=IniWrite(@DesktopDir&"\"&$WorkStation&".ws","5250","WorkStationID",$WorkStation) 
		IniWrite(@DesktopDir&"\"&$WorkStation&".ws","Window","UserTitle",$WorkStation) 
 		If $i+$j >=2 Then
			MsgBox($MB_ICONINFORMATION,"提示","端末创建成功")
		Else
 			MsgBox($MB_ICONERROR,"提示","端末失败请联络管理员 ")
 			Return
 		EndIf
	ElseIf $iValueWrk= "Bak" Then
		If $BakWorkStation= ""  Then
			Return
		EndIf
		$i=FileCopy($wksFil,@DesktopDir&"\"&$BakWorkStation&".ws",1)
		$j=IniWrite(@DesktopDir&"\"&$BakWorkStation&".ws","5250","WorkStationID",$BakWorkStation) 
		IniWrite(@DesktopDir&"\"&$BakWorkStation&".ws","Window","UserTitle",$BakWorkStation) 
 		If $i+$j >=2 Then
			MsgBox($MB_ICONINFORMATION,"提示","备用端末创建成功")
		Else
 			MsgBox($MB_ICONERROR,"提示","备用端末创建失败，请联络管理员 ")
 			Return
 		EndIf		
	EndIf
	
	
EndFunc

func Printer()
	$i=FileCopy($priFil,@DesktopDir&"\"&$Printer&".ws",1)
	$k=IniWrite(@DesktopDir&"\"&$Printer&".ws","5250","WorkStationID",$Printer)
	IniWrite(@DesktopDir&"\"&$Printer&".ws","Window","UserTitle",$Printer)
	if $i + $k >= 2 then
		MsgBox($MB_ICONINFORMATION,"提示","打印机创建成功")
	Else
		MsgBox($MB_ICONERROR,"提示","打印机端创建失败，请联络管理员 ")
		Return
	EndIf
EndFunc



;~ func Install()
;~ 	flash()
;~ 	
;~
;~ 	
;~	
;~ 
;~
;~ 	
;~ 	
;~ 	
;~ 	
;~ 	
;~ 	
;~ 		
;~ 		
;~ 	
;~ 	
;~ 	
;~ 	
;~ 		
;~ 	
;~ 		
;~ 	If $i=0 Then
;~ 		MsgBox($MB_ICONERROR,"��Ϣ","��ӡ���������⣡ ")
;~ 		Return
;~ 	EndIf
;~ 	
;~ 	$Update=@YEAR&"/"&@MON&"/"&@MDAY & " "& @HOUR&":"&@MIN&":"&@SEC
;~ 	IniWrite($iniFil,$UsrNum,"ip",$IP)
;~ 	IniWrite($iniFil,$UsrNum,"update",$Update)
;~ 	IniWrite($iniFil,$UsrNum,"logon",@UserName)
;~ 	IniWrite($iniFil,$UsrNum,"computer",$Computer)

;~ EndFunc