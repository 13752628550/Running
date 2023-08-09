#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>





$Form1 = GUICreate("Form1", 615, 278, @DesktopWidth / 2 - 615 / 2, @DesktopHeight / 2 - 278 / 2, _
		$WS_POPUP, $WS_EX_LAYERED + $WS_EX_TOOLWINDOW)

;����GUI������ɫ
GUISetBkColor(0xABCDEF)
;��ͼƬֻ�Ǳ�����������ûʲô����
$Pic1 = GUICtrlCreatePic(@ScriptDir & '\Image\BackGround.jpg', 5, 0, 605, 278)
;����ͼƬ����֮ǰ�����Ŀؼ����Ե�����ö����ͼƬ
GUICtrlSetState(-1, $GUI_DISABLE)
;����������
$Pic2 = GUICtrlCreatePic(@ScriptDir & '\Image\Tootip.jpg', 0, 10, 615, 40)
;����ͼƬ����֮ǰ�����Ŀؼ����Ե�����ö����ͼƬ
GUICtrlSetState(-1, $GUI_DISABLE)

$Title = _GUICtrlCreateLabel('�����װ', 15, 15, 200, 25)
$nCount = _GUICtrlCreateLabel('(0/0)', 520, 15, 100, 25)

$Now = _GUICtrlCreateLabel('��ǰ��װ��', 35, 90, 600, 25)

$Tootip = _GUICtrlCreateLabel('���Ժ�...', 180, 150, 600, 100)
GUICtrlSetFont(-1, 50, 800, '', '΢���ź�')

_API_SetLayeredWindowAttributes($Form1, 0xABCDEF)
;��ʾGUI����
GUISetState()

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd

;�Զ���label�ؼ�-��ͨ����
Func _GUICtrlCreateLabel($Text, $x, $y, $c, $z)
	;���ݴ��ݽ�����5������������label�ؼ�
	$Label = GUICtrlCreateLabel($Text, $x, $y, $c, $z)
	;���ÿؼ�����ɫΪ͸��������ʾ�������������ۣ�����뿴Ч����ע�͵����д����֪���ˡ�
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	;����label��ǩ���ֵ�������ִֺʹ�С
	GUICtrlSetFont(-1, 15, 600, "", "΢���ź�")
	;����������ɫ
	GUICtrlSetColor(-1, 0xFFFFFF)
	;���������ͣ�ÿؼ��ǵ�״̬ΪС��
	GUICtrlSetCursor(-1, 0)
	;���ؿؼ����
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









