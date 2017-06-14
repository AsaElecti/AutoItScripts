#include <MsgBoxConstants.au3>
#include <c:\Mine\Code\AutoIT\Variables\connectionToVariables.au3>
#include <C:\Mine\Code\AutoIT\CodeAndExe\Methods\StartBarsForKF.au3>
#include <C:\Mine\Code\AutoIT\CodeAndExe\Methods\SetClientData.au3>

AutoItSetOption("SendKeyDelay",10); Функция, которая устанавливает задержку между нажатиями клавиш, так как скрипт не всегда успевает написать все необходимое)))

If FileExists("C:\Mine\Code\AutoIT\CodeAndExe\Methods\StartBarsForKF.au3") Then
   ;MsgBox($MB_SYSTEMMODAL, "Error", "File C:\Mine\Code\AutoIT\CodeAndExe\Methods\StartBarsForKF.au3 exists!!! ")
Else
   MsgBox($MB_SYSTEMMODAL, "Error", "File C:\Mine\Code\AutoIT\CodeAndExe\Methods\StartBarsForKF.au3 does not exist! ")
EndIf

If FileExists("C:\Mine\Code\AutoIT\CodeAndExe\Methods\SetClientData.au3") Then
   ;MsgBox($MB_SYSTEMMODAL, "Error", "File C:\Mine\Code\AutoIT\CodeAndExe\Methods\SetClientData.au3 exists!!! ")
Else
   MsgBox($MB_SYSTEMMODAL, "Error", "File C:\Mine\Code\AutoIT\CodeAndExe\Methods\SetClientData.au3 does not exist! ")
EndIf

StartEmulator()
SetClientData($branch, $rnk, $nameFO)