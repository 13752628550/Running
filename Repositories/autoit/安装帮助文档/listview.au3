#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
    GUICreate("列表视图控件", 220, 250, 100, 200, -1, $WS_EX_ACCEPTFILES)
    GUISetBkColor(0x00E0FFFF) ; 将改变背景颜色

    Local $idListview = GUICtrlCreateListView("列 1  |列 2|列 3  ", 10, 10, 200, 150) ;,$LVS_SORTDESCENDING)
    Local $idButton = GUICtrlCreateButton("测试", 75, 170, 70, 20)
    Local $idItem1 = GUICtrlCreateListViewItem("条目2|col22|col23", $idListview)
    Local $idItem2 = GUICtrlCreateListViewItem("条目1|子目2|子目3", $idListview)
    Local $idItem3 = GUICtrlCreateListViewItem("条目3|col32|col33", $idListview)
    GUICtrlCreateInput("", 20, 200, 150)
    GUICtrlSetState(-1, $GUI_DROPACCEPTED) ; 允许拖动操作
    GUISetState(@SW_SHOW)
    GUICtrlSetData($idItem2, "条目1")
    GUICtrlSetData($idItem3, "||子目 33")
    GUICtrlDelete($idItem1)

    ; 循环到用户退出.
    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                ExitLoop

            Case $idButton
                MsgBox($MB_SYSTEMMODAL, "列表视图 条目", GUICtrlRead(GUICtrlRead($idListview)), 2)

            Case $idListview
                MsgBox($MB_SYSTEMMODAL, "列表视图", "点击 = " & GUICtrlGetState($idListview), 2)

        EndSwitch
    WEnd
EndFunc   ;==>Example


















































