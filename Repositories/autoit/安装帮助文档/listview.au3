#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
    GUICreate("�б���ͼ�ؼ�", 220, 250, 100, 200, -1, $WS_EX_ACCEPTFILES)
    GUISetBkColor(0x00E0FFFF) ; ���ı䱳����ɫ

    Local $idListview = GUICtrlCreateListView("�� 1  |�� 2|�� 3  ", 10, 10, 200, 150) ;,$LVS_SORTDESCENDING)
    Local $idButton = GUICtrlCreateButton("����", 75, 170, 70, 20)
    Local $idItem1 = GUICtrlCreateListViewItem("��Ŀ2|col22|col23", $idListview)
    Local $idItem2 = GUICtrlCreateListViewItem("��Ŀ1|��Ŀ2|��Ŀ3", $idListview)
    Local $idItem3 = GUICtrlCreateListViewItem("��Ŀ3|col32|col33", $idListview)
    GUICtrlCreateInput("", 20, 200, 150)
    GUICtrlSetState(-1, $GUI_DROPACCEPTED) ; �����϶�����
    GUISetState(@SW_SHOW)
    GUICtrlSetData($idItem2, "��Ŀ1")
    GUICtrlSetData($idItem3, "||��Ŀ 33")
    GUICtrlDelete($idItem1)

    ; ѭ�����û��˳�.
    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                ExitLoop

            Case $idButton
                MsgBox($MB_SYSTEMMODAL, "�б���ͼ ��Ŀ", GUICtrlRead(GUICtrlRead($idListview)), 2)

            Case $idListview
                MsgBox($MB_SYSTEMMODAL, "�б���ͼ", "��� = " & GUICtrlGetState($idListview), 2)

        EndSwitch
    WEnd
EndFunc   ;==>Example


















































