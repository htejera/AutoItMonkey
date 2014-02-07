;License:
;	This script is distributed under the MIT License 
;
;Author:
; oscar.tejera
;
;Description:;
;Include core files

#Region include
#include-once
#include <array.au3>
#include <date.au3>
#include <File.au3>
#include "AutoitObject.au3"
#include "micro.test.au3"
#include "micro.test.suite.au3"
#EndRegion include

#region Global
Global $dicFailedTest = ObjCreate("scripting.dictionary")

Global $aResult[2]
$aResult[0] = "fail"
$aResult[1] = "pass"

Global $sHTMLTemplate = "/lib/report.html"

;Initializes
_AutoItObject_Startup()
#endregion Global