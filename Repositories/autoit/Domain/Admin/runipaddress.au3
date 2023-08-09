#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
#include <Security.au3>

FileCopy("\\172.26.32.251\softwa\pcsetup\domain\module\ipaddress.exe",@TempDir) ; \
$ipCommand=@TempDir & "\ipaddress.exe"
RunAsWait("administrator","cte.ad.local","Mitsumi@11",$RUN_LOGON_PROFILE, $ipCommand)




















































































