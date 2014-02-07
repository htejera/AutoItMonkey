;monkey.api.au3
;
;Author:
; henrytejera@gmail.com
;
;Description:
; Commands for the Simple Protocol for Automated Network Control.
; Visit <https://github.com/android/platform_development/blob/master/cmds/monkey/README.NETWORK.txt>

;Function: _Monkey_Key_Down
;Sends a key down event. Should be coupled with _Monkey_Key_Up.
;Note that _Monkey_Press performs the two events automatically.
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;	$iKeycode - Integer The keycode parameter refers to the KEYCODE list in the monkey.keycodes.au3 file
;
;Returns:
;   Boolean Success: True Failure: False
Func _Monkey_Key_Down($iSocket, $iKeycode)
	Local $aResponse
	Local $sCommand = "key down " & $iKeycode
	Return _Monkey_Send($iSocket, $sCommand)
EndFunc   ;==>_Monkey_Key_Down

;Function: _Monkey_Key_Up
;Sends a key up event. Should be coupled with _Monkey_Key_Down.
;Note that _Monkey_Press performs the two events automatically.
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;	$iKeycode - Integer The keycode parameter refers to the KEYCODE list in the monkey.keycodes.au3 file
;
;
;Returns:
;	Boolean Success: True Failure: False
Func _Monkey_Key_Up($iSocket, $iKeycode)
	Local $aResponse
	Local $sCommand = "key up " & $iKeycode
	Return _Monkey_Send($iSocket, $sCommand)
EndFunc   ;==>_Monkey_Key_Up

;Function: _Monkey_Touch_Down
;This command injects a MotionEvent into the input system that
;simulates a user touching the touchscreen (or a pointer event).
;Just like key events, touch events at a single location require both a down and an up.
;To simulate dragging, send a _Monkey_Touch_Down, then a series of _Monkey_Touch_Move events (to simulate
;the drag), followed by a _Monkey_Touch_Up at the final location.
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;	$iX       - Integer The x coordinate
;	$iY       - Integer The y coordinate
;
;Returns:
;	Boolean Success: True Failure: False
Func _Monkey_Touch_Down($iSocket, $iX, $iY)
	Local $aResponse
	Local $sCommand = "touch down " & $iX & " " & $iY
	Return _Monkey_Send($iSocket, $sCommand)
EndFunc   ;==>_Monkey_Touch_Down

;Function: _Monkey_Touch_Up
;This command injects a MotionEvent into the input system that
;simulates a user touching the touchscreen (or a pointer event).
;Just like key events, touch events at a single location require both a down and an up.
;To simulate dragging, send a _Monkey_Touch_Down, then a series of _Monkey_Touch_Move events (to simulate
;the drag), followed by a _Monkey_Touch_Up at the final location.
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;	$iX       - Integer The x coordinate
;	$iY       - Integer The y coordinate
;
;Returns:
;	Boolean Success: True Failure: False
Func _Monkey_Touch_Up($iSocket, $iX, $iY)
	Local $aResponse
	Local $sCommand = "touch up " & $iX & " " & $iY
	Return _Monkey_Send($iSocket, $sCommand)
EndFunc   ;==>_Monkey_Touch_Up

;Function: _Monkey_Touch_Move
;This command injects a MotionEvent into the input system that
;simulates a user touching the touchscreen (or a pointer event).
;Just like key events, touch events at a single location require both a down and an up.
;To simulate dragging, send a _Monkey_Touch_Down, then a series of _Monkey_Touch_Move events (to simulate
;the drag), followed by a _Monkey_Touch_Up at the final location.
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;	$iX       - Integer The x coordinate
;	$iY       - Integer The y coordinate
;
;Returns:
;	Boolean Success: True Failure: False
Func _Monkey_Touch_Move($iSocket, $iX, $iY)
	Local $aResponse
	Local $sCommand = "touch move " & $iX & " " & $iY
	Return _Monkey_Send($iSocket, $sCommand)
EndFunc   ;==>_Monkey_Touch_Move

;Function: _Monkey_Trackball
;This command injects a MotionEvent into the input system that
;simulates a user using the trackball.
;$iDX and $iDY parameters indicates the amount of change in the trackball location
;(as opposed to exact coordinates that the touch events use)
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;	$iDX       - Integer The x coordinate
;	$iDY       - Integer The y coordinate
;
;Returns:
;	Boolean Success: True Failure: False
Func _Monkey_Trackball($iSocket, $iDX, $iDY)
	Local $aResponse
	Local $sCommand = "trackball " & $iDX & " " & $iDY
	Return _Monkey_Send($iSocket, $sCommand)
EndFunc   ;==>_Monkey_Trackball

;Function: _Monkey_Flip_Open
;Simulates opening the keyboard.
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Boolean Success: True Failure: False
Func _Monkey_Flip_Open($iSocket)
	Local $aResponse
	Local $sCommand = "flip open"
	Return _Monkey_Send($iSocket, $sCommand)
EndFunc   ;==>_Monkey_Flip_Open

;Function: _Monkey_Flip_Close
;Simulates closing the keyboard.
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Boolean Success: True Failure: False
Func _Monkey_Flip_Close($iSocket)
	Local $aResponse
	Local $sCommand = "flip close"
	Return _Monkey_Send($iSocket, $sCommand)
EndFunc   ;==>_Monkey_Flip_Close

;Function: _Monkey_Flip_Wake
;This command will wake the device up from sleep and allow user input.
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Boolean Success: True Failure: False
Func _Monkey_Wake($iSocket)
	Local $aResponse
	Local $sCommand = "wake"
	Return _Monkey_Send($iSocket, $sCommand)
EndFunc   ;==>_Monkey_Wake

;Function: _Monkey_Tap
;The tap command is a shortcut for the touch command. It will
;automatically send both the up and the down event.
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;	$iX       - Integer The x coordinate
;	$iY       - Integer The y coordinate
;
;Returns:
;	Boolean Success: True Failure: False
Func _Monkey_Tap($iSocket, $iX, $iY)
	Local $aResponse
	Local $sCommand = "tap " & $iX & " " & $iY
	Return _Monkey_Send($iSocket, $sCommand)
EndFunc   ;==>_Monkey_Tap

;Function: _Monkey_Press
;The press command is a shortcut for the key command.  The keycode
;paramter works just like the key command and will automatically send
;both the up and the down event.
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;	$iKeycode - String The keycode parameter refers to the KEYCODE list in the monkey.keycodes.au3 file
;
;Returns:
;	Boolean Success: True Failure: False
Func _Monkey_Press($iSocket, $iKeycode)
	Local $aResponse
	Local $sCommand = "press " & $iKeycode
	Return _Monkey_Send($iSocket, $sCommand)
EndFunc   ;==>_Monkey_Press

;Function: _Monkey_Type
;This command will simulate a user typing the given string on the
;keyboard by generating the proper KeyEvents.
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;	$sString  - String Note that only characters for which key codes exist can be entered.
;
;Returns:
;	Boolean Success: True Failure: False
Func _Monkey_Type($iSocket, $sString)
	Local $aResponse
	Local $sCommand
	If StringInStr($sString," ") <> 0 Then
		$sCommand = 'type "' & $sString & '"'
	Else
		$sCommand = 'type ' & $sString
	EndIf	
	Return _Monkey_Send($iSocket, $sCommand)
EndFunc   ;==>_Monkey_Type

;Function: _Monkey_Listvar
;This command lists all the vars that the monkey knows about.
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String of supported variable name (delimiter '|'). Failure: False
Func _Monkey_Listvar($iSocket)
	Local $aResponse
	Local $sCommand = "listvar"
	Return _Monkey_Send($iSocket, $sCommand, True)
EndFunc   ;==>_Monkey_Listvar

;Function: _Monkey_Getvar
;This command returns the value of the given var. _Monkey_Listvar can be used
;to find out what vars are supported.
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;   $sVarName - String The name of the variable
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Getvar($iSocket, $sVarName)
	Local $aResponse
	Local $sCommand = "getvar " & $sVarName
	Return _Monkey_Send($iSocket, $sCommand, True)
EndFunc   ;==>_Monkey_Getvar

;Function: _Monkey_Quit
;Fully quit the monkey and accept no new sessions.
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Boolean Success: True Failure: False
Func _Monkey_Quit($iSocket)
	Local $aResponse
	Local $sCommand = "quit"
	Return _Monkey_Send($iSocket, $sCommand)
EndFunc   ;==>_Monkey_Quit

;Function: _Monkey_Done
;Close the current session and allow a new session to connect.
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Boolean Success: True Failure: False
Func _Monkey_Done($iSocket)
	Local $aResponse
	Local $sCommand = "done"
	Return _Monkey_Send($iSocket, $sCommand)
EndFunc   ;==>_Monkey_Done

;Function: _Monkey_Sleep
;Sleeps for the given duration. Can be useful for simulating gestures.
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;   $iTime    - Integer How many milliseconds to sleep for.
;
;Returns:
;	Boolean Success: True Failure: False
Func _Monkey_Sleep($iSocket, $iTime)
	Local $aResponse
	Local $sCommand = "sleep " & $iTime
	Return _Monkey_Send($iSocket, $sCommand)
EndFunc   ;==>_Monkey_Sleep

;Function: _Monkey_Get_AmCurrentAction
;Alias for _Monkey_Getvar($iSocket, "am.current.action").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_AmCurrentAction($iSocket)
	Return _Monkey_Getvar($iSocket, "am.current.action")
EndFunc   ;==>_Monkey_Get_AmCurrentAction

;Function: _Monkey_Get_AmCurrentCategories
;Alias for _Monkey_Getvar($iSocket, "am.current.categories").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_AmCurrentCategories($iSocket)
	Return _Monkey_Getvar($iSocket, "am.current.categories")
EndFunc   ;==>_Monkey_Get_AmCurrentCategories

;Function: _Monkey_Get_AmCurrentCompClass
;Alias for _Monkey_Getvar($iSocket, "am.current.comp.class").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_AmCurrentCompClass($iSocket)
	Return _Monkey_Getvar($iSocket, "am.current.comp.class")
EndFunc   ;==>_Monkey_Get_AmCurrentCompClass

;Function: _Monkey_Get_AmCurrentCompPackage
;Alias for _Monkey_Getvar($iSocket, "am.current.comp.package").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_AmCurrentCompPackage($iSocket)
	Return _Monkey_Getvar($iSocket, "am.current.comp.package")
EndFunc   ;==>_Monkey_Get_AmCurrentCompPackage

;Function: _Monkey_Get_CurrentData
;Alias for _Monkey_Getvar($iSocket, "am.current.data").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_CurrentData($iSocket)
	Return _Monkey_Getvar($iSocket, "am.current.data")
EndFunc   ;==>_Monkey_Get_CurrentData

;Function: _Monkey_Get_BuildBoard
;Alias for _Monkey_Getvar($iSocket, "build.board").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_BuildBoard($iSocket)
	Return _Monkey_Getvar($iSocket, "build.board")
EndFunc   ;==>_Monkey_Get_BuildBoard

;Function: _Monkey_Get_BuildBrand
;Alias for _Monkey_Getvar($iSocket, "build.brand").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_BuildBrand($iSocket)
	Return _Monkey_Getvar($iSocket, "build.brand")
EndFunc   ;==>_Monkey_Get_BuildBrand

;Function: _Monkey_Get_BuildCpuAbi
;Alias for _Monkey_Getvar($iSocket, "build.cpu_abi").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_BuildCpuAbi($iSocket)
	Return _Monkey_Getvar($iSocket, "build.cpu_abi")
EndFunc   ;==>_Monkey_Get_BuildCpuAbi

;Function: _Monkey_Get_BuildDevice
;Alias for _Monkey_Getvar($iSocket, "build.device").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_BuildDevice($iSocket)
	Return _Monkey_Getvar($iSocket, "build.device")
EndFunc   ;==>_Monkey_Get_BuildDevice

;Function: _Monkey_Get_BuildDisplay
;Alias for _Monkey_Getvar($iSocket, "build.display").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_BuildDisplay($iSocket)
	Return _Monkey_Getvar($iSocket, "build.display")
EndFunc   ;==>_Monkey_Get_BuildDisplay

;Function: _Monkey_Get_BuildFingerprint
;Alias for _Monkey_Getvar($iSocket, "build.fingerprint").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_BuildFingerprint($iSocket)
	Return _Monkey_Getvar($iSocket, "build.fingerprint")
EndFunc   ;==>_Monkey_Get_BuildFingerprint

;Function: _Monkey_Get_BuildHost
;Alias for _Monkey_Getvar($iSocket, "build.host").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_BuildHost($iSocket)
	Return _Monkey_Getvar($iSocket, "build.host")
EndFunc   ;==>_Monkey_Get_BuildHost

;Function: _Monkey_Get_BuildId
;Alias for _Monkey_Getvar($iSocket, "build.id").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_BuildId($iSocket)
	Return _Monkey_Getvar($iSocket, "build.id")
EndFunc   ;==>_Monkey_Get_BuildId

;Function: _Monkey_Get_BuildManufacturer
;Alias for _Monkey_Getvar($iSocket, "build.manufacturer").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_BuildManufacturer($iSocket)
	Return _Monkey_Getvar($iSocket, "build.manufacturer")
EndFunc   ;==>_Monkey_Get_BuildManufacturer

;Function: _Monkey_Get_BuildModel
;Alias for _Monkey_Getvar($iSocket, "build.model").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_BuildModel($iSocket)
	Return _Monkey_Getvar($iSocket, "build.model")
EndFunc   ;==>_Monkey_Get_BuildModel

;Function: _Monkey_Get_BuildProduct
;Alias for _Monkey_Getvar($iSocket, "build.product").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_BuildProduct($iSocket)
	Return _Monkey_Getvar($iSocket, "build.product")
EndFunc   ;==>_Monkey_Get_BuildProduct

;Function: _Monkey_Get_BuildTags
;Alias for _Monkey_Getvar($iSocket, "build.tags").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_BuildTags($iSocket)
	Return _Monkey_Getvar($iSocket, "build.tags")
EndFunc   ;==>_Monkey_Get_BuildTags

;Function: _Monkey_Get_BuildType
;Alias for _Monkey_Getvar($iSocket, "build.type").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_BuildType($iSocket)
	Return _Monkey_Getvar($iSocket, "build.type")
EndFunc   ;==>_Monkey_Get_BuildType

;Function: _Monkey_Get_BuildUser
;Alias for _Monkey_Getvar($iSocket, "build.user").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_BuildUser($iSocket)
	Return _Monkey_Getvar($iSocket, "build.user")
EndFunc   ;==>_Monkey_Get_BuildUser

;Function: _Monkey_Get_BuildVersionCodename
;Alias for _Monkey_Getvar($iSocket, "build.version.codename").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_BuildVersionCodename($iSocket)
	Return _Monkey_Getvar($iSocket, "build.version.codename")
EndFunc   ;==>_Monkey_Get_BuildVersionCodename

;Function: _Monkey_Get_BuildVersionIncremental
;Alias for _Monkey_Getvar($iSocket, "build.version.incremental").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_BuildVersionIncremental($iSocket)
	Return _Monkey_Getvar($iSocket, "build.version.incremental")
EndFunc   ;==>_Monkey_Get_BuildVersionIncremental

;Function: _Monkey_Get_BuildVersionRelease
;Alias for _Monkey_Getvar($iSocket, "build.version.release").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_BuildVersionRelease($iSocket)
	Return _Monkey_Getvar($iSocket, "build.version.release")
EndFunc   ;==>_Monkey_Get_BuildVersionRelease

;Function: _Monkey_Get_BuildVersionSdk
;Alias for _Monkey_Getvar($iSocket, "build.version.sdk").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_BuildVersionSdk($iSocket)
	Return _Monkey_Getvar($iSocket, "build.version.sdk")
EndFunc   ;==>_Monkey_Get_BuildVersionSdk

;Function: _Monkey_Get_ClockMillis
;Alias for _Monkey_Getvar($iSocket, "clock.millis").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_ClockMillis($iSocket)
	Return _Monkey_Getvar($iSocket, "clock.millis")
EndFunc   ;==>_Monkey_Get_ClockMillis

;Function: _Monkey_Get_ClockRealtime
;Alias for _Monkey_Getvar($iSocket, "clock.realtime").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_ClockRealtime($iSocket)
	Return _Monkey_Getvar($iSocket, "clock.realtime")
EndFunc   ;==>_Monkey_Get_ClockRealtime

;Function: _Monkey_Get_ClockUptime
;Alias for _Monkey_Getvar($iSocket, "clock.uptime").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_ClockUptime($iSocket)
	Return _Monkey_Getvar($iSocket, "clock.uptime")
EndFunc   ;==>_Monkey_Get_ClockUptime

;Function: _Monkey_Get_DisplayDensity
;Alias for _Monkey_Getvar($iSocket, "display.density").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_DisplayDensity($iSocket)
	Return _Monkey_Getvar($iSocket, "display.density")
EndFunc   ;==>_Monkey_Get_DisplayDensity

;Function: _Monkey_Get_DisplayHeight
;Alias for _Monkey_Getvar($iSocket, "display.height").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_DisplayHeight($iSocket)
	Return _Monkey_Getvar($iSocket, "display.height")
EndFunc   ;==>_Monkey_Get_DisplayHeight

;Function: _Monkey_Get_DisplayWidth
;Alias for _Monkey_Getvar($iSocket, "display.width").
;
;Parameters:
;   $iSocket  - Integer The socket identifier (SocketID) as returned by _Monkey_Connect
;
;Returns:
;	Success: String The value of the variable. Failure: False
Func _Monkey_Get_DisplayWidth($iSocket)
	Return _Monkey_Getvar($iSocket, "display.width")
EndFunc   ;==>_Monkey_Get_DisplayWidth