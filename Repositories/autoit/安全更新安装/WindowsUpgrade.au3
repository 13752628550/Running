#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\au3script_v10.ico
#AutoIt3Wrapper_UseX64=n
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ColorConstants.au3>
#include <MsgBoxConstants.au3>
#include <array.au3>
#include <file.au3>
#include <constants.au3>
#include <stringconstants.au3>
;初始化程序变量
Local $SouDir = "\\172.26.32.251\softwa\software\WindowsUpgrade\"
Local $RegFil = "RegPro.reg"
Local $UpdFil = "WindowsUpgrade.exe"
Local $Domain = "CTE.AD.LOCAL"
Local $UserNam= "ADMINISTRATOR"
Local $PassWord="Mitsumi@11"
Local $ComStrReg = "regedit /s " & @TempDir & "\" & $RegFil
Local $ComStrUpd = @TempDir & "\" & $UpdFil

FileCopy($SouDir & $RegFil,@tempdir)
FileCopy($SouDir & $UpdFil,@tempdir)
RunAsWait($UserNam,$Domain,$PassWord,0,@ComSpec & " /c " & $ComStrReg,"",@SW_HIDE)





























































RunAsWait($UserNam,$Domain,$PassWord,0,@ComSpec & " /c " & $ComStrUpd,"",@SW_HIDE)