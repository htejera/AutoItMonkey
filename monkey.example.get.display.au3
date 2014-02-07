;monkey.example.get.display.au3
;
;Author:
; henrytejera@gmail.com
;
;Description:
; The following examples assume that monkey is already running (via adb shell monkey --port 1088) 
; and a port forwarding (adb forward tcp:1088 tcp:1088) has been set up.
#include "monkey.au3"

Local $iMonkeyPort = 1088
Local $iSocket = _Monkey_Connect($iMonkeyPort)

;Get display information
_ConsoleLog("Display density " & _Monkey_Get_DisplayDensity($iSocket))
_ConsoleLog("Display height " & _Monkey_Get_DisplayHeight($iSocket))
_ConsoleLog("Display width " & _Monkey_Get_DisplayWidth($iSocket))

_Monkey_Shutdown($iSocket)

Func _ConsoleLog($sText)
	ConsoleWrite($sText & @CRLF)
EndFunc