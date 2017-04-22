Func startIE();
   Sleep(500)
	MouseClick("left", 445, 40, 1, 1000)
	Sleep(500)
	Send("https://eashp-01-01.oschadbank2.ua/Client/Persons.aspx")
	Sleep(500)
	Send("{ENTER}")
	Sleep(9000)
	Send("svc.01.ea.unitedback@oschadbank2")
	Sleep(1000)
	Send("{TAB}")
	Send("P@ssw0rd")
	Sleep(500)
	Send("{ENTER}")
 EndFunc

 startIE()