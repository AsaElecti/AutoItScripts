; '&$branch&'000369/000379/   '&$branch&'000218/   '&$branch&'

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

Func CreatAccauntsAll()
	MouseClick("left", 35, 250, 1, 2000); нажимаем SetAccountDataU
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

; Далее в 4 этапа копипаситим скрипт в эмулятор - за один раз такой длинный скрипт не передается
	$request = '{"sessionid":"kclcjiiqarnz5bmres4dgz13","method":"SetAccountDataU","params":[{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"12401","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"'&$depAgrNumber&'","agr_code":"124","account_type":"dep_uo","account_status":1},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"12402","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"'&$date&'","agr_number":"'&$depAgrNumber&'","agr_code":"124","account_type":"dep_uo","account_status":2},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"12401","currency_code":"124","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"'&$depAgrNumber&'","agr_code":"124","account_type":"dep_uo","account_status":1},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"12403","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"'&$depAgrNumber&'","agr_code":"124","account_type":"dep_uo","account_status":3},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"12404","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"'&$depAgrNumber&'","agr_code":"124","account_type":"dep_uo","account_status":4},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"12405","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"'&$depAgrNumber&'","agr_code":"124","account_type":"dep_uo","account_status":5},'
	Sleep(500)
	ClipPut($request)
	Sleep(500)
	Send("{DEL}"); это тут только для того,чтобы перейти к команде "Send" до вставки, так как она не всегда отрабатывает корректно
	Sleep(200)
	Sleep(200)
	Send("^v")
	Sleep(1000)

	$request = '{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"12501","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"'&$prAgrNumber&'","agr_code":"125","account_type":"pr_uo","account_status":1},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"12502","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"'&$date&'","agr_number":"'&$prAgrNumber&'","agr_code":"125","account_type":"pr_uo","account_status":2},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"12501","currency_code":"124","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"127","agr_code":"125","account_type":"pr_uo","account_status":1},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"12503","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"'&$prAgrNumber&'","agr_code":"125","account_type":"pr_uo","account_status":3},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"12504","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"'&$prAgrNumber&'","agr_code":"125","account_type":"pr_uo","account_status":4},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"12505","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"'&$prAgrNumber&'","agr_code":"125","account_type":"pr_uo","account_status":5},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"265512601","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"126","agr_code":"126","account_type":"kpk_uo","account_status":1},'
	Sleep(500)
	ClipPut($request)
	Sleep(500)
	Send("{DEL}"); это тут только для того,чтобы перейти к команде "Send" до вставки, так как она не всегда отрабатывает корректно
	Sleep(200)
	Sleep(200)
	Send("^v")
	Sleep(1000)

	$request = '{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"265512401","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"127","agr_code":"127","account_type":"kpk_uo","account_status":1},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"265512402","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"'&$date&'","agr_number":"127","agr_code":"127","account_type":"kpk_uo","account_status":2},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"265512401","currency_code":"124","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"127","agr_code":"127","account_type":"kpk_uo","account_status":1},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"265512403","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"127","agr_code":"127","account_type":"kpk_uo","account_status":3},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"265512404","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"127","agr_code":"127","account_type":"kpk_uo","account_status":4},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"260512405","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"127","agr_code":"127","account_type":"kpk_uo","account_status":5},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"265512405","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"127","agr_code":"127","account_type":"kpk_uo","account_status":6},'
	Sleep(500)
	ClipPut($request)
	Sleep(500)
	Send("{DEL}"); это тут только для того,чтобы перейти к команде "Send" до вставки, так как она не всегда отрабатывает корректно
	Sleep(200)
	Sleep(200)
	Send("^v")
	Sleep(1000)

	$request = '{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"12701","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"127","agr_code":"127","account_type":"pr_uo","account_status":1},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"12702","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"'&$date&'","agr_number":"127","agr_code":"127","account_type":"pr_uo","account_status":2},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"12701","currency_code":"124","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"127","agr_code":"127","account_type":"pr_uo","account_status":1},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"12703","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"127","agr_code":"127","account_type":"pr_uo","account_status":3},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"12704","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"127","agr_code":"127","account_type":"pr_uo","account_status":4},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"12705","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"127","agr_code":"127","account_type":"pr_uo","account_status":5},{"RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","user_login":"U26_001_S601","user_fio":"Jones Marta Ann","account_number":"12706","currency_code":"980","mfo":335106,"branch_id":"'&$branch&'","open_date":"'&$date&'","close_date":"","agr_number":"127","agr_code":"127","account_type":"pr_uo","account_status":6}],"message_id":"BARS-MESS-379518"}'
	Sleep(500)
	ClipPut($request)
	Sleep(500)
	Send("{DEL}"); это тут только для того,чтобы перейти к команде "Send" до вставки, так как она не всегда отрабатывает корректно
	Sleep(200)
	Sleep(200)
	Send("^v")
	Sleep(1000)

	MouseClick("left", 350, 1020, 1, 3000)
	Sleep(17000)
EndFunc

Func startIE(); go through autorization form
	WinActivate( "WebDriver - Internet Explorer" )
	Sleep(500)
	;Send("{ALT}{SPACE}"); kombinacia klavish dla togo chobi razvernut okno
	;Sleep(500)
	;Send("{DOWN 12}&{ENTER}")
	;Sleep(500)
	ControlFocus("WebDriver - Internet Explorer","","ToolbarWindow322")
	Sleep(500)
	Send("{ENTER}")
	Sleep(1000)
	Send("https://eashp-01-01.oschadbank2.ua/Client/Persons.aspx")
	Sleep(2000)
	Send("{ENTER}")
	Sleep(9000)
	Send("svc.01.ea.unitedback@oschadbank2")
	Sleep(1000)
	Send("{TAB}")
	Send("P@ssw0rd")
	Sleep(500)
	Send("{ENTER}")
	Sleep(5000)
	WinClose( "WebDriver - Internet Explorer" )
EndFunc

Func IEAuthorization(); go through autorization form
   Sleep(500)
	WinActivate( "Windows Security" )

	Sleep(2000)
	Send("svc.01.ea.unitedback@oschadbank2")
	Sleep(1000)
	Send("{TAB}")
	Send("P@ssw0rd")
	Sleep(500)
	Send("{ENTER}")

EndFunc

Func StartReport()
	Sleep(500)
	WinActivate( "Електронний архів - ОЩАДБАНК - Internet Explorer" )
	Sleep(500)
	Send("{TAB}")
	$reportDate = StringLeft($date, 9); переменная $date вытягивается из файла
	Send($reportDate)
	Sleep(500)
	Send("{TAB}")
	Sleep(500)
	Send("{TAB}")
	Sleep(500)
	Send($reportDate)
	Sleep(500)
	Send("{TAB}")
	Sleep(500)
	Send("{TAB}")
	Sleep(500)
	Send("{ENTER}")

EndFunc


IEAuthorization()
;IEAuthorization()
; StartEmulator()
; CreatAccauntsAll()
; WinClose("BARS Tool"); close BARS
; Sleep(2000)
; Send('exit' & "{ENTER}"); close CMD #CE

