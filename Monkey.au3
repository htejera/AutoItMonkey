;Monkey.au3
;
;Author:
; henrytejera@gmail.com
;
;Description:
; Monkey provides a AutoIt interface for working with the Android monkey tool.
; Visit <https://github.com/android/platform_development/blob/master/cmds/monkey/README.NETWORK.txt>

#region Include
#include <Array.au3>
#include "lib\monkey.keycodes.au3"
#include "lib\monkey.error.au3"
#include "lib\monkey.connection.au3"
#include "lib\monkey.command.au3"
#include "lib\monkey.api.au3"
#endregion Include

#region Config
Opt("TCPTimeout", 300) ;Defines the time before TCP functions stop if no communication
OnAutoItExitRegister("_Monkey_On_Exit")
#endregion Config