		AREA firstcode, code, readonly ;Declare new area
		ENTRY				;Declare as entry poin
		ALIGN 				;Ensures that __main addresses the following instruction.
__main	FUNCTION			;Enable Debug
		EXPORT __main		;Make __main as global to access from startup file
		MOVS  r0,#2_10101	;Move 5 -> r0 (SR changes)
		MOVS  r1,#10		;Move 10 -> r1 (SR do not change)
		SUBS  r1,r0,r1		;r1 = r0-r1
		BMI	  LABEL1		;Branch LABEL1 If previous instruction result is zero.
		ADD   r1,r2,r1		;r1 = r2+r1
	
LABEL1  MOVS  r0,#var1		;Move symbolic value to r0
		LDR   r1,=var2		;Load value from memory to r1
		LDR   r2,var3		;Load value from memory to 32
		ADD   r1,r2,r1		;r1=r2+r1
		
		ADD   r1,r1,r0		;r1=r1+r0
		PUSH  {r0,r1}		;PUSH r0 and r1 to stack
		
		BL    LABEL2		;Go to LABEL2 subroutine
		ADD   r1,r1,r0		;r1=r1+r0
		B	  stop			;Branch stop
		
LABEL2	MOVS  r4,#5			;Move 5 to r4
		BX	  LR			;Return from subroutine

stop	B	  stop			;Branch stop

var1	EQU   3				;Declare symbolic value
var2	EQU	  0x221152, DATA;Declare data	
var3	DCQ   0x20212234	;Declara data which has 8 bytes
		
		ENDFUNC				;Finish Function
		END					;Finish Assebly File
