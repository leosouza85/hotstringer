#Noenv
#SingleInstance, Force
settitlematchmode, 2


^1::

nomearquivo = ""
send ^c

inputbox, nomearquivo, Qual será a HotString?

if (nomearquivo != "") 
{
	FileDelete, %nomearquivo%.imt
	FileAppend, %ClipboardAll%, %nomearquivo%.imt

	Loop, read, %A_ScriptName%, corrige.ahk
	{
		if A_LoopReadLine contains `;65342758764698809%nomearquivo%
			continue
		else
   			FileAppend %A_LoopReadLine%`n
	}
	FileMove, corrige.ahk, %A_ScriptName%, 1

	textofuncao=
	(
		`r`n
		#IfWinNotActive Qual será `;65342758764698809%nomearquivo%
		:*:%nomearquivo%:: `;65342758764698809%nomearquivo%
		fileread, clipboard, *c %nomearquivo%.imt `;65342758764698809%nomearquivo%
		Send, ^v `;65342758764698809%nomearquivo%
		return `;65342758764698809%nomearquivo%
	)

	file := FileOpen(A_ScriptName,"a")
	file.write(textofuncao)
	file.close()
	reload
}
return

^2::

nomearquivo = ""

inputbox, nomearquivo, Qual será a HotString que irá deletar?

if (nomearquivo != "") 
{
	FileDelete, %nomearquivo%.imt
	Loop, read, %A_ScriptName%, corrige.ahk
	{
		if A_LoopReadLine contains `;65342758764698809%nomearquivo%
			continue
		else
			FileAppend %A_LoopReadLine%`n
	}
	FileMove, corrige.ahk, %A_ScriptName%, 1
}
return

^3::reload
^9::ExitApp









