#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_Icon=Design\vSphere\VMware-VCSA-all-6.5.0-7312210(1)\vcsa-ui-installer\mac\Installer.app\Contents\Resources\app\images\vSphere-32x.ico
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#include <File.au3>
#include <array.au3>
#include <MsgBoxConstants.au3>
$g_szVersion = "userinfo"
If WinExists($g_szVersion) Then Exit
AutoItWinSetTitle($g_szVersion)
hotkeyset("!h","_exiwhile")
$filePath="N:\@車載製品部\車載製造部指令室放送資料"
$SleepNum=30*1000
Local $aFileListExcel = _FileListToArray($filePath, "*.xls*",1)
Local $aFileListExcelAll[1]
$i=1
$j=1
$k=1
;_ArrayDisplay($aFileList)
for $i=1 to $aFileListExcel[0]
	if StringLeft($aFileListExcel[$i],1)<> "~" Then
		ReDim $aFileListExcelAll[UBound($aFileListExcelAll)+1]
		$aFileListExcelAll[$j]=$aFileListExcel[$i]
		$j=$j+1
	EndIf
Next
;_ArrayDisplay($aFileListExcelAll)
Local $aFileListPPT = _FileListToArray($filePath, "*.ppsx",1)
Local $aFileListPPTAll[1]
$i=1
$j=1
$k=1
;_ArrayDisplay($aFileList)
for $i=1 to $aFileListPPT[0]
	if StringLeft($aFileListPPT[$i],1)<> "~" Then
		ReDim $aFileListPPTAll[UBound($aFileListPPTAll)+1]
		$aFileListPPTAll[$j]=$aFileListPPT[$i]
		$j=$j+1
	EndIf
Next
;_ArrayDisplay($aFileListPPTAll)

Local $ExcelTitle[UBound($aFileListExcelAll)]
;_ArrayDisplay($ExcelTitle)

for $i=1 to UBound($aFileListExcelAll)-1
	;ShellExecute ($aFileListExcel[$i])
	;ReDim $ExcelTitle[UBound[$ExcelTitle]+1]
	if $i=1 Then
		$ExcelTitle[$i]= $aFileListExcelAll[$i]
	Else
		$ExcelTitle[$i]= $aFileListExcelAll[$i]
	EndIf
	MsgBox ("","",$i)
Next
;_ArrayDisplay($ExcelTitle)

Local $PowerTitle[UBound($aFileListPPTAll)]
for $i=1 to UBound($aFileListPPTAll)-1
	;ShellExecute ($aFileListPPT[$i])
	;ReDim $PowerTitle[UBound[$PowerTitle]+1]
	if $i=1 Then
		$PowerTitle[$i]= $aFileListPPTAll[$i]
	Else
		$PowerTitle[$i]= $aFileListPPTAll[$i]
	EndIf
Next
;_ArrayDisplay($PowerTitle)

for $i=1 to UBound($ExcelTitle)-1
	if WinExists($ExcelTitle[$i])=0 Then
	    MsgBox("","",$ExcelTitle[$i])
		ShellExecute($filePath & "\" & $ExcelTitle[$i])
		WinSetState($ExcelTitle[$i],"",@SW_MAXIMIZE)
	EndIf
Next

for $i=1 to UBound($PowerTitle)-1
	if WinExists($PowerTitle[$i])=0 Then
		ShellExecute($filePath & "\" & $PowerTitle[$i])
		WinSetState($PowerTitle[$i],"",@SW_MAXIMIZE)
	EndIf
Next

while 1

	for $i=1 to UBound($ExcelTitle)-1
		WinActivate($ExcelTitle[$i])
		Sleep($SleepNum)
	Next
	for $i=1 to UBound($PowerTitle)-1
		WinActivate($PowerTitle[$i])
		Send("{HOME}")
		Send("{ENTER}")
		Sleep($SleepNum)
	Next
WEnd
func _exiwhile()
	Exit
EndFunc




















































































