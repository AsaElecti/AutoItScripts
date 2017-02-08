; /335106/000369/000379/   /335106/000218/   /335106/
$noClientNumber = 2111211124728
$index = ""; это индекс, который может использоваться повсеместно

$depAgrNumber = "2000200083-170120-161613"
$prAgrNumber = "2000200083-170120-161617"
$kpkAgrNumber = 123
$dboAgrNumber = 124


;открываем файл РНК, считываем данные и закрываем файл
$rnkOpen = FileOpen('C:\docs_own\2017\scripts\autoIT\CreatCorpClient\CreatEverything\rnk.txt', 0)

; Проверяет, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $rnkOpen = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл.")
    Exit
EndIf

$rnk = FileReadLine($rnkOpen)
FileClose($rnkOpen)

MsgBox(0, "Содержимое the file rnk", $rnk)
;----------------------------------------------------------------------------------
$branchOpen = FileOpen('C:\docs_own\2017\scripts\autoIT\CreatCorpClient\CreatEverything\branch.txt', 0)

; Проверяет, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $branchOpen = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл.")
    Exit
EndIf

$branch = FileReadLine($branchOpen)
FileClose($branchOpen)

MsgBox(0, "Содержимое the file branch", $branch)
;----------------------------------------------------------------------------------
$nameOpen = FileOpen('C:\docs_own\2017\scripts\autoIT\CreatCorpClient\CreatEverything\name.txt', 0)

; Проверяет, является ли файл открытым, перед тем как использовать функции чтения/записи в файл
If $nameOpen = -1 Then
    MsgBox(4096, "Ошибка", "Невозможно открыть файл.")
    Exit
EndIf

$name = FileReadLine($nameOpen)
FileClose($nameOpen)

MsgBox(0, "Содержимое the file Name", $name)
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

Func CreatCorpClient()
	MouseClick("left", 45, 265, 1, 2000)
	Sleep(3000)
	MouseClick("left", 540, 85, 1, 3000)
	Sleep(50)
	MouseClick("left", 540, 85, 1, 3000)
	Sleep(50)
	MouseClick("left", 540, 85, 1, 3000)
	Sleep(2000)
	$request = '{"sessionid":"xaap3wrv3y0eilo5gnij0fqu","method":"SetClientDataU","params":[{"branch_id":"'&$branch&'","rnk":'&$rnk&',"changed":"01/25/2017 14:48:07","created":"01/25/2017 14:48:07","client_type":"2","client_name":"'&$name&'","inn_edrpou":"25252525","user_login":"U26_001_S60","user_fio":"Павлюченко Валентина Андріївна","mergedRNK":[],"actualized_date":"","actualized_by":"","third_persons_clients":[], "third_persons_non_clients":[]}],"message_id":"BARS-MESS-379518"}'
	ClipPut($request)
	Sleep(2000)
	Send("^v")
	MouseClick("left", 350, 1020, 1, 3000)
	Sleep(1000)
EndFunc

Func CreatAgrAll(); ОДНИМ ЗАПРОСОМ ВСЕ УГОДЫ
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
	$request = '{"sessionid":"xdve0cqgh3cqt3f35rr1iwpt","method":"SetAgreementDataU","params":[{"agr_code":"124","RNK":'&$rnk&',"changed":"01/30/2017  09:32:26","created":"01/30/2017 09:32:26","client_type":2,"branch_id":"'&$branch&'","user_login":"U26_001_S60","user_fio":"Павлюченко Валентина  Андріївна","agr_type":"dep_uo","agr_status":"1","agr_number":"'&$depAgrNumber&'","agr_date_open":"01/30/2017  09:32:26","agr_date_close":""},{"agr_code":"125","RNK":'&$rnk&',"changed":"01/30/2017 09:32:26","created":"01/30/2017  09:32:26","client_type":2,"branch_id":"'&$rnk&'","user_login":"U26_001_S60","user_fio":"Павлюченко Валентина  Андріївна","agr_type":"pr_uo","agr_status":"1","agr_number":"'&$prAgrNumber&'","agr_date_open":"01/30/2017  09:32:26","agr_date_close":""},{"agr_code":"126","RNK":'&$rnk&',"changed":"01/30/2017 09:32:26","created":"01/30/2017  09:32:26","client_type":2,"branch_id":"'&$branch&'","user_login":"U26_001_S60","user_fio":"Павлюченко Валентина  Андріївна","agr_type":"kpk_uo","agr_status":"10","agr_number":"126","agr_date_open":"01/30/2017 09:32:26","agr_date_close":""}, {"agr_code":"127","RNK":'&$rnk&',"changed":"01/30/2017 09:32:26","created":"01/30/2017  09:32:26","client_type":2,"branch_id":"'&$branch&'","user_login":"U26_001_S60","user_fio":"Павлюченко Валентина  Андріївна","agr_type":"dbo_uo","agr_status":"10","agr_number":"127","agr_date_open":"01/30/2017  09:32:26","agr_date_close":""}],"message_id":"BARS-MESS-379518"}'
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

; ПО КООРДИНАТАМ
Func CreatAgr($agrType, $agrNumber, $agrStatus)
	MouseClick("left", 45, 285, 1, 2000)
	Sleep(3000)
	MouseClick("left", 300, 110, 1, 3000)
	Sleep(100)
	Send($agrNumber); AgrCode == AgrNumber
	MouseClick("left", 300, 135, 1, 3000)
	Sleep(100)
	Send($rnk)
	MouseClick("left", 300, 195, 1, 3000)
	Sleep(100)
	Send(2)
	MouseClick("left", 300, 215, 1, 3000)
	Sleep(100)
	Send($branch)
	MouseClick("left", 300, 285, 1, 3000)
	Sleep(100)
	Send($agrType)
	MouseClick("left", 300, 310, 1, 3000)
	Sleep(100)
	Send($agrStatus); AgreementStatus
	MouseClick("left", 300, 325, 1, 3000)
	Sleep(100)
	Send($agrNumber)
	MouseClick("left", 300, 375, 1, 3000)
	Sleep(100)
	Send("01/20/2017 09:36:54")
	MouseClick("left", 250, 1020, 1, 3000)
	Sleep(100)
	MouseClick("left", 350, 1020, 1, 3000)
	Sleep(1000)
EndFunc

Func CreatAccount($accType, $accNumber, $agrNumber, $accStatus, $currencyCode = 974)
	MouseClick("left", 45, 245, 1, 2000)
	Sleep(1000)
	MouseClick("left", 300, 110, 1, 3000)
	Sleep(100)
	Send($rnk)
	MouseClick("left", 300, 220, 1, 3000)
	Sleep(100)
	Send($accNumber)
	MouseClick("left", 300, 240, 1, 3000)
	Sleep(100)
	Send($currencyCode)
	MouseClick("left", 300, 265, 1, 3000)
	Sleep(100)
	Send(335106)
	MouseClick("left", 300, 285, 1, 3000)
	Sleep(100)
	Send($branch)
	MouseClick("left", 300, 330, 1, 3000)
	Sleep(100)
	Send("12/30/2021 12:54:48")
	MouseClick("left", 300, 350, 1, 3000)
	Sleep(100)
	Send($agrNumber)
	MouseClick("left", 300, 370, 1, 3000)
	Sleep(100)
	Send($agrNumber);== AgrCode
	MouseClick("left", 300, 395, 1, 3000)
	Sleep(100)
	Send($accType)
	MouseClick("left", 300, 420, 1, 3000)
	Sleep(100)
	Send($accStatus)
	MouseClick("left", 250, 1020, 1, 3000)
	Sleep(100)
	MouseClick("left", 350, 1020, 1, 3000)
	Sleep(1000)
EndFunc


StartEmulator()
CreatCorpClient()
;Sleep(14000)

;Создать СНАЧАЛА проекты сделок депозитной и поточной и прописать их номера выше - в $depAgrNumber и $prAgrNumber

#cs
;Теперь создаем все типы сделок
CreatAgr("dep_uo", $depAgrNumber, 1)
CreatAgr("pr_uo", $prAgrNumber, 1)
CreatAgr("kpk_uo",$kpkAgrNumber, 10)
CreatAgr("dbo_uo",$dboAgrNumber, 10)





;Создаем Депозитные счета: мультивалютный + счета во всех возможных статусах
Local $i = 12101
Local $k = 1
CreatAccount("dep_uo", $i, $depAgrNumber, $k, 933);создали счет который после выполнения цикла станет мультивалютным 840 - код американского доллара
While $i <= 12105
    CreatAccount("dep_uo", $i, $depAgrNumber, $k)
    $i = $i + 1
	$k = $k + 1
WEnd

;Создаем Текущие счета: мультивалютный + счета во всех возможных статусах
Local $i = 12201
Local $k = 1
CreatAccount("pr_uo", $i, $prAgrNumber, $k, 933);создали счет который после выполнения цикла станет мультивалютным 840 - код американского доллара
While $i <= 12205
    CreatAccount("pr_uo", $i, $prAgrNumber, $k)
    $i = $i + 1
	$k = $k + 1
WEnd

;Создадим счет к сдеке КПК
CreatAccount("kpk_uo", 265501, $kpkAgrNumber, 1)

;Создадим Текущие и kpk счета мультивалютные + во всех возможных статусах к сделке ДБО
Local $i = 12301
Local $k = 1
CreatAccount("pr_uo", $i, $dboAgrNumber, $k, 933);создали счет который после выполнения цикла станет мультивалютным 840 - код американского доллара
While $i <= 12306
    CreatAccount("pr_uo", $i, $dboAgrNumber, $k)
    $i = $i + 1
	$k = $k + 1
WEnd

Local $i = 260501
Local $k = 1
CreatAccount("kpk_uo", $i, $dboAgrNumber, $k, 933);создали счет который после выполнения цикла станет мультивалютным 840 - код американского доллара
While $i <= 260506
    CreatAccount("kpk_uo", $i, $dboAgrNumber, $k)
    $i = $i + 1
	$k = $k + 1
WEnd
; В ИТОГЕ СОЗДАЕТСЯ 27 СЧЕТОВ (ИЗ НИХ В 2 ЗАРЕЗЕРВОВАНИХ В ОТЧЕТ НЕ ПОПАДАЮТ) В ОТЧЕТЕ ВЫВОДИТСЯ ТАКАЯ СЕТКА 12 - 6 - 7  Всього 25


#ce
