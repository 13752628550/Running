#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>
Example()
Func Example()
    Local $iI, $iTimer, $idListview

    ; 创建 GUI
    GUICreate("添加数组到列表视图", 400, 300)
    $idListview = GUICtrlCreateListView("", 2, 2, 394, 268)
    GUISetState(@SW_SHOW)

    ; 添加列
    _GUICtrlListView_AddColumn($idListview, "项目", 100)
    _GUICtrlListView_AddColumn($idListview, "子项 1", 100)
    _GUICtrlListView_AddColumn($idListview, "子项 2", 100)
    _GUICtrlListView_AddColumn($idListview, "子项 3", 100)

    _GUICtrlListView_SetItemCount($idListview, 5000)

    ; 加载列
    Local $aItems[5000][1]
    For $iI = 0 To UBound($aItems) - 1
        $aItems[$iI][0] = "项目 " & $iI
    Next
    $iTimer = TimerInit()
    _GUICtrlListView_AddArray($idListview, $aItems)
    MsgBox($MB_SYSTEMMODAL, "消息", "加载耗时: " & TimerDiff($iTimer) / 1000 & " 秒")

    _GUICtrlListView_DeleteAllItems(GUICtrlGetHandle($idListview)) ; UDF 添加的项目, 可以使用 UDF 删除

    ; 加载 4 列
    Local $aItems[5000][4]
    For $iI = 0 To UBound($aItems) - 1
        $aItems[$iI][0] = "项目 " & $iI
        $aItems[$iI][1] = "项目 " & $iI & "-1"
        $aItems[$iI][2] = "项目 " & $iI & "-2"
        $aItems[$iI][3] = "项目 " & $iI & "-3"
    Next
    $iTimer = TimerInit()
    _GUICtrlListView_AddArray($idListview, $aItems)
    MsgBox($MB_SYSTEMMODAL, "消息", "加载耗时: " & TimerDiff($iTimer) / 1000 & " 秒")

    ; 循环到用户退出.
    Do
    Until GUIGetMsg() = $GUI_EVENT_CLOSE
    GUIDelete()
EndFunc   ;==>Example

