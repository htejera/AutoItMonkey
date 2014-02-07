;monkey.example.drag.au3
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

;Drag out the notification bar
_Monkey_Touch_Down($iSocket,100, 0)
_Monkey_Sleep($iSocket,5)
_Monkey_Touch_Move($iSocket,100, 20)
_Monkey_Sleep($iSocket,5)
_Monkey_Touch_Move($iSocket,100, 40)
_Monkey_Sleep($iSocket,5)
_Monkey_Touch_Move($iSocket,100, 60)
_Monkey_Sleep($iSocket,5)
_Monkey_Touch_Move($iSocket,100, 80)
_Monkey_Sleep($iSocket,5)
_Monkey_Touch_Move($iSocket,100, 100)
_Monkey_Sleep($iSocket,5)
_Monkey_Touch_Up($iSocket,100, 100)
_Monkey_Sleep($iSocket,5)

_Monkey_Shutdown($iSocket)