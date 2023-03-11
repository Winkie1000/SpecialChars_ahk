; SpecialChars.ahk by Winkie
; Based on a code snippet by mikeyww from https://www.autohotkey.com/boards/viewtopic.php?p=511199

/*
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
*/

#Requires AutoHotkey v2.0

#NoTrayIcon
#SingleInstance Force

aChars := [[224, 225, 226, 227,228,229, 230,192, 193, 194, 195, 196, 197, 198], [242, 243, 244, 245, 246, 248, 210, 211, 212, 213, 214, 216],
	[236, 237, 238, 239, 204, 205, 206, 207], [249, 250, 251, 252, 217, 218, 219, 220], [232, 233, 234, 235, 200, 201, 202, 203],
	[223, 231, 241, 199], [169, 176, 215, 247]]

oGui := Gui("+AlwaysOnTop", "SpecialChars")
oGui.MarginX := 8
oGui.MarginY := 8
oGui.SetFont("s12", "Consolas")
oGui.OnEvent("Escape", (*) => ExitApp)
sOptions := ""
Loop aChars.Length
{
	For index, value in aChars[A_Index]
	{
		oGui.Add("Button", sOptions, Chr(value)).OnEvent('Click', DoPaste)
		sOptions := "x+m"
	}
	sOptions := "xm"
}
GuiShow := () => oGui.Show("NoActivate")
GuiShow

DoPaste(oThisBtn, *)
{
	oGui.Submit()
	Sleep(25)
	SendText oThisBtn.Text
	GuiShow
}