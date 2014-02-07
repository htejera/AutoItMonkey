;monkey.test.suit.au3
;
;Author:
; henrytejera@gmail.com
;
;Description:
; Assume that monkey is already running (via adb shell monkey --port 1088) 
; and a port forwarding (adb forward tcp:1088 tcp:1088) has been set up.
; Micro unit testing framework | Visit <http://htejera.users.sourceforge.net/micro/>

#include "../lib/micro/micro.au3"
#include "../monkey.au3"

Global $iMonkeyPort = 1088

;Run suite
testSuite($iMonkeyPort)

;TestSuite
Func testSuite($iPort)
	Local $sDescription 
	Local $oMonkeyTestSuite = _testSuite_("Monkey_Test","html")
	Local $iSocket = _Monkey_Connect($iPort)
		
	Local $oTest_API = _test_("Test_Monkey_API")
	$sDescription = 'Monkey %s command should return true'
	With $oTest_API	
		.step('Monkey connection', .assertType("number", $iSocket))	
		.step("Monkey Listvar command should return all the vars that the monkey knows about", .assertType("string",_Monkey_Listvar($iSocket)))	
		.step("Monkey Getvar command should return the value of the given vart", .assertType("string",_Monkey_Getvar($iSocket,"build.version.sdk")))	
		.step(StringFormat($sDescription, "Tap"), .assertTrue(_Monkey_Tap($iSocket, 100, 100)))
		.step(StringFormat($sDescription, "Type"), .assertTrue(_Monkey_Type($iSocket, "Hello Monkey!")))
		.step(StringFormat($sDescription, "Touch down"), .assertTrue(_Monkey_Touch_Down($iSocket, 100, 100)))
		.step(StringFormat($sDescription, "Touch up"), .assertTrue(_Monkey_Touch_Up($iSocket, 100, 100)))
		.step(StringFormat($sDescription, "Touch move"), .assertTrue(_Monkey_Touch_Move($iSocket, 100, 100)))
		.step(StringFormat($sDescription, "Trackball"),.assertTrue(_Monkey_Trackball($iSocket, 10, 10)))
		.step(StringFormat($sDescription, "Flip open"), .assertTrue(_Monkey_Flip_Open($iSocket)))
		.step(StringFormat($sDescription, "Flip close"), .assertTrue(_Monkey_Flip_Close($iSocket)))
		.step(StringFormat($sDescription, "Key down"), .assertTrue(_Monkey_Key_Down($iSocket, $KEYCODE_MENU)))
		.step(StringFormat($sDescription, "Key up"), .assertTrue(_Monkey_Key_Up($iSocket, $KEYCODE_MENU)))
		.step(StringFormat($sDescription, "Wake"), .assertTrue(_Monkey_Wake($iSocket)))	
		.step(StringFormat($sDescription, "Sleep"), .assertTrue(_Monkey_Sleep($iSocket,100)))	
		.addToSuite($oMonkeyTestSuite)
	EndWith
	$oTest_API = 0

	Local $oTest_API_Alias = _test_("Test_Monkey_API_Alias")
	$sDescription = 'Monkey Get_%s alias command should return a string'
	With $oTest_API_Alias			
		.step(StringFormat($sDescription, "AmCurrentAction"), .assertType("string",_Monkey_Get_AmCurrentAction($iSocket)))
		.step(StringFormat($sDescription, "AmCurrentCategories"), .assertType("string",_Monkey_Get_AmCurrentCategories($iSocket)))
		.step(StringFormat($sDescription, "AmCurrentCompClass"), .assertType("string",_Monkey_Get_AmCurrentCompClass($iSocket)))
		.step(StringFormat($sDescription, "AmCurrentCompPackage"), .assertType("string",_Monkey_Get_AmCurrentCompPackage($iSocket)))
		.step(StringFormat($sDescription, "CurrentData"), .assertType("string",_Monkey_Get_CurrentData($iSocket)))
		.step(StringFormat($sDescription, "BuildBoard"), .assertType("string",_Monkey_Get_BuildBoard($iSocket)))
		.step(StringFormat($sDescription, "BuildBrand"), .assertType("string",_Monkey_Get_BuildBrand($iSocket)))
		.step(StringFormat($sDescription, "BuildCpuAbi"), .assertType("string",_Monkey_Get_BuildCpuAbi($iSocket)))
		.step(StringFormat($sDescription, "BuildDevice"), .assertType("string",_Monkey_Get_BuildDevice($iSocket)))
		.step(StringFormat($sDescription, "BuildDisplay"), .assertType("string",_Monkey_Get_BuildDisplay($iSocket)))
		.step(StringFormat($sDescription, "BuildFingerprint"), .assertType("string",_Monkey_Get_BuildFingerprint($iSocket)))
		.step(StringFormat($sDescription, "BuildHost"), .assertType("string",_Monkey_Get_BuildHost($iSocket)))
		.step(StringFormat($sDescription, "BuildId"), .assertType("string",_Monkey_Get_BuildId($iSocket)))
		.step(StringFormat($sDescription, "BuildManufacturer"), .assertType("string",_Monkey_Get_BuildManufacturer($iSocket)))
		.step(StringFormat($sDescription, "BuildModel"), .assertType("string",_Monkey_Get_BuildModel($iSocket)))
		.step(StringFormat($sDescription, "BuildProduct"), .assertType("string",_Monkey_Get_BuildProduct($iSocket)))
		.step(StringFormat($sDescription, "BuildTags"), .assertType("string",_Monkey_Get_BuildTags($iSocket)))
		.step(StringFormat($sDescription, "BuildType"), .assertType("string",_Monkey_Get_BuildType($iSocket)))
		.step(StringFormat($sDescription, "BuildUser"), .assertType("string",_Monkey_Get_BuildUser($iSocket)))
		.step(StringFormat($sDescription, "BuildVersionCodename"), .assertType("string",_Monkey_Get_BuildVersionCodename($iSocket)))
		.step(StringFormat($sDescription, "BuildVersionIncremental"), .assertType("string",_Monkey_Get_BuildVersionIncremental($iSocket)))
		.step(StringFormat($sDescription, "BuildVersionRelease"), .assertType("string",_Monkey_Get_BuildVersionRelease($iSocket)))
		.step(StringFormat($sDescription, "BuildVersionSdk"), .assertType("string",_Monkey_Get_BuildVersionSdk($iSocket)))
		.step(StringFormat($sDescription, "ClockMillis"), .assertType("string",_Monkey_Get_ClockMillis($iSocket)))
		.step(StringFormat($sDescription, "ClockRealtime"), .assertType("string",_Monkey_Get_ClockRealtime($iSocket)))
		.step(StringFormat($sDescription, "ClockUptime"), .assertType("string",_Monkey_Get_ClockUptime($iSocket)))
		.step(StringFormat($sDescription, "DisplayDensity"), .assertType("string",_Monkey_Get_DisplayDensity($iSocket)))
		.step(StringFormat($sDescription, "DisplayHeight"), .assertType("string",_Monkey_Get_DisplayHeight($iSocket)))
		.step(StringFormat($sDescription, "DisplayWidth"), .assertType("string",_Monkey_Get_DisplayWidth($iSocket)))
		.addToSuite($oMonkeyTestSuite)
	EndWith
	$oTest_API_Alias = 0

	Local $oTest_Monkey_Error = _test_("Test_Monkey_Error")
	Local $sErrorExpected = "Monkey Error " & @CRLF & _
			"Description: Description" & @CRLF & _
			"Error code: 0" & @CRLF & _
			"Script line: 1" 
					
	Local $aError[2]
	$aError[0] = "ERROR"
	$aError[1] = "Invalid Arguments"
	
	With $oTest_Monkey_Error			
		 _Monkey_Error("Description",0,1)
		.step("Monkey global error should be set", .assertEquals($Monkey_Last_Error,$sErrorExpected))
					
		$sErrorExpected = "Monkey Command Error " & @CRLF & _
			"Command: type" & @CRLF & _
			"Error description: ERROR Invalid Arguments"
			
		 _Monkey_Command_Error("type", $aError)
		.step("Monkey command global error should be set", .assertEquals($Monkey_Last_Error,$sErrorExpected))
		.addToSuite($oMonkeyTestSuite)
	EndWith
	$oTest_Monkey_Error = 0

	$oMonkeyTestSuite.stop()
EndFunc   ;==>testSuite
