	.data
	.text
	.globl main

main:	addi $3, $0, 0x55
	sw   $3, 0($0)
	lw   $4, 0($0)
	nop