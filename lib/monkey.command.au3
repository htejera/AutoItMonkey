;monkey.command.au3
;
;Author:
; henrytejera@gmail.com

;Function: _Monkey_Send
;Sends a raw protocol command to Monkey.
;
;Parameters:
;   $$iSocket  - Integer The socket identifier (SocketID) as returned by a _Monkey_Connect.
;	$sCommand  - String The command to send.
;   $$bReturnValue - Boolean True for commands that return a value, otherwise False. (default is False).
;
;Returns:
;   Success: True if $bReturnValue = False, otherwise return a String that is the command value.
;	Failure: False
Func _Monkey_Send($iSocket, $sCommand, $bReturnValue = False)
	Local $sResponse
	Local $aResponse
	ConsoleWrite("Monkey: Command [" & $sCommand & "]" & @CRLF)
	
	TCPSend($iSocket, $sCommand & @CRLF)
	If @error Then
		_Monkey_Error("Could not send the data", @error, @ScriptLineNumber)
		Return False
	EndIf

	Do
		$sResponse = TCPRecv($iSocket, 1000000)
	Until $sResponse
	$aResponse = _Monkey_Split_Response($sResponse)
	If ($aResponse[0] <> "ERROR") Then
		If ($bReturnValue = True) Then
			_ArrayDelete($aResponse, 0) ;Delete the status (OK or ERROR) element.
			Return _ArrayToString($aResponse, " ")
		Else
			Return True
		EndIf
	Else
		_Monkey_Command_Error($sCommand, $aResponse)
		Return False
	EndIf
EndFunc   ;==>_Monkey_Send

;Function: _Monkey_Split_Response
;Split the Monkey response into an Array.
;
;Parameters:
;   $sResponse - String Monkey response.
;
;Returns:
;   Array (0-based)
Func _Monkey_Split_Response($sResponse)
	Local $aResponse
	$sResponse = StringReplace($sResponse, ":", " ")
	$aResponse = StringSplit($sResponse, " ", 2) ;Disable the return count in the first element
	Return $aResponse
EndFunc   ;==>_Monkey_Split_Response
