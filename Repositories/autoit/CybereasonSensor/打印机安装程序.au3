#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\au3script_v10.ico
#AutoIt3Wrapper_UseX64=n
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ColorConstants.au3>
#include <MsgBoxConstants.au3>
#include <array.au3>
#include <file.au3>
#include <constants.au3>
#include <stringconstants.au3>
;初始化程序变量


Local $iniFile = "\\172.26.32.251\softwa\pcsetup\domain\inifile\printer.ini"
Local $iniDepartment = @TempDir & "\" & "depSelect.ini"
Local $sUpdate = IniRead($iniFile,"parameter","update","")
Local $Domain = IniRead($iniFile,"parameter","Domain","")
Local $DomainAdmin = IniRead($iniFile,"parameter","DomainAdmin","")
Local $DomainPassword = IniRead($iniFile,"parameter","DomainPassword","")
Local $oldDomain = IniRead($iniFile,"parameter","oldDomain","")
Local $oldDomainAdmin = IniRead($iniFile,"parameter","oldDomainAdmin","")
Local $oldDomainPassword = IniRead($iniFile,"parameter","oldDomainPassword","")
Local $RegFilePath = IniRead($iniFile,"parameter","RegFilePath","")
Local $RegFileName = IniRead($iniFile,"parameter","RegFileName","")
Local $TempDir = @TempDir
Local $OSBit = @OSArch



;创建程序窗体
$Form1_1 = GUICreate("打印机安装Ver3", 396, 335, 671, 356)
;GUISetBkColor(0xFFFFFF)
$idCombox = GUICtrlCreateCombo("请选择部门", 16, 32, 201, 26, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
ComboInitial()
$OKButton = GUICtrlCreateButton("安   装", 227, 32, 73, 26)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
$PrinterList = GUICtrlCreateList("", 16, 72, 361, 213,BitOR($WS_VSCROLL,$WS_HSCROLL))
GUICtrlSetFont($PrinterList,10,700)
;GUICtrlSetBkColor($PrinterList,0x99CCCC)
GUICtrlSetColor($PrinterList,0x0078D7) ;0xFF0033
$Label7 = GUICtrlCreateLabel("数据更新日:" & $sUpdate, 22, 304, 135, 17)
$Label8 = GUICtrlCreateLabel("程序: 孙宝禄", 233, 304, 87, 17)
$MangePrintButton = GUICtrlCreateButton("管理打印机", 304, 32, 73, 26)
GUICtrlSetFont(-1, 9, 400, 0, "MS Sans Serif")
GUISetState(@SW_SHOW)

;创建组合框控件
Func ComboInitial()
	Local $i,$j,$k=1
	Local $ArrIniFile=IniReadSectionNames($iniFile)
	Local $ArrDeptInf[1]
	if Not @error Then
		for $i= 1 to $ArrIniFile[0]
			$sDeptInf=IniRead($iniFile,$ArrIniFile[$i],"department","")
			if $sDeptInf="" Then
				ContinueLoop
			EndIf
			local $sLogic="false"
			for $j = 1 to UBound($ArrDeptInf)-1
				if $sDeptInf=$ArrDeptInf[$j] Then
					$sLogic="true"
				EndIf
			Next
			if $slogic="false" Then
				ReDim $ArrDeptInf[ubound($ArrDeptInf)+1]
				$ArrDeptInf[$k]=$sDeptInf
				$k=$k+1
			EndIf
		Next
	EndIf
	;_ArrayDisplay($ArrDeptInf)
	for $i= 1 to UBound($ArrDeptInf)-1
		GUICtrlSetData($idCombox,$ArrDeptInf[$i])
		GUICtrlSetFont($idCombox,13,1000)
		;GUICtrlSetBkColor($idCombox,0x336699)
		GUICtrlSetColor($idCombox,0x0078D7)
	Next
EndFunc



;组合框部门选择更新
Func ComboSelected(ByRef $sComboValue, ByRef $sCombocheck)
	FileDelete($iniDepartment)
	$i=0
	$j=0
	$k=1
	$sDeptInf=""
	$ArrIniFile=IniReadSectionNames($iniFile)
	for $i= 1  to $ArrIniFile[0]
		$sDeptInf=IniRead($iniFile,$ArrIniFile[$i],"department","")
		if $sDeptInf= $sComboValue Then
			IniWrite($iniDepartment,$j,"update",IniRead($iniFile,$ArrIniFile[$i],"update",""))
			IniWrite($iniDepartment,$j,"department",IniRead($iniFile,$ArrIniFile[$i],"department",""))
			IniWrite($iniDepartment,$j,"SetPrinterIP",IniRead($iniFile,$ArrIniFile[$i],"SetPrinterIP",""))
			IniWrite($iniDepartment,$j,"SetPrinterDrive",IniRead($iniFile,$ArrIniFile[$i],"SetPrinterDrive",""))
			IniWrite($iniDepartment,$j,"SetPrinterCommand",IniRead($iniFile,$ArrIniFile[$i],"SetPrinterCommand",""))
			IniWrite($iniDepartment,$j,"disPrinterName",IniRead($iniFile,$ArrIniFile[$i],"disPrinterName",""))
			IniWrite($iniDepartment,$j,"drvPathX64",IniRead($iniFile,$ArrIniFile[$i],"drvPathX64",""))
			IniWrite($iniDepartment,$j,"drvPathX86",IniRead($iniFile,$ArrIniFile[$i],"drvPathX86",""))
			IniWrite($iniDepartment,$j,"X64FileName",IniRead($iniFile,$ArrIniFile[$i],"X64FileName",""))
			IniWrite($iniDepartment,$j,"X86FileName",IniRead($iniFile,$arrinifile[$i],"X86FileName",""))
			$j=$j+1
			$k=$k+1
		EndIf
	Next
EndFunc

;刷新打印机显示
Func PrintRefresh()
	$getCount=_GUICtrlListBox_GetCount($PrinterList)
	;MsgBox("","",$getCount)
	if $getCount<>0 Then
		for $i=1 to $getCount
			_GUICtrlListBox_DeleteString($PrinterList,0)
		Next
	EndIf
	if GUICtrlRead($idCombox)<> "请选择部门" Then
		$ArrTmpFile=IniReadSectionNames($iniDepartment)
		$i=0
		$j=0
		$k=1
		for $i=1 to $ArrTmpFile[0]
			$sPrintInf=IniRead($iniDepartment,$ArrTmpFile[$i],"disPrinterName","")
			_GUICtrlListBox_InsertString($PrinterList,$sPrintInf,-1)
			_GUICtrlListBox_SetItemHeight($PrinterList,19)
			$j=$j+1
			$k=$k+1
			;msgbox ("","",$ArrTmpFile[$i] & $sPrintInf)
		Next
	EndIf
EndFunc



;用户选择操作
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $idCombox
			$sComboValue=GUICtrlRead($idCombox)
			$sCombocheck="6"
			ComboSelected($sComboValue,$sCombocheck)
			;msgbox ("","",GUICtrlRead($idCombox))
			PrintRefresh()
		Case $PrinterList
			;MsgBox ("","",$PrinterList)
		Case $OKButton
			$sPrinterSelect=_GUICtrlListBox_GetCurSel($PrinterList)
			Local $department="",$SetPrinterIP="",$SetPrinterDrive="",$SetPrinterCommand="",$disPrinterName="" ,$drvpathserver=""
			Local $drvPathX64="",$X64FileNmae="", $drvPathX86="",      $X86FileName="",     $sSetPrinterCommand="", $drvPathLocal= ""
			if $sPrinterSelect>= 0 Then
				ProgressOn("处理中请稍候...", "", "", 100, 100, 2 + 16)
				GUICtrlSetState($OKButton,128)
				ProgressSet(10,"已完成 10%","正在加载程序")
				LoadingPrint()
				ProgressSet(30,"已完成 30%","添加打印机地址")
				AddPortWindows($SetPrinterIP)
				ProgressSet(60,"已完成 60%","添加打印机")
				InstallPrint()
				ProgressSet(80,"已完成 80%","设置打印机")
				Select
					Case $SetPrinterCommand=""

					Case $SetPrinterCommand="CardNum_Xerox"
						CardNum_Xerox()
					Case $SetPrinterCommand="CardNum_Ricoh"
						CardNum_Ricoh()
				EndSelect
				GUICtrlSetState($OKButton,64)
				ProgressOff()
			EndIf
		Case $MangePrintButton
			$sDomain= @LogonDomain
			Switch $sDomain
				Case $oldDomain
					RunAsWait($oldDomainAdmin,$oldDomain,$oldDomainPassword,0,@ComSpec & " /c " & "RUNDLL32 SHELL32.DLL,SHHelpShortcuts_RunDLL PrintersFolder" ,"",@SW_HIDE)
				Case $Domain
					RunAsWait($DomainAdmin,$Domain,$DomainPassword,0,@ComSpec & " /c " & "RUNDLL32 SHELL32.DLL,SHHelpShortcuts_RunDLL PrintersFolder" ,"",@SW_HIDE)
				Case Else
					RunWait(@ComSpec & " /c" & "RUNDLL32 SHELL32.DLL,SHHelpShortcuts_RunDLL PrintersFolder" ,"",@SW_HIDE)
			EndSwitch
	EndSwitch
WEnd



;添加打印机端口
Func AddPortWindows($IPAddress)
	$OSVer = @OSVersion
	$sFileName = $TempDir & "\" & $RegFileName
	Switch $OSVer
		Case "WIN_7"

		Case "WIN_10"

		Case Else
			MsgBox($MB_ICONINFORMATION + $MB_OK,"提示框","当前操作系统不能安装！ " & "(" & $OSVer & ")")
			Exit
	EndSwitch
	FileDelete($sFileName)
	FileCopy($RegFilePath & $RegFileName,$sFileName,1)
	_ReplaceStringInFile($sFileName,"172.26.36",$IPAddress,2)
	$sCommandString1 = "regedit /s " & $sFileName
	RunasString($sCommandString1,"Windows")
	$sCommandString2 = "net stop spooler>nul"
	RunasString($sCommandString2,"Windows")
	$sCommandString3 = "net start spooler>nul"
	RunasString($sCommandString3,"Windows")
EndFunc



;管理员执行程序
Func RunasString($CommandStringWindows,$CommandStringCatagory)
	$sDomain = @LogonDomain
	If $CommandStringCatagory = "Windows" Then
		Switch $sDomain
			Case $oldDomain
				;MsgBox("3","1",$CommandStringWindows)
				RunAsWait($oldDomainAdmin,$oldDomain,$oldDomainPassword,0,@ComSpec & ' /c "' & $CommandStringWindows & '" ',"",@SW_HIDE)
			Case $Domain
				;MsgBox("3","2",$CommandStringWindows)
				RunAsWait($DomainAdmin,$Domain,$DomainPassword,0,@ComSpec & ' /c "' & $CommandStringWindows & '" ',"",@SW_HIDE)
			Case Else
				;MsgBox("3","3",$CommandStringWindows)
				RunWait(@ComSpec & " /c " & '"' &  $CommandStringWindows & '" ',"",@SW_HIDE)
		EndSwitch

	Else
		;测试代码信息
	EndIf



EndFunc



;加载打印机配置
Func LoadingPrint()
	$department= IniRead($iniDepartment,$sPrinterSelect,"department","")
	$SetPrinterIP= IniRead($iniDepartment,$sPrinterSelect,"SetPrinterIP","")
	$SetPrinterDrive= IniRead($iniDepartment,$sPrinterSelect,"SetPrinterDrive","")
	$SetPrinterCommand= IniRead($iniDepartment,$sPrinterSelect,"SetPrinterCommand","")
	$disPrinterName= IniRead($iniDepartment,$sPrinterSelect,"disPrinterName","")
	If $OSBit= "X86" Then
		$drvPathServer= IniRead($iniDepartment,$sPrinterSelect,"drvPathX86","")
		$drvPathLocal= $TempDir & "\" & IniRead($iniDepartment,$sPrinterSelect,"X86FileName","")

	Else
		$drvPathServer= IniRead($iniDepartment,$sPrinterSelect,"drvPathX64","")
		$drvPathLocal= @TempDir & "\" & IniRead($iniDepartment,$sPrinterSelect,"X64FileName","")
	EndIf
EndFunc



;安装打印机
Func InstallPrint()
	;MsgBox(3,"information",$drvPathServer)
	FileCopy($drvpathserver & "*" ,$TempDir,1)
	;If @error Then
	;	MsgBox(3,"Information","文件复制成功")
	;Else
	;	MsgBox(3,"Information","没有文件复制")
	;EndIf
	$sCommandString = "rundll32 printui.dll,PrintUIEntry /if /b " & '"' & $disPrinterName & '"' & " /f " & $drvPathLocal & " /r " & $SetPrinterIP & " /m " & '"' & $SetPrinterDrive & '"'
	RunasString($sCommandString,"Windows")
	$sCommandString = "rundll32 printui.dll,PrintUIEntry /y /n " & '"' & $disPrinterName & '"'
	RunWait($sCommandString)
	Sleep(300)
	RunWait("RUNDLL32 SHELL32.DLL,SHHelpShortcuts_RunDLL PrintersFolder")
	Sleep(500)
	Send("{F5}");需要刷新窗口，才能显示新添加的打印机
EndFunc


;CardNum_Xerox 打印机刷卡设置
Func CardNum_Xerox()
	$CardNum= InputBox("请输入卡号","打印卡号码:")
	If $CardNum = 0 then
		msgbox (0,"提示","输入卡号不成功")
	Else
		FileDelete($TempDir & "\" & "CardNum.reg")
		FileCopy("\\172.26.32.251\softwa\print\Driver\Xerox\CardNum.reg",$TempDir,1)
		_ReplaceStringInFile($TempDir & "\" & "CardNum.reg","disPrinterName",$disPrinterName,2)
		_ReplaceStringInFile($TempDir & "\" & "CardNum.reg","CardNum",$CardNum,2)
		$sCommandString= "regedit /s " & $TempDir & "\" & "CardNum.reg"
		RunasString($sCommandString,"Windows")
	EndIf
EndFunc


;CardNum_Ricoh 打印机属性项目设置
Func CardNum_Ricoh()
	$regPath = "\\172.26.32.251\softwa\print\Driver\Ricoh\IMC3000\"
	Local $regFile1 = "Black.reg"
	Local $regFile2 = "UserName.reg"
	FileDelete($TempDir & "\" & $regFile1)
	FileDelete($TempDir & "\" & $regfile2)
	FileCopy($regPath & $regFile1,$TempDir,1)
	FileCopy($regPath & $regFile2,$TempDir,1)
	_ReplaceStringInFile($TempDir & "\" & $regFile1,"disPrinterName",$disPrinterName,2)
	_ReplaceStringInFile($TempDir & "\" & $regfile2,"disPrinterName",$disPrinterName,2)
	;执行添加操作
	RunasString("regedit /s " & $TempDir & "\" & $regFile2 ,"Windows")
	RunWait(@ComSpec & " /c " & "regedit /s " & $TempDir & "\" & $regFile1 )

EndFunc





































































































































































































































































































































































































































































