;Allocate space from memory				
Array_Size      EQU      0x0000020					;Declare array size

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
		LDR r0,=Array_Mem							;Store start address of the allocated space
		LDR r5,=__Array_End							;Store end address of the allocated space
		MOVS r1,#2_101								;Move 5 in the R5 register
		
		STRB r1, [r0]								;Store this value to allocated space
stop	B stop										;Infinite loop
		ENDFUNC
		END
			
