
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <ProgressConstants.au3>

Example()

Func Example()
    GUICreate("�������ؼ� GUI", 220, 100, 100, 200)
    Local $idProgressbar1 = GUICtrlCreateProgress(10, 10, 200, 20)
    GUICtrlSetColor(-1, 32250); ��֧�� Windows XP ��ʽ
    Local $idProgressbar2 = GUICtrlCreateProgress(10, 40, 200, 20, $PBS_SMOOTH)
    Local $idButton = GUICtrlCreateButton("����", 75, 70, 70, 20)
    GUISetState(@SW_SHOW)

    Local $iWait = 20; Ϊ��һ�����ȵȴ� 20 ����
    Local $iSavPos = 0; �������λ��

    Local $idMsg, $idM
    ; ѭ�����û��˳�.
    Do
        $idMsg = GUIGetMsg()
        If $idMsg = $idButton Then
            GUICtrlSetData($idButton, "ֹͣ")
            For $i = $iSavPos To 100
                If GUICtrlRead($idProgressbar1) = 50 Then MsgBox($MB_SYSTEMMODAL, "��Ϣ", "�������һ��...", 1)
                $idM = GUIGetMsg()

                If $idM = -3 Then ExitLoop

                If $idM = $idButton Then
                    GUICtrlSetData($idButton, "����")
                    $iSavPos = $i;���浱ǰ����λ�õ� $iSavPos
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
                GUICtrlSetData($idButton, "����")
            EndIf
        EndIf
    Until $idMsg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
