	.data
	.text
	.globl main
main:	li  $t0, 0x862A5	#instru��o virtual (decomposta em duas instru��es nativas)
	sll $t2, $t0, 4		# << logical (4 bits)
	srl $t3, $t0, 4		# >> logical (4 bits)
	sra $t4, $t0, 4		# >> arithmetic (4 bits)
				#
				#
				#Convers�o em C�digo gray de um valor
	ori $t0, $0, 5		#armazenamento de um valor em $t0
	srl $t1, $t0, 1		#Shift Right ao valor guardado em $t0
	xor $t1, $t1, $t0	#$t1 xor $t0 = 2 xor (valor "shiftado")
				#
				#
				#Convers�o de Gray em Bin�rio
	ori $t5, $0, 6		#armazenamento de um valor em $t5
	srl $t6, $t5, 4		#Shift right l�gico (4 bits ao valor armazenado em $t5)
	xor $t6, $t6, $t5	#$t6 xor $t5
	
	or  $t5, $0, $t6	#$t5 passa a ter o valor atualizado do $t6
	srl $t6, $t5, 2		#Shifht right l�gico 2 bits
	xor $t6, $t6, $t5	#$t6 xor $t5
	
	or  $t5, $0, $t6	#Guardar o valor atualizado de $t6 em $t5
	srl $t6, $t5, 1		#Shift right l�gico (1 bit)
	xor $t7, $t6, $t5	#$t6 xor $t5 armazenado no $t7 
	jr  $ra			#fim do programa