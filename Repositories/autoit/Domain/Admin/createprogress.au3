#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
Example()



















































Func Example()

    $Proform=GUICreate("60�����������", 233, 100, 333, 333,"",$WS_EX_TOPMOST)
	Local $idProgressbar2 = GUICtrlCreateProgress(23, 31, 178, 31)
	GUICtrlSetData($idProgressbar2, 100)
	sleep(3000)
    GUISetState(@SW_SHOW)
	Local $iWait = 1000; Ϊ��һ�����ȵȴ� 1000 ����
    Local $iSavPos = 100; �������λ��
	Local $idMsg, $idM
	$idMsg = GUIGetMsg()
	For $i = 1 To 60
		GUICtrlSetData($idProgressbar2, $iSavPos)
		$iSavPos=$iSavPos-1.66
		WinSetTitle($Proform,"",60-$i+1&" �����������")
		Sleep($iWait)
	Next
EndFunc   ;==>Example





































