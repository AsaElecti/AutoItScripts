; /335106/000369/000379/   /335106/000218/   /335106/

AutoItSetOption("SendKeyDelay",10); Функция, которая устанавливает задержку между нажатиями клавиш, так как скрипт не всегда успевает написать все необходимое)))


$rnkOpen = FileOpen('C:\Mine\Code\AutoIT\rnk.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $rnkOpen = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл.")
    Exit
EndIf

$rnk = FileReadLine($rnkOpen); считываем данные
FileClose($rnkOpen) ;закрываем файл

;MsgBox(0, "Содержимое the file rnk", $rnk)
;----------------------------------------------------------------------------------


$branchOpen = FileOpen('C:\Mine\Code\AutoIT\branch.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $branchOpen = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл.")
    Exit
EndIf

$branch = FileReadLine($branchOpen); считываем данные
FileClose($branchOpen);закрываем файл

;MsgBox(0, "Содержимое the file branch", $branch)
;----------------------------------------------------------------------------------

$branch2Open = FileOpen('C:\Mine\Code\AutoIT\branch2.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $branch2Open = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл.")
    Exit
EndIf

$branch2 = FileReadLine($branch2Open); считываем данные
FileClose($branch2Open);закрываем файл

;MsgBox(0, "Содержимое the file branch2", $branch2)
;----------------------------------------------------------------------------------

$branch3Open = FileOpen('C:\Mine\Code\AutoIT\branch3.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $branch3Open = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл.")
    Exit
EndIf

$branch3 = FileReadLine($branch3Open); считываем данные
FileClose($branch3Open);закрываем файл

;MsgBox(0, "Содержимое the file branch"3, $branch3)
;----------------------------------------------------------------------------------


$nameOpen = FileOpen('C:\Mine\Code\AutoIT\name.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $nameOpen = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл.")
    Exit
EndIf

$name = FileReadLine($nameOpen); считываем данные
FileClose($nameOpen);закрываем файл

;MsgBox(0, "Содержимое the file Name", $name)
;----------------------------------------------------------------------------------


$dateOpen = FileOpen('C:\Mine\Code\AutoIT\date.txt', 0); открываем файл
; Проверяет, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $nameOpen = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл.")
    Exit
EndIf

$date = FileReadLine($dateOpen); считываем данные
FileClose($dateOpen);закрываем файл

;MsgBox(0, "Содержимое файла date.txt, $date)
;----------------------------------------------------------------------------------


$depAgrNumberOpen = FileOpen('C:\Mine\Code\AutoIT\depAgrNumber.txt', 0); открываем файл
; Проверяет, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $nameOpen = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл.")
    Exit
EndIf

$depAgrNumber = FileReadLine($depAgrNumberOpen); считываем данные
FileClose($depAgrNumberOpen);закрываем файл

;MsgBox(0, "Содержимое файла depAgrNumber.txt, $depAgrNumber)
;----------------------------------------------------------------------------------


$prAgrNumberOpen = FileOpen('C:\Mine\Code\AutoIT\prAgrNumber.txt', 0); открываем файл
; Проверяет, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $nameOpen = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл.")
    Exit
EndIf

$prAgrNumber = FileReadLine($prAgrNumberOpen); считываем данные
FileClose($prAgrNumberOpen);закрываем файл

;MsgBox(0, "Содержимое файла depAgrNumber.txt, $depAgrNumber)
;----------------------------------------------------------------------------------




Func StartEmulator()
;Запускаем емулятор из командной строки и разворачиваем его на весь экран
	Run("cmd.exe")
	;Wait for CMD to be opened
	WinWaitActive("Administrator: C:\Windows\system32\cmd.exe", "", 1)
	;Ниже в комментах то как мы раньше вытаскивали запрос из файла и копировали в буфер
	Send('cd c:\Mine\BarsEmulator\' & "{ENTER}");write down the path
	Send('start BARS-Emulyator.exe' & "{ENTER}")
	WinWaitActive("BARS Tool")
	Send("{ALT}{SPACE}{DOWN 4}"); kombinacia klavish dla togo chobi razvernut okno
	Send("{ENTER}"); nagimaem enter
;Запускаем сессию на 1м полигоне
	MouseClick("left", 610, 40, 1, 3000)
	MouseClick("left", 540, 90, 1, 3000)
	MouseClick("left", 95, 45, 1, 3000)
	Sleep(7000)
EndFunc

Func CreatAgr($agrType, $branch, $status, $date, $dateClose, $userLogin, $userFio)
	MouseClick("left", 35, 285, 1, 2000); нажимаем SetAgrData
	Sleep(3000)
	MouseClick("left", 250, 1020, 1, 3000);генерим пустой запрос - так емулятор быстрее раздупляется
	Sleep(1000)
	;тройной щелчек мышью вместо CTRL+A
	MouseClick("left", 540, 85, 1, 3000)
	Sleep(50)
	MouseClick("left", 540, 85, 1, 3000)
	Sleep(50)
	MouseClick("left", 540, 85, 1, 3000)
	Sleep(1000)
	$request = '{"sessionid":"1nmah2sa4fq33uoss0tzlzsa","method":"SetAgreementDataU","params":[{"agr_code":"321","RNK":"'&$rnk&'","changed":"'&$date&'","created":"'&$date&'","client_type":2,"branch_id":"'&$branch&'","user_login":"'&$userLogin&'","user_fio":"'&$userFio&'","agr_type":"'&$agrType&'","agr_status":"'&$status&'","agr_number":"'&$depAgrNumber&'","agr_date_open":"'&$date&'","agr_date_close":"'&$dateClose&'"}],"message_id":"BARS-MESS-379518"}'

	ClipPut($request)
	Sleep(500)
	Send("{DEL}"); это тут только для того,чтобы перейти к команде "Send" до вставки, так как она не всегда отрабатывает корректно
	Sleep(200)

	Send("^v")
	Sleep(50)
	Sleep(1000)
	MouseClick("left", 350, 1020, 1, 3000)
	Sleep(6000)
EndFunc

StartEmulator()

CreatAgr("pr_uo", $branch, "1", "02/09/2017 12:55:33", "", "U26_001_S60", "Павлюченко Валентина Андріївна" ); step 6 in testCase
Sleep(2000)
CreatAgr("pr_uo", $branch2, "1", "02/09/2017 12:55:33", "", "U26_001_S602", "Петренко Петро Петрович" ); step 10 in testCase
Sleep(2000)
CreatAgr("pr_uo", $branch3, "0", "02/09/2017 12:55:33", "02/09/2017 12:55:33", "U26_001_S602", "Петренко Петро Петрович" ); step 14 in testCase
Sleep(2000)
CreatAgr("pr_uo", $branch, "0", "02/09/2017 12:55:33", "02/09/2024 12:55:33", "U26_001_S602", "Дмитренко Дмитро Дмитрович" ); step 15 in testCase
Sleep(5000)

WinClose("BARS Tool"); close BARS
Sleep(2000)
Send('exit' & "{ENTER}"); close CMD