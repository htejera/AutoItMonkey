;monkey.example.get.var.au3
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
If @error Then Exit	

;Get all vars that the monkey knows about.
Local $aVarNames = _Monkey_Listvar($iSocket)
_ConsoleLog("Monkey vars: " & $aVarNames)

;Gets some build information.
_ConsoleLog("Build device: " & _Monkey_Get_BuildDevice($iSocket))
_ConsoleLog("Build SDK Version: " & _Monkey_Get_BuildVersionSdk($iSocket))
_ConsoleLog("Build Version Release: " & _Monkey_Get_BuildVersionRelease($iSocket))
_ConsoleLog("Build Version Code Name: " & _Monkey_Get_BuildVersionCodename($iSocket))

_Monkey_Shutdown($iSocket)

Func _ConsoleLog($sText)
	ConsoleWrite($sText & @CRLF)
EndFunc