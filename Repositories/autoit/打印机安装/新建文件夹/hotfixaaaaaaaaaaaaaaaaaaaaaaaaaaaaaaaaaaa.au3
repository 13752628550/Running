#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#include <MsgBoxConstants.au3>

; ����:�����������ú�����������Ŀ,
; ��Ŀ������ÿ���ַ����Ŀؼ� ID.

Example()

Func Example()
    Local $idListBox

    ; ���� GUI
    GUICreate("��ȡ�б����Ŀ����", 400, 296)
    $idListBox = GUICtrlCreateList("", 2, 2, 396, 296)
    GUISetState(@SW_SHOW)

    ; ����ַ���
    _GUICtrlListBox_BeginUpdate($idListBox)
    For $iI = 1 To 9
        _GUICtrlListBox_AddString($idListBox, StringFormat("%03d : ������ַ���", Random(1, 100, 1)))
    Next
    _GUICtrlListBox_EndUpdate($idListBox)

    ; ������Ŀ����
    _GUICtrlListBox_SetItemData($idListBox, 4, 1234)

    ; ��ȡ��Ŀ����
    MsgBox($MB_SYSTEMMODAL, "��Ϣ", "��Ŀ 5 ������: " & _GUICtrlListBox_GetItemData($idListBox, 4))

    ; ѭ�����û��˳�.
    Do
    Until GUIGetMsg() = $GUI_EVENT_CLOSE
    GUIDelete()
EndFunc   ;==>Example

