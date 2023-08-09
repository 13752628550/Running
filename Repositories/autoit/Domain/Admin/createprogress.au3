#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
Example()



















































Func Example()

    $Proform=GUICreate("60秒重启计算机", 233, 100, 333, 333,"",$WS_EX_TOPMOST)
	Local $idProgressbar2 = GUICtrlCreateProgress(23, 31, 178, 31)
	GUICtrlSetData($idProgressbar2, 100)
	sleep(3000)
    GUISetState(@SW_SHOW)
	Local $iWait = 1000; 为下一个进度等待 1000 毫秒
    Local $iSavPos = 100; 保存进度位置
	Local $idMsg, $idM
	$idMsg = GUIGetMsg()
	For $i = 1 To 60
		GUICtrlSetData($idProgressbar2, $iSavPos)
		$iSavPos=$iSavPos-1.66
		WinSetTitle($Proform,"",60-$i+1&" 秒重启计算机")
		Sleep($iWait)
	Next
EndFunc   ;==>Example





































