#include <MsgBoxConstants.au3>
;V ETOM FAILE PODKLUCHAUTSYA VSE PEREMENNIE IZ FAILOV. PRI NEDOSTUPNOSTI FAILA-PEREMENNOY VIVODITSYA SOOBSHENIE


$rnk = FileOpen('c:\Mine\Code\AutoIT\Variables\rnk.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $rnk = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл. (c:\Mine\Code\AutoIT\Variables\rnk.txt)")
    Exit
EndIf

$rnk = FileReadLine($rnk); считываем данные
FileClose($rnk) ;закрываем файл

;MsgBox(0, "Содержимое the file rnk", $rnk)
;----------------------------------------------------------------------------------

$rnk2 = FileOpen('c:\Mine\Code\AutoIT\Variables\rnk2.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $rnk2 = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл. (c:\Mine\Code\AutoIT\Variables\rnk2.txt)")
    Exit
EndIf

$rnk2 = FileReadLine($rnk2); считываем данные
FileClose($rnk2) ;закрываем файл

;MsgBox(0, "Содержимое the file rnk2", $rnk2)
;----------------------------------------------------------------------------------

$rnk3 = FileOpen('c:\Mine\Code\AutoIT\Variables\rnk3.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $rnk3 = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл. (c:\Mine\Code\AutoIT\Variables\rnk3.txt)")
    Exit
EndIf

$rnk3 = FileReadLine($rnk3); считываем данные
FileClose($rnk3) ;закрываем файл

;MsgBox(0, "Содержимое the file rnk3", $rnk3)
;----------------------------------------------------------------------------------

$accountNumber = FileOpen('c:\Mine\Code\AutoIT\Variables\accountNumber.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $accountNumber = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл. (c:\Mine\Code\AutoIT\Variables\accountNumber.txt)")
    Exit
EndIf

$accountNumber = FileReadLine($accountNumber); считываем данные
FileClose($accountNumber) ;закрываем файл

;MsgBox(0, "Содержимое the file accountNumber", $accountNumber)
;----------------------------------------------------------------------------------

$accountType = FileOpen('c:\Mine\Code\AutoIT\Variables\accountType.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $accountType = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл. (c:\Mine\Code\AutoIT\Variables\accountType.txt)")
    Exit
EndIf

$accountType = FileReadLine($accountType); считываем данные
FileClose($accountType) ;закрываем файл

;MsgBox(0, "Содержимое the file accountType", $accountType)
;----------------------------------------------------------------------------------

$agreementCode = FileOpen('c:\Mine\Code\AutoIT\Variables\agreementCode.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $agreementCode = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл. (c:\Mine\Code\AutoIT\Variables\agreementCode.txt)")
    Exit
EndIf

$agreementCode = FileReadLine($agreementCode); считываем данные
FileClose($agreementCode) ;закрываем файл

;MsgBox(0, "Содержимое the file agreementCode", $agreementCode)
;----------------------------------------------------------------------------------

$agreementNumberDep = FileOpen('c:\Mine\Code\AutoIT\Variables\agreementNumberDep.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $agreementNumberDep = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл. (c:\Mine\Code\AutoIT\Variables\agreementNumberDep.txt)")
    Exit
EndIf

$agreementNumberDep = FileReadLine($agreementNumberDep); считываем данные
FileClose($agreementNumberDep) ;закрываем файл

;MsgBox(0, "Содержимое the file agreementNumberDep", $agreementNumberDep)
;----------------------------------------------------------------------------------

$agreementNumberPR = FileOpen('c:\Mine\Code\AutoIT\Variables\agreementNumberPR.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $agreementNumberPR = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл. (c:\Mine\Code\AutoIT\Variables\agreementNumberPR.txt)")
    Exit
EndIf

$agreementNumberPR = FileReadLine($agreementNumberPR); считываем данные
FileClose($agreementNumberPR) ;закрываем файл

;MsgBox(0, "Содержимое the file agreementNumberPR", $agreementNumberPR)
;----------------------------------------------------------------------------------

$agreementType = FileOpen('c:\Mine\Code\AutoIT\Variables\agreementType.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $agreementType = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл. (c:\Mine\Code\AutoIT\Variables\agreementType.txt)")
    Exit
EndIf

$agreementType = FileReadLine($agreementType); считываем данные
FileClose($agreementType) ;закрываем файл

;MsgBox(0, "Содержимое the file agreementType", $agreementType)
;----------------------------------------------------------------------------------

$branch = FileOpen('c:\Mine\Code\AutoIT\Variables\branch.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $branch = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл. (c:\Mine\Code\AutoIT\Variables\branch.txt)")
    Exit
EndIf

$branch = FileReadLine($branch); считываем данные
FileClose($branch) ;закрываем файл

;MsgBox(0, "Содержимое the file branch", $branch)
;----------------------------------------------------------------------------------

$branch2 = FileOpen('c:\Mine\Code\AutoIT\Variables\branch2.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $branch2 = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл. (c:\Mine\Code\AutoIT\Variables\branch2.txt)")
    Exit
EndIf

$branch2 = FileReadLine($branch2); считываем данные
FileClose($branch2) ;закрываем файл

;MsgBox(0, "Содержимое the file branch2", $branch2)
;----------------------------------------------------------------------------------

$branch3 = FileOpen('c:\Mine\Code\AutoIT\Variables\branch3.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $branch3 = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл. (c:\Mine\Code\AutoIT\Variables\branch3.txt)")
    Exit
EndIf

$branch3 = FileReadLine($branch3); считываем данные
FileClose($branch3) ;закрываем файл

;MsgBox(0, "Содержимое the file branch3", $branch3)
;----------------------------------------------------------------------------------

$date = FileOpen('c:\Mine\Code\AutoIT\Variables\date.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $date = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл. (c:\Mine\Code\AutoIT\Variables\date.txt)")
    Exit
EndIf

$date = FileReadLine($date); считываем данные
FileClose($date) ;закрываем файл

;MsgBox(0, "Содержимое the file date", $date)
;----------------------------------------------------------------------------------

$dateFuture = FileOpen('c:\Mine\Code\AutoIT\Variables\dateFuture.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $dateFuture = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл. (c:\Mine\Code\AutoIT\Variables\dateFuture.txt)")
    Exit
EndIf

$dateFuture = FileReadLine($dateFuture); считываем данные
FileClose($dateFuture) ;закрываем файл

;MsgBox(0, "Содержимое the file dateFuture", $dateFuture)
;----------------------------------------------------------------------------------

$datePast = FileOpen('c:\Mine\Code\AutoIT\Variables\datePast.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $datePast = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл. (c:\Mine\Code\AutoIT\Variables\datePast.txt)")
    Exit
EndIf

$datePast = FileReadLine($datePast); считываем данные
FileClose($datePast) ;закрываем файл

;MsgBox(0, "Содержимое the file datePast", $datePast)
;----------------------------------------------------------------------------------

$nameFO = FileOpen('c:\Mine\Code\AutoIT\Variables\nameFO.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $nameFO = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл. (c:\Mine\Code\AutoIT\Variables\nameFO.txt)")
    Exit
EndIf

$nameFO = FileReadLine($nameFO); считываем данные
FileClose($nameFO) ;закрываем файл

;MsgBox(0, "Содержимое the file nameFO", $nameFO)
;----------------------------------------------------------------------------------

$nameUO = FileOpen('c:\Mine\Code\AutoIT\Variables\nameUO.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $nameUO = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл. (c:\Mine\Code\AutoIT\Variables\nameUO.txt)")
    Exit
EndIf

$nameUO = FileReadLine($nameUO); считываем данные
FileClose($nameUO) ;закрываем файл

;MsgBox(0, "Содержимое the file nameUO", $nameUO)
;----------------------------------------------------------------------------------
