Func StartReport();
   	Sleep(500)
	MouseClick("left", 445, 40, 1, 1000)
	Sleep(500)
	Send("https://eashp-01-01.oschadbank2.ua/Reports.aspx")
	Sleep(500)
	Send("{ENTER}")
	Sleep(3000)
	Send("svc.01.ea.unitedback@oschadbank2")
	Sleep(1000)
	Send("{TAB}")
	Send("P@ssw0rd")
	Sleep(500)
	Send("{ENTER}")
	Sleep(5000)
	MouseClick("left", 179, 560, 1, 1000)
 EndFunc

 StartReport()