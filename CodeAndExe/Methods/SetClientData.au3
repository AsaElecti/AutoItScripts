#include <c:\Mine\Code\AutoIT\Variables\connectionToVariables.au3>;podcluchaem file, kotoriy vityagivaet znacheniya parametrov iz failov

AutoItSetOption("SendKeyDelay",10); Функция, которая устанавливает задержку между нажатиями клавиш, так как скрипт не всегда успевает написать все необходимое)))

Func SetClientData($branch, $rnk, $name)
	MouseClick("left", 45, 235, 1, 2000)
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
	$request = '{"sessionid":"btrpg2aohtzqaelgdtmno3qc","method":"SetClientData","params":[{"branch_id":"'&$branch&'","RNK":'&$rnk&',"changed":"'&$date&'","created":"'&$date&'","fio":"'&$name&'","client_type":"1","inn":"","birth_date":"07/14/1940 15:18:17","document_series":"","document_number":"","client_data":"","mergedRNK":[],"user_login":"U26_001_S60","user_fio":"Павлюченко Валентина Андріївна"}],"message_id":"BARS-MESS-379518"}'
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

SetClientData($branch, $rnk, $nameFO)
