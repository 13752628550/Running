#include <GUIConstantsEx.au3>
#include <GuiListBox.au3>
#include <MsgBoxConstants.au3>

; 警告:不能用于内置函数创建的项目,
; 项目数据是每个字符串的控件 ID.

Example()

Func Example()
    Local $idListBox

    ; 创建 GUI
    GUICreate("获取列表框项目数据", 400, 296)
    $idListBox = GUICtrlCreateList("", 2, 2, 396, 296)
    GUISetState(@SW_SHOW)

    ; 添加字符串
    _GUICtrlListBox_BeginUpdate($idListBox)
    For $iI = 1 To 9
        _GUICtrlListBox_AddString($idListBox, StringFormat("%03d : 随机数字符串", Random(1, 100, 1)))
    Next
    _GUICtrlListBox_EndUpdate($idListBox)

    ; 设置项目数据
    _GUICtrlListBox_SetItemData($idListBox, 4, 1234)

    ; 获取项目数据
    MsgBox($MB_SYSTEMMODAL, "消息", "项目 5 的数据: " & _GUICtrlListBox_GetItemData($idListBox, 4))

    ; 循环到用户退出.
    Do
    Until GUIGetMsg() = $GUI_EVENT_CLOSE
    GUIDelete()
EndFunc   ;==>Example

