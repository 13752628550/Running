#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
Global Const $osAr = @OSArch
Global Const $osVer = @OSVersion
;msgbox (0,"",$osAr)
;msgbox (0,"",$osVer)
If $osVer == "WIN_7" Then




	if $osAr="X64" Then
		$path="\\172.26.32.251\softwa\hotfix\Win7TLS1.2Enable\Windows7 SP1 (64bit) TLS 1.2\"
		runwait(@comspec & " /c" & "\\172.26.32.251\softwa\hotfix\Win7TLS1.2Enable\64bit\windows6.1-kb3140245-x64_5b067ffb69a94a6e5f9da89ce88c658e52a0dec0.msu /quiet /norestart")
		runwait(@comspec & " /c" & "copy /y \\172.26.32.251\softwa\hotfix\Win7TLS1.2Enable\64bit\win7-64bit-TLS1.2enableWinHttp.reg %temp%\")
		runwait(@comspec & " /c" & "reg import %temp%\win7-64bit-TLS1.2enableWinHttp.reg")
		;RunWait(@comspec & " /c" & "reg import \\172.26.32.251\softwa\hotfix\Win7TLS1.2Enable\64bit\win7-64bit-TLS1.2enableWinHttp.reg"
		runwait(@comspec & " /c" & "reg import %temp%\win7-64bit-TLS1.2enableWinHttp.reg")
		;RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\(管理部) FX ApeosPort-V C3373 T2\PrinterDriverData\UserInfo","SpecifyJobOwnerName_User","REG_SZ","EnterName")
		;regwrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\WinHttp","DefaultSecureProtocols","reg_dword","00000a80")

		local $ireturn6=runwait(@comspec & " /c" & "wmic qfe get hotfixid | findstr /i kb3140245")
		if $ireturn6="KB3140245" Then
			msgbox (0,"补丁安装提示","补丁安装成功！")
		Else
			msgbox (0,"补丁安装提示","补丁安装失败！")
		EndIf
		;runwait()
		;msgbox (0,"64","64位操作")
	Else
		$path="\\172.26.32.251\softwa\hotfix\Win7TLS1.2Enable\Windows7 SP1 (32bit) TLS 1.2\"
		runwait(@comspec & " /c" & "\\172.26.32.251\softwa\hotfix\Win7TLS1.2Enable\32bit\windows6.1-kb3140245-x86_cdafb409afbe28db07e2254f40047774a0654f18.msu /quiet /norestart")
		runwait(@comspec & " /c" & "copy /y \\172.26.32.251\softwa\hotfix\Win7TLS1.2Enable\32bit\win7-32bit-TLS1.2enableWinHttp.reg %temp%\")
		runwait(@comspec & " /c" & "reg import %temp%\win7-32bit-TLS1.2enableWinHttp.reg")
		local $ireturn7=runwait(@comspec & " /c" & "wmic qfe get hotfixid | findstr /i kb3140245")
		if $ireturn7="KB3140245" Then
			msgbox (0,"补丁安装提示","补丁安装成功！")
		Else
			msgbox (0,"补丁安装提示","补丁安装失败！")
		EndIf
		;runwait()
		;msgbox (0,"64_1","64_1位操作")
	EndIf
	;$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet 5200\x86\hpc520xc.inf"

Else

	msgbox(0,"补丁安装提示","不用安装补丁！")
	;$Path = "\\172.26.32.251\softwa\print\Driver\HP\LaserJet 5200\x64\hpc520xu.inf"
EndIf




































































































