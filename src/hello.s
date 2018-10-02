# First ARM64 assembly program
# 
#  Compile as: gcc hello.s -o hello -static
#

	.global puts
	.global main
.data

.balign 8
main_ret:	.dword 0 	// store return address of main

message:
	.asciz "Hello World!"

.balign 8
addr_message: 	.dword message
addr_main_ret:	.dword main_ret

.text

main:	
	ldr x0, addr_main_ret 	// store the return address of main
	str x30, [x0]

	ldr x0, addr_message
	bl  puts

	ldr x0, addr_main_ret  	// restore the return address of main
	ldr x1, [x0]
	
	mov x0, #0		// set the return value of main
	ret x1

