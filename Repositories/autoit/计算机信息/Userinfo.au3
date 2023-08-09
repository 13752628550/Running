#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\au3script_v10.ico
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#NoTrayIcon


$g_szVersion = "userinfo"
If WinExists($g_szVersion) Then Exit
AutoItWinSetTitle($g_szVersion)
hotkeyset("!h","_exiwhile")
Global $objWMIService,$colBios,$colBoard,$colSettings,$colMemory,$colCPU,$colVideoinfo,$colSound ,$colNIC,$colDiskdrive,$colSystemEnclosure
Global $CPU,$Bios,$Board,$Display,$Sound,$Network,$Mem,$Model,$SerialNumber,$DiskDrive,$Vendor,$sCodeDesc_Chs,$sCode




_showrun()

while 1
	sleep(18678789)
	_showrun()
wend

Func _showrun()

$IniFile="\\172.26.32.251\softwa\pcsetup\inifile\Computer.ini"
$Computername=@ComputerName
$IPaddress=@IPAddress1 & " " & @IPAddress2 & " " & @IPAddress3 & " "
$Username=@UserName
$System=@OSVersion
$OSArch=@OSArch
$CHKDate=@YEAR  & @MON &  @MDAY
$OSServicePack=@OSServicePack
Local $object,$objOperatingSystem
$objWMIService = objget("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
$colBios = $objWMIService.ExecQuery("Select * from Win32_BIOS")
$colBoard = $objWMIService.ExecQuery("SELECT * FROM Win32_BaseBoard")
$colSettings = $objWMIService.ExecQuery("Select * from Win32_OperatingSystem")
$colMemory = $objWMIService.ExecQuery("Select * from Win32_ComputerSystem")
$colCPU = $objWMIService.ExecQuery("Select * from CIM_Processor")
$colVideoinfo = $objWMIService.ExecQuery("Select * from Win32_VideoController")
$colSound = $objWMIService.ExecQuery("Select * from Win32_SoundDevice")
;$colNIC = $objWMIservice.ExecQuery("Select * from Win32_NetworkAdapter WHERE Netconnectionstatus = 78")
$colMemory = $objWMIService.ExecQuery("Select * from Win32_ComputerSystem")
$colDiskdrive=$objWMIService.ExecQuery("Select * from Win32_diskdrive")
$colSystemEnclosure =$objWMIService.ExecQuery("SELECT ChassisTypes FROM Win32_SystemEnclosure")


For $object in $colCPU
        $CPU= StringStripWS($object.Name,1)
Next

For $object in $colBios
        $Bios=StringMid($object.Caption,1)
		$SerialNumber=StringMid($object.SerialNumber,1)
		$Vendor=StringMid($object.Manufacturer,1)
Next

For $object in $colBoard
        $Board=$object.Product
Next

For $object in $colVideoinfo
        $Display=StringStripWS($object.Description ,1)
Next

For $object in $colSound
        $Sound=StringStripWS($object.Description ,1)
Next

;For $object in $colNIC
;        $Network=StringStripWS($object.name ,1)

;Next

for $object  in $colMemory
        $Mem=String(Int(Number($object.TotalPhysicalMemory) / (1024 * 1024))) & " MB"
		$Model=StringMid($object.model,1)
Next

for $object  in $colDiskdrive
        $DiskDrive=String(Int(Number($object.size) / (1024 * 1024 * 1024))) & " GB"
Next

for $object In $colSystemEnclosure
	For $sCode in $object.chassistypes
		Switch $sCode
			Case 1
				$sCodeDesc_Chs = "Other"
				if stringinstr($model,"Virtual",0) then $sCodeDesc_Chs="Virtual Machine"
			Case 2
				$sCodeDesc_Chs ="Unknown"
			Case 3
				$sCodeDesc_Chs = "Desktop"
				if stringinstr($model,"Virtual",0) then $sCodeDesc_Chs="Virtual Machine"
			case 4
				$sCodeDesc_Chs = "Low Profile Desktop"
			Case 5
				$sCodeDesc_Chs = "Pizza Box"
			Case 6
				$sCodeDesc_Chs = "Mini Tower"
			Case 7
				$sCodeDesc_Chs = "Tower"
			Case 8
				$sCodeDesc_Chs = "Portable"
			Case 9
				$sCodeDesc_Chs = "Laptop"
			Case 10
				$sCodeDesc_Chs = "Notebook"
			Case 11
				$sCodeDesc_Chs = "Hand Held"
			Case 12
				$sCodeDesc_Chs = "Docking Station"
			Case 13
				$sCodeDesc_Chs = "All in One"
			Case 14
				$sCodeDesc_Chs = "Sub Notebook"
			Case 15
				$sCodeDesc_Chs = "Space-Saving"
			Case 16
				$sCodeDesc_Chs = "Lunch Box"
			Case 17
				$sCodeDesc_Chs = "Main System Chassis"
			Case 18
				$sCodeDesc_Chs = "Expansion Chassis"
			Case 19
				$sCodeDesc_Chs = "SubChassis"
			Case 20
				$sCodeDesc_Chs = "Bus Expansion Chassis"
			Case 21
				$sCodeDesc_Chs = "Peripheral Chassis"
			Case 22
				$sCodeDesc_Chs = "RAID Chassis"
			Case 23
				$sCodeDesc_Chs = "Rack Mount Chassis"
			Case 24
				$sCodeDesc_Chs = "Sealed-case PC"
			case 25
				$sCodeDesc_Chs = "Multi-system chassis"
			case 26
				$sCodeDesc_Chs = "Compact PCI"
			case 27
				$sCodeDesc_Chs = "Advanced TCA"
			case 28
				$sCodeDesc_Chs = "Blade"
			case 29
				$sCodeDesc_Chs = "Blade Enclosure"
			case 30
				$sCodeDesc_Chs = "Tablet"
			case 31
				$sCodeDesc_Chs = "Convertible"
			case 32
				$sCodeDesc_Chs = "Detachable"
			case 33
				$sCodeDesc_Chs = "IoT Gateway"
			case 34
				$sCodeDesc_Chs = "Embedded PC"
			case 35
				$sCodeDesc_Chs = "Mini PC"
			case 36
				$sCodeDesc_Chs = "Stick PC"
			Case Else  ;2
				$sCodeDesc_Chs = "Unknown"
		EndSwitch
	Next
Next




iniwrite($IniFile,$Computername,"Username",$Username)
iniwrite($IniFile,$Computername,"IPaddress",$IPaddress)
iniwrite($IniFile,$Computername,"System",$System)
iniwrite($IniFile,$Computername,"OSArchitecture",$OSArch)
iniwrite($IniFile,$Computername,"CHKDate",$CHKDate)
iniwrite($IniFile,$Computername,"CPU",$CPU)
iniwrite($IniFile,$Computername,"Bios",$Bios)
iniwrite($IniFile,$Computername,"Board",$Board)
iniwrite($IniFile,$Computername,"Display",$Display)
iniwrite($IniFile,$Computername,"Sound",$Sound)
iniwrite($IniFile,$Computername,"Mem",$Mem)
iniwrite($IniFile,$Computername,"Model",$Model)
iniwrite($IniFile,$Computername,"SerialNumber",$SerialNumber)
iniwrite($IniFile,$Computername,"DiskSize",$DiskDrive)
iniwrite($IniFile,$Computername,"OSServicePack",$OSServicePack)
iniwrite($IniFile,$Computername,"vendor",$Vendor)
iniwrite($IniFile,$Computername,"Description",$sCodeDesc_Chs)
;msgbox (0,"", $CPU& " " & $bios& " " & $board & " " & $display & " " & $sound & " " & $network & " " & $mem & " " & $model  & " " & $SerialNumber & $DiskDrive)
EndFunc


func _exiwhile()
	Exit

EndFunc



















































































