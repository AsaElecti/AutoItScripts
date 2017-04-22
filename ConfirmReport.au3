Func ConfirmReport();
   	Sleep(3000)
	MouseClick("left", 950, 580, 1, 1000)
	Sleep(500)
	Send("svc.01.ea.unitedback@oschadbank2")
	Sleep(1000)
	Send("{TAB}")
	Send("P@ssw0rd")
	Sleep(500)
	Send("{ENTER}")
 EndFunc

 ConfirmReport()