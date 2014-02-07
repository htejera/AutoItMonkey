;monkey.error.au3
;
;Author:
; henrytejera@gmail.com

Global $Monkey_Last_Error = ""

;Function: _Monkey_Error
;Set an error. Writes data to the STDOUT  stream and set the $Monkey_Last_Error.
;
;Parameters:
;   $sErrorDescription - String Error description.
;	$iErrorCode - Integer Error code
;	$iScriptLine - Caller line number.
Func _Monkey_Error($sErrorDescription, $iErrorCode, $iScriptLine)
	Local $sErrorMessage = "Monkey Error " & @CRLF & _
			"Description: " & $sErrorDescription & @CRLF & _
			"Error code: " & $iErrorCode & @CRLF & _
			"Script line: " & $iScriptLine
	$Monkey_Last_Error = $sErrorMessage
	ConsoleWrite($sErrorMessage & @CRLF)
EndFunc   ;==>_Monkey_Error

;Function: _Monkey_Command_Error
;Set an error related with the commands execution. Writes data to the STDOUT stream and set the $Monkey_Last_Error.
;
;Parameters:
;   $sCommand - String Command name.
;	$aError - Array returned by Monkey with the error detail.
Func _Monkey_Command_Error($sCommand, $aError)
	Local $sErrorMessage = "Monkey Command Error " & @CRLF & _
			"Command: " & $sCommand & @CRLF & _
			"Error description: " & _ArrayToString($aError, " ")
	$Monkey_Last_Error = $sErrorMessage
	ConsoleWrite($sErrorMessage & @CRLF)
EndFunc   ;==>_Monkey_Command_Error
