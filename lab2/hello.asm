; hello.asm
%include "/usr/local/include/asm_io.inc"

        section         .data
c_msg	db              "Course: COSC2425 Lab2",0
			
s_msg	db		"Student: Steven Etienne",0

p_msg	db		"Project: NASM Hello world",0

        section         .text
        global          asm_main

asm_main:
        mov             rdi, c_msg
        call            print_string
        call            print_nl
	mov		rdi, s_msg
	call		print_string
	call		print_nl
	mov		rdi, p_msg
	call		print_string
	call		print_nl
        ret
