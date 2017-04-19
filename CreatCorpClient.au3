; /335106/000369/000379/   /335106/000218/   /335106/

AutoItSetOption("SendKeyDelay",10); Функция, которая устанавливает задержку между нажатиями клавиш, так как скрипт не всегда успевает написать все необходимое)))

;открываем файл РНК, считываем данные и закрываем файл
$rnkOpen = FileOpen('C:\Mine\Code\AutoIT\rnk.txt', 0)

; Проверяет, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $rnkOpen = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл.")
    Exit
EndIf

$rnk = FileReadLine($rnkOpen)
FileClose($rnkOpen)

;MsgBox(0, "Содержимое the file rnk", $rnk)
;----------------------------------------------------------------------------------
$branchOpen = FileOpen('C:\Mine\Code\AutoIT\branch.txt', 0)

; Проверяет, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $branchOpen = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл.")
    Exit
EndIf

$branch = FileReadLine($branchOpen)
FileClose($branchOpen)

;MsgBox(0, "Содержимое the file branch", $branch)
;----------------------------------------------------------------------------------
$nameOpen = FileOpen('C:\Mine\Code\AutoIT\name.txt', 0)

; Проверяет, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $nameOpen = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл.")
    Exit
EndIf

$name = FileReadLine($nameOpen)
FileClose($nameOpen)

;MsgBox(0, "Содержимое the file Name", $name)
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

Func CreatCorpClient()
	MouseClick("left", 45, 265, 1, 2000)
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
	$request = '{"sessionid":"xaap3wrv3y0eilo5gnij0fqu","method":"SetClientDataU","params":[{"branch_id":"'&$branch&'","rnk":'&$rnk&',"changed":"01/25/2017 14:48:07","created":"01/25/2017 14:48:07","client_type":"2","client_name":"'&$name&'","inn_edrpou":"25252525","user_login":"U26_001_S60","user_fio":"Павлюченко Валентина Андріївна","mergedRNK":[],"actualized_date":"","actualized_by":"","third_persons_clients":[], "third_persons_non_clients":[]}],"message_id":"BARS-MESS-379518"}'
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
	Sleep(4000)
EndFunc

StartEmulator()
CreatCorpClient()
WinClose("BARS Tool"); close BARS
Sleep(3000)
Send('exit' & "{ENTER}"); close CMD