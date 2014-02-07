;monkey.example.type.au3
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

;Note that you should manually focus a text field first.
_Monkey_Type($iSocket,"Hello Monkey!!")

_Monkey_Shutdown($iSocket)