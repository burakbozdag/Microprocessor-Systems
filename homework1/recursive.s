		;Burak Bozdag
		;150170110

;Allocate space from memory				
index	EQU      9									;Declare array size

				AREA     NEW_ARRAY,DATA, READWRITE	;Define this part will write in data area
				ALIGN	
__Array_Start
Array_Mem       SPACE    index						;Allocate space from memory 
__Array_End

		AREA test_array, code, readonly				;Define this part will write as code
		ENTRY
		THUMB
		ALIGN

__main	FUNCTION
		EXPORT 	__main
		LDR 	r0,=Array_Mem						;Store start address of the allocated space
		LDR 	r5,=__Array_End						;Store end address of the allocated space
		movs	r7,#0								;i=0
		LDR 	r2,=Array_Mem						;Store start address of the allocated space (temp)
		subs	r2,r2,#4							;r2 <- previous, incremented in for loop
		bl		fib									;Call fib
		b		result								;Branch to result

fib		adds	r7,r7,#1							;i++
		adds	r2,r2,#4							;r2 -> next
		cmp		r7,#index							;for i<=n ?
		bhi		result								;for loop ends
		cmp		r7,#2								;if i<=2 ?
		bhi		els									;i>2
		movs	r3,#1								;r3=1
		strb	r3,[r2]								;Store 1 in the memory
		b		fib									;Continue loop
els		movs	r3,r2								;Copy address of index
		subs	r3,r3,#4							;r3 <- previous
		ldr		r4,[r3]								;Load previous value
		movs	r6,#0								;r6: Temp
		adds	r6,r6,r4							;r6+=r4
		subs	r3,r3,#4							;r3 <- previous
		ldr		r4,[r3]								;Load previous value
		adds	r6,r6,r4							;r6+=r4
		strb	r6,[r2]								;Store summed value in the memory
		b		fib									;Continue loop

result	subs	r2,r2,#4							;r2-=4
		ldr		r1,[r2]								;R1 is the result of the program
		B		stop								;Branch to stop

stop	B		stop								;Infinite loop

		ENDFUNC
		END
			
