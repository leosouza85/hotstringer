#Noenv
#SingleInstance, Force
settitlematchmode, 2


^1::

filename = ""
send ^c

inputbox, filename, What HotString do you want to create?

if (filename != "") 
{
	FileDelete, %filename%.imt
	FileAppend, %ClipboardAll%, %filename%.imt

	Loop, read, %A_ScriptName%, corrige.ahk
	{
		if A_LoopReadLine contains `;65342758764698809%filename%
			continue
		else
   			FileAppend %A_LoopReadLine%`n
	}
	FileMove, corrige.ahk, %A_ScriptName%, 1

	textofuncao=
	(
		`r`n
		#IfWinNotActive What HotString `;65342758764698809%filename%
		:*:%filename%:: `;65342758764698809%filename%
		fileread, clipboard, *c %filename%.imt `;65342758764698809%filename%
		Send, ^v `;65342758764698809%filename%
		return `;65342758764698809%filename%
	)

	file := FileOpen(A_ScriptName,"a")
	file.write(textofuncao)
	file.close()
	reload
}
return

^2::

filename = ""

inputbox, filename, What HotString do you want to delete?

if (filename != "") 
{
	FileDelete, %filename%.imt
	Loop, read, %A_ScriptName%, corrige.ahk
	{
		if A_LoopReadLine contains `;65342758764698809%filename%
			continue
		else
			FileAppend %A_LoopReadLine%`n
	}
	FileMove, corrige.ahk, %A_ScriptName%, 1
}
return

^3::reload
^9::ExitApp
















