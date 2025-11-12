ORG 0000H
	MOV R2, #0AH
	MOV R0, #20H; #29H for overlapped
	MOV R1, #40H; #2EH for overlapped
	L1: MOV A, @R0
	MOV @R1, A
	INC R0
	INC R1
	DJNZ R2, L1
END;