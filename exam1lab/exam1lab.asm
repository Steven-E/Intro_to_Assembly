; ============================
; Name:         exam1lab
; Course:       COSC2425
; Author:       Steven Etienne
; Purpose:      Add odd numbers in 64-bit array
; Date:         2013/2/28
; =============================
%include "/usr/local/include/asm_io.inc"

section			.data
		title	db		"Exam 1 Lab",0
		
		prmt	db		"This program adds up the odd values in the initialzed array",0

		data 	dq		1, 2, 3, 4, 6, 8, 10, 11, 15, 16

		total	dq		0

section			.txt
		global			asm_main
		
asm_main:
		call		print_nl
		mov		rdi, title	; print title db
		call		print_string
		call		print_nl
		
		call		print_nl
		mov		rdi, prmt	; print prmt db
		call		print_string
		call		print_nl

		
		mov		r13, 0		; counter. setting to 0 incrementing to 10
		mov		r14, 0		; temp reg for total container

		jmp		loop		; jump into loop

loop:
		mov		rax, [data+r13*8]	; move to next position 'counter'(r13) in array
		mov		rbx, rax	; copy the value into EBX
		or		rbx, 1		; sets lowbit in reg to 1
		cmp		rax, rbx	
		jne		evennum		
		
		add		r14, rax	; add value found at position 'counter'(r13) to temp total
		jmp		evennum		; jump to incrementer and total updater


evennum:
		cmp		r13, 10		; see if at end of array
		je		end		; if so, jump to end of program
		
		inc		r13		; increment 'counter'(r13)
		mov		[total], r14	; update total w/ temp total, just incase i'm blowing up r14 somewhere

		jmp		loop		; return back to even/odd comparison
				

end:

		call		print_nl	; print result
		call		print_nl
		mov		rdi, [total]
		call		print_int
		call		print_nl
		ret
