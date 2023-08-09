#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\au3script_v9.ico
#AutoIt3Wrapper_outfile=����������.Exe
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GUIListView.au3>
#include <ListViewConstants.au3>
#Region ### START Koda GUI section ### Form=h:\design\autoit\������û�����\computer.kxf
$Form1 = GUICreate("Computer", 529, 203, 689, 440)
$Group1 = GUICtrlCreateGroup("���ļ������", 18, 14, 488, 141)
$Label1 = GUICtrlCreateLabel("������", 50, 47, 40, 17)
$Label2 = GUICtrlCreateLabel("�û���", 251, 47, 40, 17)
$Label3 = GUICtrlCreateLabel("�����ַ", 50, 84, 52, 17)
$Label4 = GUICtrlCreateLabel("ϵͳ����", 251, 82, 52, 17)
$Label5 = GUICtrlCreateLabel("�����", 50, 118, 40, 17)
$InputComputer = GUICtrlCreateInput("", 111, 46, 108, 21)
$InputUsername = GUICtrlCreateInput("", 312, 45, 115, 21)
$InputIPAddr = GUICtrlCreateInput("", 113, 82, 106, 21)
$InputCurDomain = GUICtrlCreateInput("", 113, 115, 107, 21)
$ComboLangan = GUICtrlCreateCombo("", 314, 82, 113, 25)
GUICtrlSetData(-1, "����|����")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button1 = GUICtrlCreateButton("ִ��", 385, 160, 82, 32)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


























;��������ѡ��
$strPathReg="HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nls\Language"
$strPathReg1="HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Nls\Language\Locale"
$Chinese="0804"
$Japanese="0411"
$Keyword="default"
$Keyword1="(default)"
$strCurLanguage=""
;�����������ѡ��
$strComputer = @ComputerName
$strComputerNew=""
;�������ѡ��
$strDomain="CTE.AD.LOCAL"
$strPassword="Mitsumi@11"
$strUser="ADMINISTRATOR"
$strPasswordLocal="cte.sys.admin"
$strUserLocal="ADMINISTRATOR"
$strUserNumber=""
;��������ѡ��
$strNetwork=""
$strIpaddress="172.26.32."
$strGateWay=""
;����ϵͳ��װ
$strInstallChs=""
$strInstallJpn=""
$strInstallDir=""
;ϵͳ����ָ��
$strCommand1="netdom renamecomputer " & $strComputer & " /newname:" & $strComputerNew & " /force /reboot "
$strCommand2="netdom join " & $strComputerNew & " /domain:" & $strDomain & " /userd:" & $strUser & " /passwordd:" & $strPassword
$strCommand3="net localgroup /add "
$strCommand4="set address name="
$strCommand5=$strInstallDir & " \setup "

GUICtrlSetData($InputComputer,@ComputerName)
GUICtrlSetData($InputUsername,@UserName)
GUICtrlSetData($InputCurDomain,@LogonDomain)
GUICtrlSetData($InputIPAddr,@IPAddress1)
$strCurLanguage=RegRead($strPathReg,$Keyword)
select
	Case $strCurLanguage=$Chinese
		GUICtrlSetData($ComboLangan,"����")
	Case $strCurLanguage=$Japanese
		GUICtrlSetData($ComboLangan,"����")
	Case Else
		GUICtrlSetData($ComboLangan,"")
EndSelect


;GUICtrlSetData($ComboLangan,"����")
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			Computer()
			;Domain()
	EndSwitch
WEnd

Func Domaina()
	If $strDomain=@LogonDomain Then
		Exit
	EndIf
	$strPing=Ping("172.26.32.36",60)
		If $strPing=0 Then
		MsgBox(64,"Error","Please check network!")
		Exit
	EndIf
	;�¼�������Ƽ���
	$strComputerNew="P0001566666666666"
	$ReturnValue =@LogonDomain
	If $Returnvalue = 0 Then
        MsgBox(64,"Information","Joindomain sucessful.")
	Else
		MsgBox(64,"Information","Joindomain failed.")
		Exit
	EndIf
	#cs

	#ce


EndFunc

Func Computer()
	$strComputerNew=GUICtrlRead($InputComputer)
	$strCommand1="netdom renamecomputer " & $strComputer & " /newname:" & $strComputerNew & " /force /reboot "
	MsgBox(64,"strComputerNew",$strComputerNew)
	If $strComputer=$strComputerNew Then
		Exit
	EndIf
	MsgBox(64,"StrCommand1",$strCommand1)
	RunWait(@ComSpec & " /c " & $strCommand1,"",@SW_HIDE)



















EndFunc


















































