;Burak Bozdag
;150170110

;Allocate space from memory				
Array_Size      EQU      10							;Declare array size
freq      		EQU      2000						;Frequency for the interrupt, optimized value for debugger=2000
	
                AREA     NEW_ARRAY,DATA, READWRITE	;Define this part will write in data area
				ALIGN	
__Array_Start
Array_Mem       SPACE    Array_Size					;Allocate space from memory 
__Array_End


;Our code
		AREA test_array, code, readonly				;Define this part will write as code
		ENTRY
		THUMB
		ALIGN 
__main	FUNCTION
		EXPORT __main
		LDR r0, =Array_Mem							;Store start address of the allocated space
		MOVS r1, #0									;Move 0 in the R1 register
		MOVS r2, #0									;i=0
loop1	CMP r2, #10									;for i=0, i<=10
		BGE cont1									;Exit from the loop1
		STM r0!, {r1}								;Write 0 to the array
		ADDS r2, #1									;i++
		B loop1										;Continue to the loop
cont1	LDR r0, =Array_Mem							;r0=Array_Mem
		
		MOVS r2, #0									;i=0
loop2	CMP r2, #10									;for i=0, i<=10
		BGE stop									;Exit from the loop1
		
		STM r0!, {r2}								;Write i to the array
		MOVS r3, #1									;r3:waitTime
		ADDS r3, r2									
		MOVS r4, #100								;r4=100
		MULS r3, r4, r3								;waitTime*100
		BL delayMs
		
		ADDS r2, #1									;i++
		B loop2										;Continue to the loop
		
delayMs LDR r4, =freq								;r4=freq
		MULS r3, r4, r3								;freq*waitTime
		MOVS r6, #0									;j=0
loop3	CMP r6, r3									;for j=0, i<=freq*waitTime
		BGE exit									;Exit from the loop
		ADDS r6, #1									;j++
		B loop3										;Continue to the loop
exit	BX LR

stop	B stop										;Infinite loop
		ENDFUNC
		END
