#RequireAdmin
#Region ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\MyAutoIt3_Green.ico
#AutoIt3Wrapper_Outfile=right.exe
#AutoIt3Wrapper_UseX64=n
#EndRegion ;**** 编译指令由 AutoIt3Wrapper 选项编译窗口创建 ****
#include <lsasecur.au3>
#include <Array.au3>

;枚举本地用户组
;$aLocalGroup = _SeEnumLocalGroups()
;_ArrayDisplay($aLocalGroup, _SeFormatMsg("_SeEnumLocalGroups"))

;枚举内置账户。
;$aWellKnown = _SeEnumWellKnownSids()
;_ArrayDisplay($aWellKnown, _SeFormatMsg("_SeEnumWellKnownSids"))

;枚举当前用户所属的用户组。
;$aUserGroup = _SeEnumUserLocalGroups("exas\" & @UserName)
;_ArrayDisplay($aUserGroup, _SeFormatMsg("_SeEnumUserLocalGroups"))
;$command="net localgroup ""remote desktop users"" users /add"
;RunAsWait("kcte12","exas.ad.local","kcte12.1",$RUN_LOGON_PROFILE ,@ComSpec & " /c " & $command,"",@SW_MAXIMIZE )
;$command="net localgroup ""Network Configuration Operators"" /add ""Power Users"""


;_ArrayDisplay($aUserGroup, "当前用户权限");_SeFormatMsg("_SeEnumUserLocalGroups"))
$Username="exas\" & @UserName
$aUserGroup = _SeEnumUserLocalGroups($Username)
for $i=1 to ubound($aUserGroup)-1
	;msgbox (0,"",$aUserGroup[$i][0])
	;msgbox(0,"",$aUserGroup[$i][1])
	$Group1=$aUserGroup[$i][0]
	$Group2=$aUserGroup[$i][1]
	if $group1="power users" or $group2="power users" Then
		ContinueLoop
	EndIf
	if $group1="Network Configuration Operators" or	$group2="Network Configuration Operators" Then
		ContinueLoop
	EndIf
	if $group1="Remote Desktop Users" or $Group2="Remote Desktop Users" Then
		ContinueLoop
	EndIf
	if $Group1<>"" Then
		_SeDeleteLocalGroupMembers($Group1,$Username)
	EndIf
	if $Group2<>"" Then
		_SeDeleteLocalGroupMembers($Group2,$Username)
	endif
Next
;msgbox(0,"","that's ok")
_seAddlocalGroupMembers("Network Configuration Operators",$Username)
_seAddlocalGroupMembers("Remote Desktop Users",$Username)
_seAddlocalGroupMembers("power users",$Username)
;sleep(6000)
$aUserGroup = _SeEnumUserLocalGroups($Username)
;_ArrayDisplay($aUserGroup,  "当前用户权限") ;_SeFormatMsg("_SeEnumUserLocalGroups"))

$aLocalUsers =  _SeEnumLocalUsers()
;_ArrayDisplay($aLocalUsers, _SeFormatMsg("_SeEnumWellKnownSids"))
for $i=1 to ubound($aLocalUsers)-1
	$User1=$aLocalUsers[$i][0]
	$User2=$alocalusers[$i][1]
	if $User1="DefaultAccount" Then
		;msgbox (0,"","DefaultAccount")
		ContinueLoop
	EndIf
	if $User1="WDAGUtilityAccount" Then
		;msgbox(0,"",$User1)
		ContinueLoop
	EndIf
	if _SeIsUserAdminEx($User1) Then
		;msgbox(0,"",$User1)
		$ChangePasswd="net user """ & $User1  & """ cte.sys.admin" & " /active:yes /expires:never "
		;msgbox (0,"",$ChangePasswd)
		RunWait(@ComSpec & " /c " & $ChangePasswd,"",@SW_HIDE)
	EndIf
Next
msgbox (0,"success","程序设置完成！")











































