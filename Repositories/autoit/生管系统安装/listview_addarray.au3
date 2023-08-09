#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>
Example()
Func Example()
    Local $iI, $iTimer, $idListview

    ; ���� GUI
    GUICreate("������鵽�б���ͼ", 400, 300)
    $idListview = GUICtrlCreateListView("", 2, 2, 394, 268)
    GUISetState(@SW_SHOW)

    ; �����
    _GUICtrlListView_AddColumn($idListview, "��Ŀ", 100)
    _GUICtrlListView_AddColumn($idListview, "���� 1", 100)
    _GUICtrlListView_AddColumn($idListview, "���� 2", 100)
    _GUICtrlListView_AddColumn($idListview, "���� 3", 100)

    _GUICtrlListView_SetItemCount($idListview, 5000)

    ; ������
    Local $aItems[5000][1]
    For $iI = 0 To UBound($aItems) - 1
        $aItems[$iI][0] = "��Ŀ " & $iI
    Next
    $iTimer = TimerInit()
    _GUICtrlListView_AddArray($idListview, $aItems)
    MsgBox($MB_SYSTEMMODAL, "��Ϣ", "���غ�ʱ: " & TimerDiff($iTimer) / 1000 & " ��")

    _GUICtrlListView_DeleteAllItems(GUICtrlGetHandle($idListview)) ; UDF ��ӵ���Ŀ, ����ʹ�� UDF ɾ��

    ; ���� 4 ��
    Local $aItems[5000][4]
    For $iI = 0 To UBound($aItems) - 1
        $aItems[$iI][0] = "��Ŀ " & $iI
        $aItems[$iI][1] = "��Ŀ " & $iI & "-1"
        $aItems[$iI][2] = "��Ŀ " & $iI & "-2"
        $aItems[$iI][3] = "��Ŀ " & $iI & "-3"
    Next
    $iTimer = TimerInit()
    _GUICtrlListView_AddArray($idListview, $aItems)
    MsgBox($MB_SYSTEMMODAL, "��Ϣ", "���غ�ʱ: " & TimerDiff($iTimer) / 1000 & " ��")

    ; ѭ�����û��˳�.
    Do
    Until GUIGetMsg() = $GUI_EVENT_CLOSE
    GUIDelete()
EndFunc   ;==>Example

