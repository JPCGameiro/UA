	.data

str2:	.asciiz "AC1 - P"
	.eqv	print_string,4
	
	.text
	.globl main
main:	la $a0, str2			#instu��o virtual, decomposta pelo assembler em duas instru��es nativas
	ori $v0, $0, print_string	#$v0 = 4
	syscall				#print_string(str2);
	jr $ra				#fim do programa
