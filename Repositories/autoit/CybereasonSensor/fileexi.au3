$cteuser=@UserName

$fileexi=fileexists("\\172.26.32.251\softwa\pcsetup\" & $cteuser)
;msgbox ("","",$fileexi)
if $fileexi =1 then
	local $ireturn8=runwait(@comspec & " /c" & "copy /y \\172.26.32.251\softwa\pcsetup\" & $cteuser & "\*.* " & @desktopdir)
Else
	while fileexists("\\172.26.32.251\softwa\pcsetup\" & $cteuser)<> 1
		$cteuser=inputbox("","请输入您系统用户名！")
		msgbox ("","",$cteuser)
		if $cteuser="" then
			$cteuser="cte123456"
		EndIf
	WEnd
    runwait(@comspec & " /c" & "copy /y \\172.26.32.251\softwa\pcsetup\" & $cteuser & "\*.* " & @desktopdir)
EndIf







































































