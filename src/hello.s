# First ARM64 assembly program
# 
#  Compile as: gcc hello.s -o hello -static
#

	.global main
.data
.text

main:	
	ldr x0, addr_message
	bl  puts
	ret

message:
	.asciz "Hello World!"

.balign 4
addr_message: .dword message
