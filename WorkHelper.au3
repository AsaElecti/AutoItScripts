Func Work()
MsgBox(64, 'Status', 'StartWork.')
For $i = 0 To 17 Step 1
	Sleep(1500000);1500000-25minutes

	If MsgBox(4 + 32 + 4096, 'Question', 'How are you?') = 6 Then
		MsgBox(16, 'Result', 'You know what to do')
	Else
		MsgBox(16, 'Result', 'Take a little break')
	EndIf
Next

EndFunc


Work()
