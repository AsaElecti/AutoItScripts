; /335106/000369/000379/   /335106/000218/   /335106/

AutoItSetOption("SendKeyDelay",10); Функция, которая устанавливает задержку между нажатиями клавиш, так как скрипт не всегда успевает написать все необходимое)))


$rnkOpen = FileOpen('C:\docs_own\2017\scripts\autoIT\CreatCorpClient\CreatEverything\rnk.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $rnkOpen = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл.")
    Exit
EndIf

$rnk = FileReadLine($rnkOpen); считываем данные
FileClose($rnkOpen) ;закрываем файл

;MsgBox(0, "Содержимое the file rnk", $rnk)
;----------------------------------------------------------------------------------


$branchOpen = FileOpen('C:\docs_own\2017\scripts\autoIT\CreatCorpClient\CreatEverything\branch.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $branchOpen = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл.")
    Exit
EndIf

$branch = FileReadLine($branchOpen); считываем данные
FileClose($branchOpen);закрываем файл

;MsgBox(0, "Содержимое the file branch", $branch)
;----------------------------------------------------------------------------------


$nameOpen = FileOpen('C:\docs_own\2017\scripts\autoIT\CreatCorpClient\CreatEverything\name.txt', 0); открываем файл
; Проверяем, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $nameOpen = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл.")
    Exit
EndIf

$name = FileReadLine($nameOpen); считываем данные
FileClose($nameOpen);закрываем файл

;MsgBox(0, "Содержимое the file Name", $name)
;----------------------------------------------------------------------------------


$dateOpen = FileOpen('C:\docs_own\2017\scripts\autoIT\CreatCorpClient\CreatEverything\date.txt', 0); открываем файл
; Проверяет, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $nameOpen = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл.")
    Exit
EndIf

$date = FileReadLine($dateOpen); считываем данные
FileClose($dateOpen);закрываем файл

;MsgBox(0, "Содержимое файла date.txt, $date)
;----------------------------------------------------------------------------------


$depAgrNumberOpen = FileOpen('C:\docs_own\2017\scripts\autoIT\CreatCorpClient\CreatEverything\depAgrNumber.txt', 0); открываем файл
; Проверяет, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $nameOpen = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл.")
    Exit
EndIf

$depAgrNumber = FileReadLine($depAgrNumberOpen); считываем данные
FileClose($depAgrNumberOpen);закрываем файл

;MsgBox(0, "Содержимое файла depAgrNumber.txt, $depAgrNumber)
;----------------------------------------------------------------------------------


$prAgrNumberOpen = FileOpen('C:\docs_own\2017\scripts\autoIT\CreatCorpClient\CreatEverything\prAgrNumber.txt', 0); открываем файл
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
	Send('cd c:\Program Files\BarsEmulator' & "{ENTER}");write down the path
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

Func CreatAgrAll()
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
	$request = '{"sessionid":"xdve0cqgh3cqt3f35rr1iwpt","method":"SetAgreementDataU","params":[{"agr_code":"124","RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","client_type":2,"branch_id":"'&$branch&'","user_login":"U26_001_S60","user_fio":"Павлюченко Валентина  Андріївна","agr_type":"dep_uo","agr_status":"1","agr_number":"'&$depAgrNumber&'","agr_date_open":"'&$date&'","agr_date_close":""},{"agr_code":"125","RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","client_type":2,"branch_id":"'&$branch&'","user_login":"U26_001_S60","user_fio":"Павлюченко Валентина  Андріївна","agr_type":"pr_uo","agr_status":"1","agr_number":"'&$prAgrNumber&'","agr_date_open":"'&$date&'","agr_date_close":""},{"agr_code":"126","RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","client_type":2,"branch_id":"'&$branch&'","user_login":"U26_001_S60","user_fio":"Павлюченко Валентина  Андріївна","agr_type":"kpk_uo","agr_status":"10","agr_number":"126","agr_date_open":"'&$date&'","agr_date_close":""}, {"agr_code":"127","RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","client_type":2,"branch_id":"'&$branch&'","user_login":"U26_001_S60","user_fio":"Павлюченко Валентина  Андріївна","agr_type":"dbo_uo","agr_status":"10","agr_number":"127","agr_date_open":"'&$date&'","agr_date_close":""}],"message_id":"BARS-MESS-379518"}'
	Sleep(500)
	ClipPut($request)
	Sleep(500)
	Send("{DEL}"); это тут только для того,чтобы перейти к команде "Send" до вставки, так как она не всегда отрабатывает корректно
	Sleep(200)
	;Танцы с бубном, чтобы вставить строку из буфера: стандартная комбинация не всегда отрабатывает корректно
	Send("{CTRLDOWN}") ; Удерживать клавишу CTRL нажатой
	Sleep(200)
	Send("^v")
	Sleep(50)
	Send("{CTRLUP}") ;Отпустить клавишу CTRL
	Sleep(1000)
	MouseClick("left", 350, 1020, 1, 3000)
	Sleep(6000)
EndFunc

StartEmulator()
CreatAgrAll()
WinClose("BARS Tool"); close BARS
Sleep(2000)
Send('exit' & "{ENTER}"); close CMD