

#include <GUIConstantsEx.au3>
#include <TreeViewConstants.au3>
#include <WindowsConstants.au3>


























Local $hGUI = GUICreate("ControlTreeView 函数示例", 212, 212)
    Local $idTreeView_1 = GUICtrlCreateTreeView(6, 6, 200, 160, BitOR($TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_CHECKBOXES), $WS_EX_CLIENTEDGE)
    Local $hTreeView_1 = ControlGetHandle($hGUI, "", $idTreeView_1)

    Local $idRoot = GUICtrlCreateTreeViewItem("根条目", $idTreeView_1)
    GUICtrlCreateTreeViewItem("条目 1", $idRoot)
    GUICtrlCreateTreeViewItem("条目 2", $idRoot)
    GUICtrlCreateTreeViewItem("条目 3", $idRoot)
    Local $idItem_4 = GUICtrlCreateTreeViewItem("条目 4", $idRoot)
    GUICtrlCreateTreeViewItem("条目 4.1", $idItem_4)
    GUICtrlCreateTreeViewItem("条目 4.2", $idItem_4)
    GUICtrlCreateTreeViewItem("条目 5", $idRoot)

    GUISetState(@SW_SHOW, $hGUI)

    ControlTreeView($hGUI, "", $hTreeView_1, "Expand", "根条目")

    ControlTreeView($hGUI, "", $hTreeView_1, "Exists", "根条目|条目 4")
    ControlTreeView($hGUI, "", $hTreeView_1, "Check", "根条目|条目 4")
    ControlTreeView($hGUI, "", $hTreeView_1, "Select", "根条目|条目 4")
    ControlTreeView($hGUI, "", $hTreeView_1, "Expand", "根条目|条目 4")

    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                ExitLoop
        EndSwitch
    WEnd

    GUIDelete($hGUI)




















































