local $sregval= regread("HKLM\SOFTWARE\Microsoft\Office\11.0\Outlook\InstallRoot","Path")
if $sregval="" then
	msgbox (0,"提示","当前系统没有发现Outlook2007,请安装在执行本程序")
    Exit
endif
msgbox (0,"提示",$sregval)








