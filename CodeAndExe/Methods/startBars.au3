AutoItSetOption("SendKeyDelay",10); Функция, которая устанавливает задержку между нажатиями клавиш, так как скрипт не всегда успевает написать все необходимое)))

Func StartEmulator()
;Запускаем емулятор из командной строки и разворачиваем его на весь экран
	FileChangeDir('C:\Mine\BarsEmulator')
	Run('BARS-Emulyator.exe')
	Sleep(2000)
	Send("{ALT}{SPACE}{DOWN 4}"); kombinacia klavish dla togo chobi razvernut okno// srabotaet tol'ko esli ne rugnulsya antivirus
	Send("{ENTER}"); nagimaem enter
	Sleep(3000)
	MouseClick("left", 767, 524, 1)
	Sleep(1000)
	MouseClick("left", 1077, 665, 1)
	Sleep(1000)
	WinWaitActive("BARS Tool")
	Send("{ALT}{SPACE}{DOWN 4}"); kombinacia klavish dla togo chobi razvernut okno
	Send("{ENTER}"); nagimaem enter
;Запускаем сессию на 1м полигоне
	MouseClick("left", 610, 40, 1, 3000)
	MouseClick("left", 540, 90, 1, 3000)
	MouseClick("left", 95, 45, 1, 3000)
	Sleep(1000)
 EndFunc

;StartEmulator()