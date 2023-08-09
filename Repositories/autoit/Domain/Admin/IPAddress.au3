#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <WinAPI.au3>
#include <array.au3>


























$objWMIService = ObjGet("winmgmts:\\localhost\root\CIMV2")
$colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled != 0", "WQL", 0x10 + 0x20)
$objWMIService8 = ObjGet("winmgmts:\\localhost\root\CIMV2")
$colItems8 = $objWMIService.ExecQuery("SELECT * FROM Win32_NetworkAdapter  Where NetConnectionID IS NOT NULL", "WQL", 0x10 + 0x20)
For $objItem In $colItems
	;If @error Then ExitLoop

	$DNSServer=$objItem.DNSServerSearchOrder

	If UBound ($DNSServer)<1 Then
		ContinueLoop
	EndIf
	for $i= 0 to 1 ;UBound ($DNSServer)
		if StringInStr("172.26.32.201172.16.129.4172.16.129.5",$DNSServer[$i]) > 0 Then
			$Macaddress6=""
			$Macaddress7=""
			;$DNSServer[$i]="172.26.32.36"
			$Macaddress6=$objItem.MACAddress
			For $objItem8 In $colItems8
				;If @error Then ExitLoop
				$Macaddress7=$objItem8.MACAddress

				if $Macaddress6=$Macaddress7 Then
					$ConnectionID=$objItem8.NetConnectionID
					if $i=0 Then
						$DNSServerChangeCommand="netsh interface ip set dnsserver """ & $ConnectionID & """ static 172.26.32.36 primary"
						$DNSServerChangeCommandO="netsh interface ip set dnsserver """ & $ConnectionID & """ static 172.26.32.37 index=2"
					EndIf
					msgbox ("","",$DNSServerChangeCommand & "-" & $DNSServerChangeCommandO)
				EndIf
				;msgbox ("","",$InterfaceIndex & " " & $interfaceMacAdd)
			Next
		EndIf

	Next












Next

