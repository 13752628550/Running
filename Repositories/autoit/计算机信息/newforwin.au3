#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <WinAPI.au3>
#include <array.au3>
$objWMIService = ObjGet("winmgmts:\\localhost\root\CIMV2")
$colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_NetworkAdapter  Where NetConnectionID IS NOT NULL", "WQL", 0x10 + 0x20)
$colDiskdrive=$objWMIService.ExecQuery("Select * from Win32_diskdrive")

$iCount=1
Local $arrDiskDrive[1][16]
for $object  in $colDiskdrive
	;if $object.interfacetype="usb" then
	;	ExitLoop
	;EndIf
	ReDim $arrDiskDrive[UBound($arrDiskDrive)+1][16]
	$arrDiskDrive[$iCount][0]=$object.size
	;$arrDiskDrive[$iCount][1]=$object.caption
	;$arrDiskDrive[$iCount][2]=$object.description
	;$arrDiskDrive[$iCount][3]=$object.deviceid
	;$arrDiskDrive[$iCount][4]=$object.index
	;$arrDiskDrive[$iCount][5]=$object.serialnumber
	;$arrDiskDrive[$iCount][6]=$object.interfacetype
	;$arrDiskDrive[$iCount][7]=$object.lasterrorcode
	;$arrDiskDrive[$iCount][8]=$object.manufacturer
	;$arrDiskDrive[$iCount][9]=$object.mediatype
	$arrDiskDrive[$iCount][10]=$object.model
	;$arrDiskDrive[$iCount][11]=$object.pnpdeviceid
	;$arrDiskDrive[$iCount][12]=$object.signature
	$arrDiskDrive[$iCount][13]=$object.status
	;$arrDiskDrive[$iCount][14]=$object.systemcreationclassname
	;$arrDiskDrive[$iCount][15]=$object.systemname

	$iCount=$iCount+1
Next
;_ArrayDisplay($arrDiskDrive,"arrdiskdrive")


$colOperatingSystem=$objWMIService.ExecQuery("SELECT * FROM Win32_OperatingSystem")
$iCount=1
Local $arrOperatingSystem[1][28]
for $object in $colOperatingSystem
	ReDim $arrOperatingSystem[UBound($arrOperatingSystem)+1][28]
	;$arrOperatingSystem[$iCount][0]=$object.buildtype
	;$arrOperatingSystem[$iCount][1]=$object.caption
	;$arrOperatingSystem[$iCount][2]=$object.countrycode
	;$arrOperatingSystem[$iCount][3]=$object.creationclassname
	;$arrOperatingSystem[$iCount][4]=$object.csdversion
	;$arrOperatingSystem[$iCount][5]=$object.csname
	;$arrOperatingSystem[$iCount][6]=$object.currenttimezone
	;$arrOperatingSystem[$iCount][7]=$object.description
	;$arrOperatingSystem[$iCount][8]=$object.installdate
	;$arrOperatingSystem[$iCount][9]=$object.lastbootuptime
	;$arrOperatingSystem[$iCount][10]=$object.locale
	;$arrOperatingSystem[$iCount][11]=$object.manufacturer
	;$arrOperatingSystem[$iCount][12]=$object.name
	;$arrOperatingSystem[$iCount][13]=$object.numberofusers
	;$arrOperatingSystem[$iCount][14]=$object.organization
	$arrOperatingSystem[$iCount][15]=$object.oslanguage
	;$arrOperatingSystem[$iCount][16]=$object.osproductsuite
	;$arrOperatingSystem[$iCount][17]=$object.ostype
	;$arrOperatingSystem[$iCount][18]=$object.othertypedescription
	;$arrOperatingSystem[$iCount][19]=$object.plusproductid
	;$arrOperatingSystem[$iCount][20]=$object.paeenabled
	;$arrOperatingSystem[$iCount][21]=$object.plusversionnumber
	;$arrOperatingSystem[$iCount][22]=$object.serialnumber
	;$arrOperatingSystem[$iCount][23]=$object.servicepackmajorversion
	;$arrOperatingSystem[$iCount][24]=$object.systemdirectory
	;$arrOperatingSystem[$iCount][25]=$object.servicepackminorversion
	$arrOperatingSystem[$iCount][26]=$object.status
	$arrOperatingSystem[$iCount][27]=$object.version
	$iCount=$iCount+1
Next


;_ArrayDisplay($arrOperatingSystem)

$colPhysicalMemory=$objWMIService.ExecQuery("SELECT * FROM Win32_PhysicalMemory")
$iCount=1
Local $arrPhysicalMemory[1][19]
;_ArrayDisplay($arrOperatingSystem)
;_ArrayDisplay($arrPhysicalMemory)
for $object in $colPhysicalMemory
	ReDim $arrPhysicalMemory[UBound($arrPhysicalMemory)+1][19]
	$arrPhysicalMemory[$iCount][0]=$object.banklabel
	$arrPhysicalMemory[$iCount][1]=$object.capacity
	$arrPhysicalMemory[$iCount][2]=$object.caption
	$arrPhysicalMemory[$iCount][3]=$object.creationclassname
	$arrPhysicalMemory[$iCount][4]=$object.datawidth
	$arrPhysicalMemory[$iCount][5]=$object.description
	$arrPhysicalMemory[$iCount][6]=$object.formfactor
	$arrPhysicalMemory[$iCount][7]=$object.installdate
	$arrPhysicalMemory[$iCount][8]=$object.manufacturer
	$arrPhysicalMemory[$iCount][9]=$object.memorytype
	$arrPhysicalMemory[$iCount][10]=$object.model
	$arrPhysicalMemory[$iCount][11]=$object.name
	$arrPhysicalMemory[$iCount][12]=$object.otheridentifyinginfo
	$arrPhysicalMemory[$iCount][13]=$object.partnumber
	$arrPhysicalMemory[$iCount][14]=$object.serialnumber
	$arrPhysicalMemory[$iCount][15]=$object.sku
	$arrPhysicalMemory[$iCount][16]=$object.speed
	$arrPhysicalMemory[$iCount][17]=$object.typedetail
	$arrPhysicalMemory[$iCount][18]=$object.status
	$iCount=$iCount+1
Next
_ArrayDisplay($arrPhysicalMemory)



















