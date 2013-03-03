
; =============================
; Name:         Lab3
; Course:       COSC2425
; Author:       Steven Etienne
; Purpose:      Number Conversion
; Date:         2013/2/28
; =============================
%include "/usr/local/include/asm_io.inc"

section         .data
	title   db      "Number Conversion Program",0

	prmt    db      "Enter any number up to 10 digits long (then press enter):",0

	prmt2	db	"Number entered: ",0

	total	dq	0		; container for final usr input



section         .txt
        global          asm_main
	


asm_main:
        call		print_nl
	mov             rdi, title	; print title db
        call            print_string
        call            print_nl
       
	call		print_nl
	mov             rdi, prmt	; print prmt db
        call            print_string
        call            print_nl
        
	call            get_kb		; get first usr char input
	sub		AL, 48		; subtract decimal asci
	add		[total], rax	; add result to total container
	
	mov		rdi, [total]	; echo to screen
        call		print_int	
	
	mov		r14, 9		; setting counter in cl register for 9
	jmp		iLoop		; enter usr input loop
	
iLoop:
	cmp             r14, 0		; compare cl to 0
	je              eLoop		; if cl is equal to 0 then jump to eLoop

	mov		r13, [total]	; mov value of total into reg13
	imul		r13, 10		; multiple reg13 by 10

	call		get_kb		; get next usr input
	cmp		AL, 10		; compare input to carriage return
	je		eLoop		; if 'return' entered jump to eLoop
	sub		AL, 48		; sub asci value 
	add		r13, rax	; add 64-bit usr input to reg13
	;mov		[temp], AL
	;mov		r8, [temp]
	mov		rdi, rax	; echo input to screen
	call		print_int	; see line above
	mov		[total], r13	; move reg13 value into total

	dec             r14		; decrement counter cl
	jmp		iLoop		; go back to beginning of loop

eLoop:
	call		print_nl	; make 2 new lines
	call		print_nl	
	mov		rdi, prmt2	; print prmt2
	call		print_string	; ""
	
	mov		rdi, [total]	; print value in total
	call		print_int	; see line above
	
	call		print_nl	; make new line
	ret

