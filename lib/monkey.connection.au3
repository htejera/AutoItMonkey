;monkey.connection.au3
;
;Author:
; henrytejera@gmail.com

;Function: _Monkey_Connect
;Uses TCPConnect() to open a new TCP connection to monkey. Useful when combined with adb forward.
;When you call this function assume that monkey is already running (via adb shell monkey --port 1080)
;and a port forwarding (adb forward tcp:1080 tcp:1080) has been set up.
;
;Parameters:
;   $iPort  - Integer Port on which the created socket will be connected.
;
;Returns:
;   Success: The main socket identifier.
;	Failure: Sets the @error flag to non-zero.
;	@error:  1 port is incorrect.
;			 Windows API WSAGetError return value. Visit <http://msdn.microsoft.com/en-us/library/ms740668.aspx>.
Func _Monkey_Connect($iPort)
	Local $iSocket
	Local $iErrorCode
	Local $sErrorMsg = "Port shuold be a number"
	ConsoleWrite("Trying to connect to Monkey on [127.0.0.1:" & $iPort & "]" & @CRLF)
	TCPStartup()
	
	If (IsInt($iPort) <> 1) Then
		_Monkey_Error($sErrorMsg, 1, @ScriptLineNumber)
		Return SetError(1, 1, $sErrorMsg)
	EndIf
	
	$iSocket = TCPConnect("127.0.0.1", $iPort) ;For security reasons, the Monkey only binds to localhost.
	If @error Then
		$iErrorCode = @error
		$sErrorMsg = "TCPConnect error"
		_Monkey_Error($sErrorMsg, @error, @ScriptLineNumber)
		Return SetError($iErrorCode, 2, $sErrorMsg)
	EndIf
	Return $iSocket
EndFunc   ;==>_Monkey_Connect

;Function: _Monkey_Shutdown
;Closes a TCP socket.
;
;Parameters:
;   $$iSocket  - Integer The socket identifier (SocketID) as returned by a _Monkey_Connect.
;
;Returns:
;   Success: 1.
;	Failure: Sets the @error flag to non-zero.
;	@error:  Windows API WSAGetError return value. Visit <http://msdn.microsoft.com/en-us/library/ms740668.aspx>.
Func _Monkey_Shutdown($iSocket)
	ConsoleWrite("Monkey: Closes a TCP socket." & @CRLF)
	Return TCPCloseSocket($iSocket)
EndFunc   ;==>_Monkey_Shutdown

;Function: _Monkey_On_Exit
;Stops TCP services.
Func _Monkey_On_Exit()
	ConsoleWrite("Monkey: Stops TCP services." & @CRLF)
	TCPShutdown()
EndFunc   ;==>_Monkey_On_Exit