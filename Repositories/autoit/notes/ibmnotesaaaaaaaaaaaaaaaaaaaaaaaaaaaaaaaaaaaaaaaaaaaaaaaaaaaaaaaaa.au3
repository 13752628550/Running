

#include <GUIConstantsEx.au3>
#include <TreeViewConstants.au3>
#include <WindowsConstants.au3>


























Local $hGUI = GUICreate("ControlTreeView ����ʾ��", 212, 212)
    Local $idTreeView_1 = GUICtrlCreateTreeView(6, 6, 200, 160, BitOR($TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_CHECKBOXES), $WS_EX_CLIENTEDGE)
    Local $hTreeView_1 = ControlGetHandle($hGUI, "", $idTreeView_1)

    Local $idRoot = GUICtrlCreateTreeViewItem("����Ŀ", $idTreeView_1)
    GUICtrlCreateTreeViewItem("��Ŀ 1", $idRoot)
    GUICtrlCreateTreeViewItem("��Ŀ 2", $idRoot)
    GUICtrlCreateTreeViewItem("��Ŀ 3", $idRoot)
    Local $idItem_4 = GUICtrlCreateTreeViewItem("��Ŀ 4", $idRoot)
    GUICtrlCreateTreeViewItem("��Ŀ 4.1", $idItem_4)
    GUICtrlCreateTreeViewItem("��Ŀ 4.2", $idItem_4)
    GUICtrlCreateTreeViewItem("��Ŀ 5", $idRoot)

    GUISetState(@SW_SHOW, $hGUI)

    ControlTreeView($hGUI, "", $hTreeView_1, "Expand", "����Ŀ")

    ControlTreeView($hGUI, "", $hTreeView_1, "Exists", "����Ŀ|��Ŀ 4")
    ControlTreeView($hGUI, "", $hTreeView_1, "Check", "����Ŀ|��Ŀ 4")
    ControlTreeView($hGUI, "", $hTreeView_1, "Select", "����Ŀ|��Ŀ 4")
    ControlTreeView($hGUI, "", $hTreeView_1, "Expand", "����Ŀ|��Ŀ 4")

    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                ExitLoop
        EndSwitch
    WEnd

    GUIDelete($hGUI)




















































