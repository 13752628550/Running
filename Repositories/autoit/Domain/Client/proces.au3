
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <ProgressConstants.au3>

Example()

Func Example()
    GUICreate("进度条控件 GUI", 220, 100, 100, 200)
    Local $idProgressbar1 = GUICtrlCreateProgress(10, 10, 200, 20)
    GUICtrlSetColor(-1, 32250); 不支持 Windows XP 样式
    Local $idProgressbar2 = GUICtrlCreateProgress(10, 40, 200, 20, $PBS_SMOOTH)
    Local $idButton = GUICtrlCreateButton("启动", 75, 70, 70, 20)
    GUISetState(@SW_SHOW)

    Local $iWait = 20; 为下一个进度等待 20 毫秒
    Local $iSavPos = 0; 保存进度位置

    Local $idMsg, $idM
    ; 循环到用户退出.
    Do
        $idMsg = GUIGetMsg()
        If $idMsg = $idButton Then
            GUICtrlSetData($idButton, "停止")
            For $i = $iSavPos To 100
                If GUICtrlRead($idProgressbar1) = 50 Then MsgBox($MB_SYSTEMMODAL, "信息", "进度完成一半...", 1)
                $idM = GUIGetMsg()

                If $idM = -3 Then ExitLoop

                If $idM = $idButton Then
                    GUICtrlSetData($idButton, "继续")
                    $iSavPos = $i;保存当前进度位置到 $iSavPos
                    ExitLoop
                Else
                    $iSavPos = 0
                    GUICtrlSetData($idProgressbar1, $i)
                    GUICtrlSetData($idProgressbar2, (100 - $i))
                    Sleep($iWait)
                EndIf
            Next
            If $i > 100 Then
                ;       $iSavPos=0
                GUICtrlSetData($idButton, "启动")
            EndIf
        EndIf
    Until $idMsg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
