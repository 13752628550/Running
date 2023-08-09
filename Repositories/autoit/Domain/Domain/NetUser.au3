#include-once
#include <Array.au3>

; #### Header Information ####
; ===============================================================================================
; Title	: Network user account management
; Description	: This library provides the ability to manage user accounts and local groups on the local or remote system.
; Functions this library can be done	:
;	: Adds a user account and assigns a password and privilege level.
;	: Changes user's password for a specified network server of domain.
;	: Deletes user account from the server.
;	: Lists all user accounts on a server.
;	: Returns information about a particular user account on a server.
;	: Returns a list of local group names to which a user belongs.
;	: Sets the password and other detail elements of a user account.
;	: Creates a local group.
;	: Deletes a local group.
;	: Adds one or more users to an existing local group.
;	: Removes one or more users from an existing local group.
;	: Lists all local groups on a server.
;	: Returns information about a particular local group account on a server.
;	: Lists all members in a specified local group.
;	: Sets general information about a local group.
;	: (All the functions can be worked on local and remote system)
; Author	: Pusofalse, 05/01/2010, kanxinqi@yahoo.com.cn
; Requirements	:
;	Modules		: Advapi32.dll, Kernel32.dll, Netapi32.dll
;	AutoIt version	: v3 ++
;	Minimum client	: Windows 2000 professional
; Suggestions and improvements	:
;	If you have any BUGs or additional suggestions regarding this library, please contact me by sending e-mail above, I'll appreciate as input.

; ===============================================================================================

; #### Flags for USER_INFO_?.Flags ####
; ===============================================================================================
Const $UF_SCRIPT = 0x000001
Const $UF_ACCOUNTDISABLE = 0x000002
Const $UF_HOMEDIR_REQUIRED = 0x000008
Const $UF_LOCKOUT = 0x000010
Const $UF_PASSWD_NOTREQD = 0x000020
Const $UF_PASSWD_CANT_CHANGE = 0x000040
Const $UF_ENCRYPTED_TEXT_PASSWORD_ALLOWED = 0x000080
Const $UF_TEMP_DUPLICATE_ACCOUNT = 0x000100
Const $UF_NORMAL_ACCOUNT = 0x000200
Const $UF_INTERDOMAIN_TRUST_ACCOUNT = 0x000800
Const $UF_WORKSTATION_TRUST_ACCOUNT = 0x001000
Const $UF_SERVER_TRUST_ACCOUNT = 0x002000
Const $UF_DONT_EXPIRE_PASSWD = 0x010000
Const $UF_MNS_LOGON_ACCOUNT = 0x020000
Const $UF_SMARTCARD_REQUIRED = 0x040000
Const $UF_TRUSTED_FOR_DELEGATION = 0x080000
Const $UF_NOT_DELEGATED = 0x100000
Const $UF_USE_DES_KEY_ONLY = 0x200000
Const $UF_DONT_REQUIRE_PREAUTH = 0x400000
Const $UF_PASSWORD_EXPIRED = 0x800000
; ===============================================================================================

; #### Flags for _NetUserEnum.Filter ####
; ===============================================================================================
Const $USER_FILTER_ALL_USER_ACCOUNTS = 0
Const $USER_FILTER_TEMP_DUPLICATE_ACCOUNT = 1
Const $USER_FILTER_NORMAL_ACCOUNT = 2
Const $USER_FILTER_PROXY_ACCOUNT = 4
Const $USER_FILTER_INTERDOMAIN_TRUST_ACCOUNT = 8
Const $USER_FILTER_WORKSTATION_TRUST_ACCOUNT = 0x10
Const $USER_FILTER_SERVER_TRUST_ACCOUNT = 0x20
; ===============================================================================================

; #### Flags for USER_INFO_?.Priv ####
; ===============================================================================================
Const $USER_PRIV_GUEST = 0
Const $USER_PRIV_USER = 1
Const $USER_PRIV_ADMIN = 2
; ===============================================================================================

; #### Flags for _NetUserGet.UserId ####
; ===============================================================================================
Const $USER_ADMIN = 1
Const $USER_GUEST = 2
Const $USER_ADMINS = 3
Const $USER_GUESTS = 4
Const $USER_USERS = 5
Const $USER_POWER_USERS = 6
; ===============================================================================================

Const $NETUSER_Handle = DllOpen("Netapi32.dll")

; #### Structures for NUAM ####
; ===============================================================================================
Const $tagUSER_INFO_1 = "ptr UserName;ptr Password;dword PasswordAge;dword Priv;ptr HomeDir;ptr Comment;dword Flags;ptr ScriptPath"
Const $tagUSER_INFO_2 = $tagUSER_INFO_1 & ";dword AuthorizeFlags;ptr FullName;ptr UserComment;ptr Params;ptr Workstations;dword LastLogon;dword LastLogoff;dword AccountExpires;dword MaxStorage;dword UnitsPerWeek;ptr LogonHours;dword BadPswdCount;dword NumberofLogons;ptr LogonServer;dword CountryCode;dword CodePage"
Const $tagUSER_INFO_3 = $tagUSER_INFO_1 & ";dword AuthorizeFlags;ptr FullName;ptr UserComment;ptr Params;ptr Workstations;dword LastLogon;dword LastLogoff;dword AccountExpires;dword MaxStorage;dword UnitsPerWeek;ptr LogonHours;dword BadPswdCount;dword NumberofLogons;ptr LogonServer;dword CountryCode;dword CodePage;dword UserId;dword PrimaryGroupId;ptr Profile;ptr HomeDirDrive;dword PasswordExpired"
Const $tagLOCALGROUP_INFO_1 = "ptr LocalGroup;ptr Comment"
; ===============================================================================================

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetUserGetInfoEx
; Description	: Retrieves information about a particular user account on a server.
; Parameter(s)	: $sUserName	- Name of the user account for which to return information.
;		: $iInfoClass	- The information level of the data to be retrieved.
;		: $sSystem	- System on which the function to execute, default to local.
; Return values	: Returns a pointer to buffer contains the data required if succeeds, call _NetApiBufferFree to free it when you no longer use it.
; Author	: Pusofalse
; ===============================================================================================
Func _NetUserGetInfoEx($sUserName, $iInfoClass, $sSystem = "")
	Local $iResult
	$iResult = DllCall($NETUSER_Handle, "dword", "NetUserGetInfo", "wstr", $sSystem, _
			"wstr", $sUserName, "dword", $iInfoClass, "ptr*", 0)
	Return SetError($iResult[0], 0, $iResult[4])
EndFunc	;==>_NetUserGetInfoEx

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetUserEnum
; Description	: Lists the user account with specified type on a server.
; Parameter(s)	: $iFilter	- A value that specifies the user account types to be included in the enumeration. A value of zero indicates that all normal user. For advanced options, see _NetUserEnum.Filter.
;		: $sSystem	- Specify the server name from which to enumerate the user accounts.
; Return values	: An array in the following form:
;		: $aArray[0][0] - The number of user accounts returned.
;		: $aArray[1][0] - 1st user's name.
;		: $aArray[1][1] - 1st user's comment.
;		: $aArray[1][2] - 1st user's attributes.
;		: If fails, $aArray[0][0] is set to zero, and @error is set to the reason of the failure, pass to _NetFormatErrorMsg for explicit error message.
; Author	: Pusofalse
; ===============================================================================================
Func _NetUserEnum($iFilter = $USER_FILTER_ALL_USER_ACCOUNTS, $sSystem = "")
	Local $iResult, $aResult[1][3] = [[0]], $tBuffer

	$iResult = DllCall($NETUSER_Handle, "dword", "NetUserEnum", "wstr", $sSystem, _
			"dword", 1, "dword", $iFilter, "ptr*", 0, "dword", -1, _
			"dword*", 0, "dword*", 0, "dword*", 0)
	If ($iResult[0]) Then Return SetError($iResult[0], 0, $aResult)

	$aResult[0][0] = $iResult[6]
	Redim $aResult[$aResult[0][0] + 1][3]

	For $i = 1 To $aResult[0][0]
		$tBuffer = DllStructCreate($tagUSER_INFO_1, $iResult[4] + ($i - 1) * 32)
		$aResult[$i][0] = _NetBufferToString(DllStructGetData($tBuffer, "UserName"), 1)
		$aResult[$i][1] = _NetBufferToString(DllStructGetData($tBuffer, "Comment"), 0)
		$aResult[$i][2] = DllStructGetData($tBuffer, "Flags")
		$tBuffer = 0
	Next
	Return SetError(0, _NetApiBufferFree($iResult[4]), $aResult)
EndFunc	;==>_NetUserEnum

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetUserEnumInUAM
; Description	: This function enumerates all the user accounts displayed in User Account control management (Control Panel -> User Account).
; Parameter(s)	: $sSystem	- System on which the function is to execute.
; Return values	: If succeeds, the function returns an array in the form:
;		:	$aArray[0][0]	- The number of users enumerated.
;		:	$aArray[1][0]	- 1st user's name.
;		:	$aArray[1][1]	- 1st user's comment.
;		:	$aArray[1][2]	- 1st user's flags.
;		:	$aArray[n][0]	- nth user's name.
;		: If fails, the value of $aArray[0][0] is set to zero, and @error is a system error code.
; Author	: Pusofalse
; ===============================================================================================
Func _NetUserEnumInUAM($sSystem = "")
	Local $pSid, $aUser, $iRelativeId, $aLocalGroup, $aResult[1][3] = [[0]]

	$aUser = _NetUserEnum($USER_FILTER_NORMAL_ACCOUNT, $sSystem)
	If (@error) Then Return SetError(@error, 0, $aResult)

	For $i = 1 To $aUser[0][0]
		$aLocalGroup = _NetUserGetLocalGroups($aUser[$i][0], $sSystem)
		For $j = 1 To $aLocalGroup[0]
			$pSid = _NetLookupName($aLocalGroup[$j], $sSystem)
			If (@error) Or ($pSid = 0) Then ContinueLoop
			$iRelativeId = _NetGetSidSubAuthority($pSid, 1)
			_NetApiBufferFree($pSid)

			If ($iRelativeId >= 0x220) And ($iRelativeId <= 0x223) Then
				$aResult[0][0] += 1
				Redim $aResult[$aResult[0][0] + 1][3]
				$aResult[$aResult[0][0]][0] = $aUser[$i][0]
				$aResult[$aResult[0][0]][1] = $aUser[$i][1]
				$aResult[$aResult[0][0]][2] = $aUser[$i][2]
				ExitLoop
			EndIf
		Next
	Next
	Return $aResult
EndFunc	;==>_NetUserEnumInUAM

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetApiBufferFree
; Description	: Frees the memory that the _NetApiBufferAlloc function allocates.
; Parameter(s)	: $pBuffer	- Pointer to memory to be freed.
; Return values	: True or False.
; Author	: Pusofalse
; ===============================================================================================
Func _NetApiBufferFree($pBuffer)
	Local $iResult
	$iResult = DllCall($NETUSER_Handle, "dword", "NetApiBufferFree", "ptr", $pBuffer)
	Return SetError($iResult[0], 0, $iResult[0] = 0)
EndFunc	;==>_NetApiBufferFree

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetBufferToString
; Description	: This function is only internal used, for converting a buffer to actual data.
; ===============================================================================================
Func _NetBufferToString($pBuffer, $fUser = 1)
	Local $tBuffer, $sText

	If ($fUser) Then
		$tBuffer = DllStructCreate("wchar Text[21]", $pBuffer)
	Else
		$tBuffer = DllStructCreate("wchar Text[257]", $pBuffer)
	EndIf
	$sText = DllStructGetData($tBuffer, "Text")
	$tBuffer = 0
	Return $sText
EndFunc	;==>_NetBufferToString

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetUserDel
; Description	: This function deletes a user account from the SAM database on a server.
; Parameter(s)	: $sUserName	- Name of the user account to be deleted.
;		: $sSystem	- System on which the function executes.
; Return values	: True indicates success, or False if failure.
; Author	: Pusofalse
; ===============================================================================================
Func _NetUserDel($sUserName, $sSystem = "")
	Local $iResult
	$iResult = DllCall($NETUSER_Handle, "dword", "NetUserDel", "wstr", $sSystem, "wstr", $sUserName)
	Return SetError($iResult[0], 0, $iResult[0] = 0)
EndFunc	;==>_NetUserDel

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetUserSetInfoEx
; Description	: This function sets the parameters of a user account.
; Parameter(s)	: $sUserName	- Specify the name of the user account for which to set information.
;		: $iInfoClass	- Information level to be set.
;		: $vBuffer	- A buffer contains the data. The format of this data depends on the value of the $iInfoClass parameter.
;		: $sBufferType	- Specify the parameter type of $vBuffer, defaults to a POINTER.
;		: $sSystem	- Specify the DNS or NetBIOS name of the remote server on which the function is to execute. If this parameter is NULL, the local computer is used.
; Return values	: True indicates success, False otherwise, in which case, @error is set to non-zero.
; Author	: Pusofalse
; ===============================================================================================
Func _NetUserSetInfoEx($sUserName, $iInfoClass, $vBuffer, $sBufferType = "ptr", $sSystem = "")
	Local $iResult
	$iResult = DllCall($NETUSER_Handle, "dword", "NetUserSetInfo", "wstr", $sSystem, _
			"wstr", $sUserName, "dword", $iInfoClass, $sBufferType, $vBuffer, _
			"dword*", 0)
	If (@error) Then Return SetError(1, 0, False)
	Return SetError($iResult[0], 0, $iResult[0] = 0)
EndFunc	;==>_NetUserSetInfoEx

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetUserGetLocalGroups
; Description	: Retrieves a list of local groups to which a specified user belongs.
; Parameter(s)	: $sUserName	- Specifies the name of the user for which to return local group membership information.
;		: $sSystem	- System on which the function is to execute.
; Return values	: An array in the form:
;		: $aArray[0] - The number of entries returned.
;		: $aArray[1] - 1st local group's name.
;		: $aArray[n] - nth local group's name.
;		: If the function fails, @error is a non-zero value, and $aArray[0] is a zero value.
; Author	: Pusofalse
; ===============================================================================================
Func _NetUserGetLocalGroups($sUserName, $sSystem = "")
	Local $iResult, $tBuffer, $aResult[1] = [0]

	$iResult = DllCall($NETUSER_Handle, "dword", "NetUserGetLocalGroups", "wstr", $sSystem, _
			"wstr", $sUserName, "dword", 0, "dword", 1, "ptr*", 0, "dword", -1, _
			"dword*", 0, "dword*", 0)
	If ($iResult[0]) Or ($iResult[7] = 0) Then Return SetError($iResult[0], 0, $aResult)

	$aResult[0] = $iResult[7]
	Redim $aResult[$aResult[0] + 1]
	For $i = 1 To $aResult[0]
		$tBuffer = DllStructCreate("ptr LocalGroup", $iResult[5] + ($i - 1) * 4)
		$aResult[$i] = _NetBufferToString(DllStructGetData($tBuffer, "LocalGroup"), 0)
		$tBuffer = 0
	Next
	Return SetError(0, _NetApiBufferFree($iResult[5]), $aResult)
EndFunc	;==>_NetUserGetLocalGroups

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetUserSecurChangePassword
; Description	: Updates the password for specified user account.
; Parameter(s)	: $sUserName	- Name of the user for which to change the password.
;		: $sOldPassword	- Current password.
;		: $sNewPassword	- New password.
;		: $sSystem	- System on which the function, the name must be in UNC format.
; Return values	: True or False.
; Author	: Pusofalse
; Remarks	: It's recommended to use this function to set the user's password, although _NetUserSetPassword provides a same function.
; ===============================================================================================
Func _NetUserSecurChangePassword($sUserName, $sOldPassword, $sNewPassword, $sSystem = "")
	Local $iResult

	If ($sSystem = "") Or ($sSystem = Default) Then $sSystem = @ComputerName
	;If (StringLeft($sSystem, 4) <> "\\.\") Then $sSystem = "\\.\" & $sSystem

	$iResult = DllCall($NETUSER_Handle, "dword", "NetUserChangePassword", "wstr", $sSystem, _
			"wstr", $sUserName, "wstr", $sOldPassword, "wstr", $sNewPassword)
	Return SetError($iResult[0], 0, $iResult[0] = 0)
EndFunc	;==>_NetUserSecurChangePassword

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetUserAdd
; Description	: Adds a new user account and assigns a password.
; Parameter(s)	: $sUserName	- Name of the user account, cannot exceed 21 characters.
;		: $sPassword	- Password of the user account.
;		: $iFlags	- Initial state for this user account, see USER_INFO_?.Flags for correct values.
;		: $sComment	- Comments for this user account, can be NULL. If specified, cannot exceed 256 characters.
;		: $sSystem	- System on which the function executes, default to local.
; Return values	: If the function completes without an error, then returns True, else returns False and sets @error to a system error code.
; Author	: Pusofalse
; Remarks	: The newly created user account does not belong any local group, call _NetLocalGroupAddMembers to adds a user member to an existing local group.
; ===============================================================================================
Func _NetUserAdd($sUserName, $sPassword, $iFlags = 0, $sComment = "", $sSystem = "")
	Local $iResult, $tBuffer, $sBuffer, $pBuffer

	$sBuffer = ";wchar Name[" & StringLen($sUserName) + 1 & "];" & _
		"wchar Pswd[" & StringLen($sPassword) + 1 & "];" & _
		"wchar Comments[" & StringLen($sComment) + 1 & "]"

	$tBuffer = DllStructCreate($tagUSER_INFO_1 & $sBuffer)
	$pBuffer = DllStructGetPtr($tBuffer)
	DllStructSetData($tBuffer, "UserName", DllStructGetPtr($tBuffer, "Name"))
	DllStructSetData($tBuffer, "Password", DllStructGetPtr($tBuffer, "Pswd"))
	DllStructSetData($tBuffer, "Comment", DllStructGetPtr($tBuffer, "Comments"))
	DllStructSetData($tBuffer, "Name", $sUserName)
	DllStructSetData($tBuffer, "Pswd", $sPassword)
	DllStructSetData($tBuffer, "Comments", $sComment)
	DllStructSetData($tBuffer, "Flags", $iFlags)
	DllStructSetData($tBuffer, "Priv", $USER_PRIV_USER)

	$iResult = DllCall($NETUSER_Handle, "dword", "NetUserAdd", "wstr", $sSystem, _
			"dword", 1, "ptr", $pBuffer, "dword*", 0)
	$tBuffer = 0
	Return SetError($iResult[0], 0, $iResult[0] = 0)
EndFunc	;==>_NetUserAdd

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetFormatErrorMsg
; Description	: Converts an error code to an error message.
; Parameter(s)	: $iErrorCode - Error code to be converted.
; Return values	: Error message, in text format.
; Author	: Pusofalse
; ===============================================================================================
Func _NetFormatErrorMsg($iErrorCode = @error)
	Local $hLibrary, $iFlags, $tBuffer

	Local Const $FORMAT_MESSAGE_IGNORE_INSERTS = 0x200
	Local Const $FORMAT_MESSAGE_FROM_HMODULE = 0x800
	Local Const $FORMAT_MESSAGE_FROM_SYSTEM = 0x1000

	$iFlags = BitOR($FORMAT_MESSAGE_FROM_SYSTEM, _
			$FORMAT_MESSAGE_IGNORE_INSERTS)

	$tBuffer = DllStructCreate("char Message[4096]")
	$pBuffer = DllStructGetPtr($tBuffer)

	$hLibrary = DllCall("Kernel32.dll", "handle", "LoadLibraryEx", _
			"str", @SystemDir & "\NetMsg.dll", "handle", 0, "dword", 2)

	If ($hLibrary[0]) Then $iFlags = BitOR($iFlags, $FORMAT_MESSAGE_FROM_HMODULE)

	$iResult = DllCall("Kernel32.dll", "dword", "FormatMessageA", "dword", $iFlags, _
			"handle", $hLibrary[0], "dword", $iErrorCode, _
			"dword", 1024, "ptr", $pBuffer, "dword", 4096, "ptr", 0)
	$sMessage = DllStructGetData($tBuffer, "Message")
	$tBuffer = 0
	DllCall("Kernel32.dll", "int", "FreeLibrary", "handle", $hLibrary[0])
	Return $sMessage
EndFunc	;==>_NetFormatErrorMsg

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetLocalGroupEnum
; Description	: Enumerates the local groups on a server.
; Parameter(s)	: $sSystem	- System on which to enumerate the local groups, default to local.
; Return values	: If succeeds, the return value is an array in the form:
;		: $aArray[0][0] - The number of local groups enumerated.
;		: $aArray[1][0] - 1st local group's name.
;		: $aArray[1][1] - 1st local group's comment.
;		: $aArray[$aArray[0][0]][0] - Last local group's name.
;		: $aArray[$aArray[0][0]][1] - Last local group's comment.
;		: If fails, $aArray[0][0] is set to zero, and @error is set to non-zero.
; Author	: Pusofalse
; ===============================================================================================
Func _NetLocalGroupEnum($sSystem = "")
	Local $iResult, $aResult[1][2] = [[0]], $tBuffer

	$iResult = DllCall($NETUSER_Handle, "dword", "NetLocalGroupEnum", "wstr", $sSystem, _
			"dword", 1, "ptr*", 0, "dword", -1, "dword*", 0, "dword*", 0, "dword_ptr*", 0)
	If ($iResult[0]) Then Return SetError($iResult[0], 0, $aResult)

	$aResult[0][0] = $iResult[5]
	Redim $aResult[$aResult[0][0] + 1][2]

	For $i = 1 To $aResult[0][0]
		$tBuffer = DllStructCreate($tagLOCALGROUP_INFO_1, $iResult[3] + ($i - 1) * 8)
		$aResult[$i][0] = _NetBufferToString(DllStructGetData($tBuffer, "LocalGroup"), 0)
		$aResult[$i][1] = _NetBufferToString(DllStructGetData($tBuffer, "Comment"), 0)
		$tBuffer = 0
	Next
	Return SetError(0, _NetApiBufferFree($iResult[3]), $aResult)
EndFunc	;==>_NetLocalGroupEnum

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetLocalGroupDel
; Description	: Deletes a local group from a server.
; Parameter(s)	: $sLocalGroup	- Name of the local group to be deleted.
;		: $sSystem	- System on which the function to execute.
; Return values	: True indicates success, False indicates failure.
; Author	: Pusofalse
; ===============================================================================================
Func _NetLocalGroupDel($sLocalGroup, $sSystem = "")
	Local $iResult
	$iResult = DllCall($NETUSER_Handle, "dword", "NetLocalGroupDel", _
			"wstr", $sSystem, "wstr", $sLocalGroup)
	Return SetError($iResult[0], 0, $iResult[0] = 0)
EndFunc	;==>_NetLocalGroupDel

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetLocalGroupAdd
; Description	: Creates a local group on the specified system.
; Parameter(s)	: $sLocalGroup	- Name of the local group.
;		: $sComment	- Comments for the local group, cannot exceed 256 characters.
;		: $sSystem	- System on which the function executes.
; Return values	: True of False indicates success or failure.
; Author	: Pusofalse
; ===============================================================================================
Func _NetLocalGroupAdd($sLocalGroup, $sComment = "", $sSystem = "")
	Local $iResult, $tBuffer, $sBuffer, $pBuffer

	$sBuffer = ";wchar GroupName[" & StringLen($sLocalGroup) + 1 & "];" & _
		"wchar Comments[" & StringLen($sComment) + 1 & "]"

	$tBuffer = DllStructCreate($tagLOCALGROUP_INFO_1 & $sBuffer)
	$pBuffer = DllStructGetPtr($tBuffer)
	DllStructSetData($tBuffer, "GroupName", $sLocalGroup)
	DllStructSetData($tBuffer, "Comments", $sComment)
	DllStructSetData($tBuffer, "LocalGroup", DllStructGetPtr($tBuffer, "GroupName"))
	DllStructSetData($tBuffer, "Comment", DllStructGetPtr($tBuffer, "Comments"))

	$iResult = DllCall($NETUSER_Handle, "dword", "NetLocalGroupAdd", "wstr", $sSystem, _
			"dword", 1, "ptr", $pBuffer, "dword*", 0)
	$tBuffer = 0
	Return SetError($iResult[0], 0, $iResult[0] = 0)
EndFunc	;==>_NetLocalGroupAdd

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetLocalGroupGetInfoEx
; Description	: Retrieves the information of a paricular local group on a server.
; Parameter(s)	: $sLocalGroup	- Name of the local group for which to retrieve the information.
;		: $iInfoClass	- Information level of the data required.
;		: $sSystem	- System on which the function executes.
; Return values	: A pointer to a buffer that contains the informatino required, must call _NetApiBufferFree to free it when finished with it.
; Author	: Pusofalse
; ===============================================================================================
Func _NetLocalGroupGetInfoEx($sLocalGroup, $iInfoClass, $sSystem = "")
	Local $iResult
	$iResult = DllCall($NETUSER_Handle, "dword", "NetLocalGroupGetInfo", "wstr", $sSystem, _
			"wstr", $sLocalGroup, "dword", $iInfoClass, "ptr*", 0)
	Return SetError($iResult[0], 0, $iResult[4])
EndFunc	;==>_NetLocalGroupGetInfoEx

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetLocalGroupGetMembers
; Description	: Lists the user members in specified local group.
; Parameter(s)	: $sLocalGroup	- Name of the local group from which the members are returned.
;		: $sSystem	- System on which the function executes.
; Return values	: Array in the form:
;		: $aArray[0] - The number of members returned.
;		: $aArray[1] - 1st user's name.
;		: $aArray[n] - nth user's name.
; Author	: Pusofalse
; ===============================================================================================
Func _NetLocalGroupGetMembers($sLocalGroup, $sSystem = "")
	Local $iResult, $tBuffer, $aResult[1] = [0]

	$iResult = DllCall($NETUSER_Handle, "dword", "NetLocalGroupGetMembers", "wstr", $sSystem, _
			"wstr", $sLocalGroup, "dword", 3, "ptr*", 0, "dword", -1, "dword*", 0, _
			"dword*", 0, "dword_ptr*", 0)
	If ($iResult[0]) Or ($iResult[6] = 0) Then Return SetError($iResult[0], 0, $aResult)

	$aResult[0] = $iResult[6]
	Redim $aResult[$aResult[0] + 1]
	For $i = 1 To $aResult[0]
		$tBuffer = DllStructCreate("ptr DomainUser", $iResult[4] + ($i - 1) * 4)
		$aResult[$i] = _NetBufferToString(DllStructGetData($tBuffer, "DomainUser"), 0)
		$tBuffer = 0
	Next
	Return SetError(0, _NetApiBufferFree($iResult[4]), $aResult)
EndFunc	;==>_NetLocalGroupGetMembers

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetLocalGroupAddMembers
; Description	: This function adds one or more user members to an existing local group.
; Parameter(s)	: $sLocalGroup	- Name of the local group to which to add the user members.
;		: $vMember	- Member(s) to be added, can be in an array or text format:
;		: 	If text, this parameter specifies the name of the user to add; if array, the form must be in:
;		:	$vMember[0] - 1st member's name.
;		:	$vMember[1] - 2nd member's name.
;		: $sSystem	- Name of server on which the function executes.
; Return values	: True indicates success, False otherwise.
; Author	: Pusofalse
; ===============================================================================================
Func _NetLocalGroupAddMembers($sLocalGroup, $vMember, $sSystem = "")
	Local $tBuffer, $pBuffer, $iCount, $sBuffer

	If IsString($vMember) Then
		$iCount = 1
		$tBuffer = DllStructCreate("ptr Members;wchar Member[" & StringLen($vMember) + 1 & "]")
		DllStructSetData($tBuffer, "Members", DllStructGetPtr($tBuffer, "Member"))
		DllStructSetData($tBuffer, "Member", $vMember)
	Else
		If UBound($vMember, 0) <> 1 Then Return SetError(87, 0, False)
		$iCount = UBound($vMember)

		For $i = 0 To $iCount - 1
			$sBuffer &= ";wchar[" & StringLen($vMember[$i]) + 1 & "]"
		Next
		$tBuffer = DllStructCreate("ptr[" & $iCount & "]" & $sBuffer)
		For $i = 0 To $iCount - 1
			DllStructSetData($tBuffer, 1, DllStructGetPtr($tBuffer, ($i + 2)), ($i + 1))
			DllStructSetData($tBuffer, ($i + 2), $vMember[$i])
		Next
	EndIf
	$pBuffer = DllStructGetPtr($tBuffer)

	$iResult = DllCall($NETUSER_Handle, "dword", "NetLocalGroupAddMembers", "wstr", $sSystem, _
			"wstr", $sLocalGroup, "dword", 3, "ptr", $pBuffer, "dword", $iCount)
	$tBuffer = 0
	Return SetError($iResult[0], 0, $iResult[0] = 0)
EndFunc	;==>_NetLocalGroupAddMembers

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetLocalGroupDelMembers
; Description	: Remove user members from a local group.
; Parameter(s)	: $sLocalGroup	- Local group from which to remove the user members.
;		: $vMember	- Member(s) to be removed, can be in an array or text format:
;		: 	If text, this parameter specifies the name of the user to remove; if array, the form must be in:
;		:	$vMember[0] - 1st member's name.
;		:	$vMember[1] - 2nd member's name.
;		: $sSystem	- System on which the function is to execute, default to local.
; ===============================================================================================
Func _NetLocalGroupDelMembers($sLocalGroup, $vMember, $sSystem = "")
	Local $tBuffer, $pBuffer, $iCount, $sBuffer

	If IsString($vMember) Then
		$iCount = 1
		$tBuffer = DllStructCreate("ptr Members;wchar Member[" & StringLen($vMember) + 1 & "]")
		DllStructSetData($tBuffer, "Members", DllStructGetPtr($tBuffer, "Member"))
		DllStructSetData($tBuffer, "Member", $vMember)
	Else
		If UBound($vMember, 0) <> 1 Then Return SetError(87, 0, False)
		$iCount = UBound($vMember)

		For $i = 0 To $iCount - 1
			$sBuffer &= ";wchar[" & StringLen($vMember[$i]) + 1 & "]"
		Next
		$tBuffer = DllStructCreate("ptr[" & $iCount & "]" & $sBuffer)
		For $i = 0 To $iCount - 1
			DllStructSetData($tBuffer, 1, DllStructGetPtr($tBuffer, ($i + 2)), ($i + 1))
			DllStructSetData($tBuffer, ($i + 2), $vMember[$i])
		Next
	EndIf
	$pBuffer = DllStructGetPtr($tBuffer)

	$iResult = DllCall($NETUSER_Handle, "dword", "NetLocalGroupDelMembers", "wstr", $sSystem, _
			"wstr", $sLocalGroup, "dword", 3, "ptr", $pBuffer, "dword", $iCount)
	$tBuffer = 0
	Return SetError($iResult[0], 0, $iResult[0] = 0)
EndFunc	;==>_NetLocalGroupDelMembers

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetUserGetFlags
; Description	: This functioin retrieves the attributes for a user account.
; Parameter(s)	: $sUserName	- Name of the user for which to retrieve the attributes information.
;		: $sSystem	- System on which the function to be executed.
; Return values	: If succeeds, the function returns DWORD value, for correct options, see USER_INFO_?.Flags. If fails, the function returns zero and sets @error to non-zero.
; Author	: Pusofalse
; ===============================================================================================
Func _NetUserGetFlags($sUserName, $sSystem = "")
	Local $pBuffer, $tBuffer, $iFlags

	$pBuffer = _NetUserGetInfoEx($sUserName, 1, $sSystem)
	If (@error) Then Return SetError(@error, 0, 0)

	$tBuffer =  DllStructCreate($tagUSER_INFO_1, $pBuffer)
	$iFlags = DllStructGetData($tBuffer, "Flags")
	Return _NetApiFreeVar($tBuffer, 0, $iFlags, _NetApiBufferFree($pBuffer))
EndFunc	;==>_NetUserGetFlags

Func _NetApiFreeVar(ByRef $vVar, $vValue = 0, $vReturn = "", $iError = @error, $iExtended = @extended)
	$vVar = $vValue
	Return SetError($iError, $iExtended, $vReturn)
EndFunc	;==>_NetApiFreeVar

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetUserDisable
; Description	: This function disables or enables a user account on a server.
; Parameter	: $sUserName	- Name of the user account to be disabled or enabled.
;		: $fDisable	- True if disable, False if enable.
;		: $sSystem	- System on which the function executes.
; Return values	: True if succeeds, False if fails.
; Author	: Pusofalse
; Remarks	: To determine the specified user account whether has been disabled, call _NetUserGetFlags function, and check to see the return value whether contains the UF_ACCOUNTDISABLE bitwise mask.
; ===============================================================================================
Func _NetUserDisable($sUserName, $fDisable, $sSystem = "")
	Local $pBuffer, $tBuffer, $iFlags, $fResult

	$pBuffer = _NetUserGetInfoEx($sUserName, 1, $sSystem)
	If (@error) Then Return SetError(@error, 0, False)

	$tBuffer = DllStructCreate($tagUSER_INFO_1, $pBuffer)
	$iFlags = DllStructGetData($tBuffer, "Flags")
	_NetApiFreeVar($tBuffer, 0, _NetApiBufferFree($pBuffer))

	If ($fDisable) Then
		$iFlags = BitOR($iFlags, $UF_ACCOUNTDISABLE)
	Else
		If BitAnd($iFlags, $UF_ACCOUNTDISABLE) Then $iFlags -= 2
	EndIf

	$fResult = _NetUserSetInfoEx($sUserName, 1008, $iFlags, "dword*", $sSystem)
	Return SetError(@error, 0, $fResult)
EndFunc	;==>_NetUserDisable

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetUserRename
; Description	: Renames a user account.
; Parameter(s)	: $sUserName	- Name of the user account.
;		: $sNewName	- New name assigned to $sUserName.
;		: $sSystem	- System on which the function executes.
; Return values	: True if succeeds, False otherwise.
; Author	: Pusofalse
; ===============================================================================================
Func _NetUserRename($sUserName, $sNewName, $sSystem = "")
	Local $fResult

	$fResult = _NetUserSetInfoEx($sUserName, 0, $sNewName, "wstr*", $sSystem)
	Return SetError(@error, 0, $fResult)
EndFunc	;==>_NetUserRename

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetUserSetPassword
; Description	: This function changes the user password by using the given password.
; Parameter(s)	: $sUserName	- Name of the user account for which the password is assigned.
;		: $sPassword	- Password to set.
;		: $sSystem	- System, the function on which executes.
; Return values	: True or False indicates success or failure.
; Author	: Pusofalse
; ===============================================================================================
Func _NetUserSetPassword($sUserName, $sPassword, $sSystem = "")
	Local $fResult

	$fResult = _NetUserSetInfoEx($sUserName, 1003, $sPassword, "wstr*", $sSystem)
	Return SetError(@error, 0, $fResult)
EndFunc	;==>_NetUserSetPassword

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetUserSetFullName
; Description	: This function sets the full name for the specified user account.
; Parameter(s)	: $sUserName	- Name of the user account.
;		: $sFullName	- Full name.
;		: $sSystem	- System on which to execute the function.
; Return values	: True if succeeds.
; Author	: Pusofalse
; ===============================================================================================
Func _NetUserSetFullName($sUserName, $sFullName, $sSystem = "")
	Local $fResult
	$fResult = _NetUserSetInfoEx($sUserName, 1011, $sFullName, "wstr*", $sSystem)
	Return SetError(@error, 0, $fResult)
EndFunc	;==>_NetUserSetFullName

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetUserGetComment
; Description	: This function retrieves the comment information for a user account.
; Parameter(s)	: $sUserName	- Name of the user for which to retrieve the comment.
;		: $sSystem	- System on which the function executes.
; Return values	: If succeeds, the function returns the comment of the specified user, or NULL if fails, to determine the result of the execution of this function, check to see @error macro, if non-zero, the function fails.
; Author	: Pusofalse
; ===============================================================================================
Func _NetUserGetComment($sUserName, $sSystem = "")
	Local $pBuffer, $sReturn, $tBuffer

	$pBuffer = _NetUserGetInfoEx($sUserName, 1, $sSystem)
	If (@error) Then Return SetError(@error, 0, "")

	$tBuffer = DllStructCreate($tagUSER_INFO_1, $pBuffer)
	$sReturn = _NetBufferToString(DllStructGetData($tBuffer, "Comment"), 0)
	Return _NetApiFreeVar($tBuffer, 0, $sReturn, _NetApiBufferFree($pBuffer))
EndFunc	;==>_NetUserGetComment

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetUserSetComment
; Description	: This function sets the comment for a user account.
; Parameter(s)	: $sUserName	- Name of the user account for which to set the comment.
;		: $sComment	- Comment to set.
;		: $sSystem	- System on which the function executes.
; Return values	: True indicates success, False indicates failure.
; Author	: Pusofalse
; ===============================================================================================
Func _NetUserSetComment($sUserName, $sComment, $sSystem = "")
	Local $fResult

	$fResult = _NetUserSetInfoEx($sUserName, 1007, $sComment, "wstr*", $sSystem)
	Return SetError(@error, 0, $fResult)
EndFunc	;==>_NetUserSetComment

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetUserSetUserComment
; Description	: This function sets the user comment for a user account on a server.
; Parameter(s)	: $sUserName	- Name of the user account for which to set the user comment.
;		: $sUserComment	- Comment to set.
;		: $sSystem	- System on which the function executes.
; Return values	: True indicates success, False indicates failure.
; Author	: Pusofalse
; ===============================================================================================
Func _NetUserSetUserComment($sUserName, $sUserComment, $sSystem = "")
	Local $fResult

	$fResult = _NetUserSetInfoEx($sUserName, 1012, $sUserComment, "wstr*", $sSystem)
	Return SetError(@error, 0, $fResult)
EndFunc	;==>_NetUserSetUserComment

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetLocalGroupRename
; Description	: The function renames a local group.
; Parameter(s)	: $sLocalGroup	- Local group to be renamed.
;		: $sNewName	- New name for the local group.
;		: $sSystem	- System on which to execute the function.
; Return values	: True if succeeds, False otherwise.
; Author	: Pusofalse
; ===============================================================================================
Func _NetLocalGroupRename($sLocalGroup, $sNewName, $sSystem = "")
	Local $fResult

	$fResult = _NetLocalGroupSetInfoEx($sLocalGroup, 0, $sNewName, "wstr*", $sSystem)
	Return SetError(@error, 0, $fResult)
EndFunc	;==>_NetLocalGroupRename

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetLocalGroupSetComment
; Description	: Sets the comment for a local group.
; Parameter(s)	: $sLocalGroup	- Local group for which to set the comment.
;		: $sComment	- Comment for $sLocalGroup, specify NULL to clear the comment.
;		: $sSystem	- System on which the function executes.
; Return values	: True if succeeds, False otherwise.
; Author	: Pusofalse
; ===============================================================================================
Func _NetLocalGroupSetComment($sLocalGroup, $sComment, $sSystem = "")
	Local $fResult

	$fResult = _NetLocalGroupSetInfoEx($sLocalGroup, 1002, $sComment, "wstr*", $sSystem)
	Return SetError(@error, 0, $fResult)
EndFunc	;==>_NetLocalGroupSetComment

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetLocalGroupSetInfoEx
; Description	: The function sets the elements for a local group on a server.
; Parameter(s)	: $sLocalGroup	- Name of the local group for which to set the information.
;		: $iInfoClass	- Level of the information to set.
;		: $vBuffer	- Buffer contains the data.
;		: $sBufferType	- Buffer type of $vBuffer.
;		: $sSystem	- System on which to execute the function.
; Return values	: True is returned if succeeds, or False if fails.
; Author	: Pusofalse
; ===============================================================================================
Func _NetLocalGroupSetInfoEx($sLocalGroup, $iInfoClass, $vBuffer, $sBufferType = "ptr", $sSystem = "")
	Local $iResult
	$iResult = DllCall($NETUSER_Handle, "dword", "NetLocalGroupSetInfo", "wstr", $sSystem, _
			"wstr", $sLocalGroup, "dword", $iInfoClass, $sBufferType, $vBuffer, _
			"dword*", 0)
	If (@error) Then Return SetError(1, 0, False)
	Return SetError($iResult[0], 0, $iResult[0] = 0)
EndFunc	;==>_NetLocalGroupSetInfoEx

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetUserGetDetails
; Description	: This function retrieves the datailed information for a specified user account.
; Parameter(s)	: $sUserName	- Name of the user account.
;		: $sSystem	- Name of the server or domain from which to retrieve the user information.
; Return values	: If the function succeeds, the return value is a pointer to USER_INFO_3 structure, otherwise, the return value is set to zero, and the logged error is set in @error macro, for the reason of the failure, call _NetFormatErrorMsg function.
; Author	: Pusofalse
; Remarks	: When you finished with this returned pointer, call _NetApiBufferFree to free it.
; ===============================================================================================
Func _NetUserGetDetails($sUserName, $sSystem = "")
	Local $pBuffer
	$pBuffer = _NetUserGetInfoEx($sUserName, 3, $sSystem)
	Return SetError(@error, 0, $pBuffer)
EndFunc	;==>_NetUserGetDetails

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetUserForceChangeLogonPassword
; Description	: Forcing a user to change the logon password at next logon.
; Parameter(s)	: $sUserName	- Name of the user account for which the password should be changed.
;		: $fShouldChange	- True if the password must be changed.
;		: $sSystem	- System on which the function executes.
; Return values	: True if succeeds, False otherwise.
; Author	: Pusofalse
; Remarks	: An error value of 50 indicates the user account has UF_PASSWD_CANT_CHANGE or UF_DONT_EXPIRE_PASSWD flag, which indicates the user's password is not changable, or the user's password will never be expired. To fix this problem, call _NetUserSetInfoEx function with 1 information level, and $vBuffer parameter pointers to USER_INFO_1 structure, which, the Flags member does not contain the UF_PASSWD_CANT_CHANGE and UF_DONT_EXPIRE_PASSWD flags, if the call succeeds, and then call this function again.
; ===============================================================================================
Func _NetUserForceChangeLogonPassword($sUserName, $fShouldChange = 1, $sSystem = "")
	Local $pBuffer, $tBuffer, $iFlags, $fResult

	$pBuffer = _NetUserGetInfoEx($sUserName, 3, $sSystem)
	If (@error) Then Return SetError(@error, 0, False)

	$tBuffer = DllStructCreate($tagUSER_INFO_3, $pBuffer)
	$iFlags = DllStructGetData($tBuffer, "Flags")

	If BitAnd($iFlags, $UF_PASSWD_CANT_CHANGE) Then
		_NetApiFreeVar($tBuffer, 0, _NetApiBufferFree($pBuffer))
		Return SetError(50, 0, False)
	EndIf
	If BitAnd($iFlags, $UF_DONT_EXPIRE_PASSWD) Then
		_NetApiFreeVar($tBuffer, 0, _NetApiBufferFree($pBuffer))
		Return SetError(50, 0, False)
	EndIf

	If ($fShouldChange) Then
		DllStructSetData($tBuffer, "PasswordExpired", 1)
	Else
		DllStructSetData($tBuffer, "PasswordExpired", 0)
	EndIf
	$fResult = _NetUserSetInfoEx($sUserName, 3, $pBuffer, "ptr", $sSystem)
	Return SetError(@error, _NetApiFreeVar($tBuffer, 0, _NetApiBufferFree($pBuffer)), $fResult)
EndFunc	;==>_NetUserForceChangeLogonPassword

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetUserGet
; Description	: This function returns the name of a system well-known user account.
; Parameter(s)	: $iUserId	- A value indicates the user or local group to be retrieved, see Flags for _NetUserGet.UserId for a value.
;		: $sSystem	- System on which the function executes, default to local.
; Return values	: Returns the name of the user account requested if succeeds, otherwise, returns NULL and sets @error to a system error code.
; Author	: Pusofalse
; ===============================================================================================
Func _NetUserGet($iUserId, $sSystem = "")
	Local $iResult, $pSid, $sUserName, $iError

	If ($iUserId < 1) Or ($iUserId > 6) Then
		Return SetError(87, 0, "")
	EndIf

	Switch $iUserId
	Case $USER_ADMIN
		$pSid = _NetAllocateSid(5, 21, 606747145, 2000478354, 1801674531, 500)
	Case $USER_GUEST
		$pSid = _NetAllocateSid(5, 21, 606747145, 2000478354, 1801674531, 501)
	Case $USER_ADMINS
		$pSid = _NetAllocateSid(5, 32, 0x220)
	Case $USER_USERS
		$pSid = _NetAllocateSid(5, 32, 0x221)
	Case $USER_GUESTS
		$pSid = _NetAllocateSid(5, 32, 0x222)
	Case $USER_POWER_USERS
		$pSid = _NetAllocateSid(5, 32, 0x223)
	EndSwitch
	If ($pSid = 0) Then Return SetError(@error, 0, "")

	$sUserName = _NetLookupSid($pSid, $sSystem)
	If ($sUserName = "") Then Return SetError(@error, _NetFreeSid($pSid), "")

	_NetFreeSid($pSid)
	If StringInStr($sUserName, "\") Then
		$sUserName = StringTrimLeft($sUserName, StringInStr($sUserName, "\"))
	EndIf
	Return $sUserName
EndFunc	;==>_NetUserGet

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetLookupSid
; Description	: Retrieves the name of the account for a specified SID.
; Parameter(s)	: $pSid	- A pointer to SID structure.
;		: $sSystem	- System on which the function is to execute.
; Return values	: Name of the user account corresponds to the $pSid. Else, returns NULL if fails.
; Author	: Pusofalse
; ===============================================================================================
Func _NetLookupSid($pSid, $sSystem = "")
	Local $iResult, $iError, $sReturn

	$iResult = DllCall("Advapi32.dll", "bool", "LookupAccountSid", "str", $sSystem, _
			"ptr", $pSid, "ptr", 0, "dword*", 0, "ptr", 0, "dword*", 0, _
			"dword*", 0)
	$iResult = DllCall("Advapi32.dll", "bool", "LookupAccountSid", "str", $sSystem, _
			"ptr", $pSid, "str", "", "dword*", $iResult[4], _
			"str", "", "dword*", $iResult[6], "dword*", 0)
	$iError = _NetLastError()

	If ($iResult[3]) Then
		If ($iResult[5]) Then
			$sReturn = $iResult[5] & "\" & $iResult[3]
		Else
			$sReturn = $iResult[3]
		EndIf
	Else
		If ($iResult[5]) Then
			$sReturn = $iResult[5]
		Else
			$sReturn = ""
		EndIf
	EndIf
	Return SetError($iError, $iResult[7], $sReturn)
EndFunc	;==>_NetLookupSid

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetFreeSid
; Description	: Frees the SID allocated by _NetAllocateSid function.
; Parameter(s)	: $pSid	- Pointer to the SID to be freed.
; Return values	: True indicates success, False indicates failure, in which case, @error is set to a system error code.
; Author	: Pusofalse
; ===============================================================================================
Func _NetFreeSid($pSid)
	Local $iResult
	$iResult = DllCall("Advapi32.dll", "ptr", "FreeSid", "ptr", $pSid)
	Return SetError(_NetLastError(), 0, $iResult[0] <> $iResult[1])
EndFunc	;==>_NetFreeSid

Func _NetAllocateSid($iSidAuthority, $iCP0, $iCP1, $iCP2 = 0, $iCP3 = 0, _
		$iCP4 = 0, $iCP5 = 0, $iCP6 = 0, $iCP7 = 0)
	Local $tBuffer, $pAuthority, $iResult

	$tBuffer = DllStructCreate("ubyte Value1[5];ubyte Value2")
	$pAuthority = DllStructGetPtr($tBuffer)
	DllStructSetData($tBuffer, "Value2", $iSidAuthority)

	$iResult = DllCall("Advapi32.dll", "int", "AllocateAndInitializeSid", "ptr", $pAuthority, _
			"byte", @NumParams - 1, "dword", $iCP0, "dword", $iCP1, "dword", $iCP2, _
			"dword", $iCP3, "dword", $iCP4, "dword", $iCP5, "dword", $iCP6, _
			"dword", $iCP7, "ptr*", 0)
	$tBuffer = 0
	Return SetError(_NetLastError(), 0, $iResult[11])
EndFunc	;==>_NetAllocateSid

Func _NetLastError()
	Local $iResult = DllCall("Kernel32.dll", "long", "GetLastError")
	Return $iResult[0]
EndFunc	;==>_NetLastError

; #### FUNCTION ####
; ===============================================================================================
; Name	: _NetGetSidSubAuthority
; Description	: This function returns the subauthority in a security identifier (SID). The subauthority value is a relative identifier (RID).
; Parameter(s)	: $pSid	- A pointer to the SID structure from which a subauthority is to be returned.
;		: $iSubAuthority	- Specifies an index value identifying the subauthority array element whose address the function will return.
; Return values	: If succeeds, the function returns the specified subauthority as a DWORD, else, returns -1 and sets @error to a system error code.
; Author	: Pusofalse
; ===============================================================================================
Func _NetGetSidSubAuthority($pSid, $iSubAuthority)
	Local $iResult, $tBuffer, $iAuthority

	$iResult = DllCall("Advapi32.dll", "ptr", "GetSidSubAuthority", _
			"ptr", $pSid, "dword", $iSubAuthority)
	If ($iResult[0] = 0) Then Return SetError(_NetLastError(), 0, -1)

	$tBuffer = DllStructCreate("dword Authority", $iResult[0])
	$iAuthority = DllStructGetData($tBuffer, "Authority")
	Return SetError(0, 0, _NetApiFreeVar($tBuffer, 0, $iAuthority))
EndFunc	;==>_NetGetSidSubAuthority	
	
Func _NetLookupName($sUserName, $sSystem = "")
	Local $pBuffer, $iResult, $iError

	$iResult = DllCall("Advapi32.dll", "int", "LookupAccountName", "str", $sSystem, _
			"str", $sUserName, "ptr", 0, "dword*", 0, "ptr", 0, "dword*", 0, _
			"dword*", 0)
	$pBuffer = _NetApiBufferAlloc($iResult[4] + $iResult[6])
	$iResult = DllCall("Advapi32.dll", "int", "LookupAccountName", "str", $sSystem, _
			"str", $sUserName, "ptr", $pBuffer, "dword*", $iResult[4], _
			"ptr", $pBuffer + $iResult[4], "dword*", $iResult[6], _
			"dword*", 0)
	If ($iResult[0] = 0) Then $iError = _NetLastError()
	Return SetError($iError, $iResult[7], $pBuffer)
EndFunc	;==>_NetLookupName

Func _NetApiBufferAlloc($iBytesToAlloc)
	Local $iResult
	$iResult = DllCall($NETUSER_Handle, "dword", "NetApiBufferAllocate", _
			"dword", $iBytesToAlloc, "ptr*", 0)
	Return SetError($iResult[0], 0, $iResult[2])
EndFunc	;==>_NetApiBufferAlloc




















