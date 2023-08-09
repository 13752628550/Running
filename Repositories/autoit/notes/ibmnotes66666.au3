#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>





$Form1 = GUICreate("Form1", 615, 278, @DesktopWidth / 2 - 615 / 2, @DesktopHeight / 2 - 278 / 2, _
		$WS_POPUP, $WS_EX_LAYERED + $WS_EX_TOOLWINDOW)

;设置GUI背景颜色
GUISetBkColor(0xABCDEF)
;此图片只是背景，基本上没什么工作
$Pic1 = GUICtrlCreatePic(@ScriptDir & '\Image\BackGround.jpg', 5, 0, 605, 278)
;禁用图片，试之前创建的控件可以点击并置顶与此图片
GUICtrlSetState(-1, $GUI_DISABLE)
;创建导航条
$Pic2 = GUICtrlCreatePic(@ScriptDir & '\Image\Tootip.jpg', 0, 10, 615, 40)
;禁用图片，试之前创建的控件可以点击并置顶与此图片
GUICtrlSetState(-1, $GUI_DISABLE)

$Title = _GUICtrlCreateLabel('软件安装', 15, 15, 200, 25)
$nCount = _GUICtrlCreateLabel('(0/0)', 520, 15, 100, 25)

$Now = _GUICtrlCreateLabel('当前安装：', 35, 90, 600, 25)

$Tootip = _GUICtrlCreateLabel('请稍候...', 180, 150, 600, 100)
GUICtrlSetFont(-1, 50, 800, '', '微软雅黑')

_API_SetLayeredWindowAttributes($Form1, 0xABCDEF)
;显示GUI窗口
GUISetState()

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd

;自定义label控件-普通文字
Func _GUICtrlCreateLabel($Text, $x, $y, $c, $z)
	;根据传递进来的5个参数，创建label控件
	$Label = GUICtrlCreateLabel($Text, $x, $y, $c, $z)
	;设置控件背景色为透明，不显示背景，看着美观，如果想看效果，注释掉这行代码就知道了。
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	;设置label标签文字的字体和字粗和大小
	GUICtrlSetFont(-1, 15, 600, "", "微软雅黑")
	;设置字体颜色
	GUICtrlSetColor(-1, 0xFFFFFF)
	;设置鼠标悬停该控件是的状态为小手
	GUICtrlSetCursor(-1, 0)
	;返回控件句柄
	Return $Label
EndFunc   ;==>_GUICtrlCreateLabel


Func _API_SetLayeredWindowAttributes($hwnd, $i_transcolor, $Transparency = 255, $isColorRef = False)
	Local Const $AC_SRC_ALPHA = 1
	Local Const $ULW_ALPHA = 2
	Local Const $LWA_ALPHA = 0x2
	Local Const $LWA_COLORKEY = 0x1
	If Not $isColorRef Then
		$i_transcolor = Hex(String($i_transcolor), 6)
		$i_transcolor = Execute('0x00' & StringMid($i_transcolor, 5, 2) & StringMid($i_transcolor, 3, 2) & StringMid($i_transcolor, 1, 2))
	EndIf
	Local $Ret = DllCall("user32.dll", "int", "SetLayeredWindowAttributes", "hwnd", $hwnd, "long", $i_transcolor, "byte", $Transparency, "long", $LWA_COLORKEY + $LWA_ALPHA)
	Select
		Case @error
			Return SetError(@error, 0, 0)
		Case $Ret[0] = 0
			Return SetError(4, 0, 0)
		Case Else
			Return 1
	EndSelect
EndFunc   ;==>_API_SetLayeredWindowAttributes









