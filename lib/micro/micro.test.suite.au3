;License:
;	This script is distributed under the MIT License
;
;Author:
;	oscar.tejera
;
;Description:
; Simple test suite module

Global $aResult[2]
$aResult[0] = "Failed"
$aResult[1] = "Passed"

;Function: _testSuite_
;Test suite object
;
;Parameters:
;	$sTestName - String Test name
;
;Returns:
;	Test object
Func _testSuite_($sSuiteName, $sReportFormat = "txt")
	Local $oClassObject = _AutoItObject_Class()
	Local $dicTest = ObjCreate("Scripting.Dictionary")
	Local $hFile
	Local $sReportFilePath
	Local $sReportContent
	Global $sHTMLTemplate = "report.html"
	$oClassObject.Create()

	If($sReportFormat = "html") Then
		 $sReportFilePath = @ScriptDir & "\" & $sSuiteName & "." & $sReportFormat
		 FileCopy(@ScriptDir & "\" &$sHTMLTemplate,$sReportFilePath,1)
		 ;Set title
		 $sReportContent = FileRead($sReportFilePath);
		 FileClose($sReportFilePath)
		 ;Write mode (erase previous contents)
		 $hFile = FileOpen($sReportFilePath,2)
		 $sReportContent = StringReplace($sReportContent,"<{$TestSuiteTitle>",$sSuiteName,0)
		 FileWrite($hFile,$sReportContent)
		 FileClose($hFile)

	 Else ;txt format
		 $sReportFormat = "txt"
		 $sReportFilePath = @ScriptDir & "\" & $sSuiteName & "." & $sReportFormat
		 $hFile = FileOpen($sReportFilePath,2)
		 FileClose($hFile)
	EndIf

	;Methods
	With $oClassObject
		.AddMethod("stop", "_Stop")
		.AddMethod("addTest", "_AddTest")
		.AddMethod("countTest", "_CountTests")
	EndWith

	;Property
	With $oClassObject
		.AddProperty("_type_", $ELSCOPE_PUBLIC, "_testSuite_") ;Object type
		.AddProperty("name", $ELSCOPE_PUBLIC, $sSuiteName)
		.AddProperty("format", $ELSCOPE_PUBLIC, $sReportFormat)
		.AddProperty("reportFilePath", $ELSCOPE_PUBLIC, $sReportFilePath)
		.AddProperty("reportFile", $ELSCOPE_PUBLIC, $hFile)
		.AddProperty("tests", $ELSCOPE_PUBLIC, $dicTest)
		.AddProperty("testsPassed", $ELSCOPE_PUBLIC, 0)
		.AddProperty("testsFailed", $ELSCOPE_PUBLIC, 0)
		.AddProperty("testCount", $ELSCOPE_PRIVATE, 0)
		.AddProperty("result", $ELSCOPE_PUBLIC, 1) ;0 Failed - 1 OK
		.AddProperty("startDate", $ELSCOPE_PUBLIC, _NowCalc())
	EndWith

	Return $oClassObject.Object
EndFunc   ;==>_testSuite_

;Function: _Stop
;
;
;
;Returns:
;	void
Func _Stop($oSelf)
	Local $iDuration
	$iDuration = _DateDiff('s', $oSelf.startDate, _NowCalc())

	If ($oSelf.format = "html") Then
		$sReportContent = FileRead($oSelf.reportFilePath)
		$sReportContent = StringReplace($sReportContent,'<($TestSuiteResult)>',$aResult[$oSelf.result],0)
		$sReportContent = StringReplace($sReportContent,'<($Duration)>',$iDuration,0)
		$sReportContent = StringReplace($sReportContent,'<($TestCount)>',$oSelf.testCount,0)
		$sReportContent = StringReplace($sReportContent,'<($TestFailed)>',$oSelf.testsFailed,0)
		$sReportContent = StringReplace($sReportContent,'<($TestPassed)>',$oSelf.testsPassed,0)
		$hFile = FileOpen($oSelf.reportFilePath,2)
		FileWrite($hFile,$sReportContent)
		FileClose($hFile)
	Else
		FileWriteLine($oSelf.reportFilePath, @CRLF & "=======================================")
		FileWriteLine($oSelf.reportFilePath, "Test suite: " & $oSelf.name & @CRLF)
		FileWriteLine($oSelf.reportFilePath, "Global result: " & $aResult[$oSelf.result] & @CRLF)
		FileWriteLine($oSelf.reportFilePath, "Finished in: " & $iDuration & " seconds." & $oSelf.testCount & " tests," & $oSelf.testsFailed & " failures," & $oSelf.testsPassed & " passed" & @CRLF)
		FileClose($oSelf.reportFilePath)
	EndIf
EndFunc   ;==>_Stop

;Function: _addTest
;Add a test case.
;
;Parameters:
;	$sTestName - String Test name
;	$iResult - Int Test Case result
;
;Returns:
;	void
Func _addTest($oSelf, $sTestName, $iResult)
	Local $dicTemp
	Local $aResult[2]

	$dicTemp = $oSelf.tests
	$oSelf.testCount = $oSelf.testCount + 1

	$aResult[0] = $sTestName
	$aResult[1] = $iResult

	;If a step fails, the test suite is marked as failed
	If $iResult = 0 Then
		$oSelf.result = 0
		$oSelf.testsFailed = $oSelf.testsFailed + 1
	Else
		$oSelf.testsPassed = $oSelf.testsPassed + 1
	EndIf

	$dicTemp.Add($oSelf.testCount, $aResult)
	$oSelf.tests = _CloneDict($dicTemp)
EndFunc   ;==>_AddTest

;Function: _countTest
;Count the test cases in test set
;
;
;Returns:
; int
Func _countTests($oSelf)
	Return $oSelf.testCount
EndFunc   ;==>_CountTests
