.data
	str1: .space 100
	str2: .space 100
.text
	li $v0, 8
	la $a0, str1
	li $a1, 100
	syscall
	
	move $t0, $a0
	
	WHILE:
		lb $t2, 0($t0)
		addi $t0, $t0, 1
		beq $t2, $0, END
		addi $t1, $t1, 1
		j WHILE
		
	END:
		addi $t1, $t1, -1
		add $t0, $a0, $t1
		la $t3, str2
		addi $t0, $t0, -1
		
	FOR:
		lb $t2, 0($t0)
		
		slti $t6, $t2, 91
		beq $t6, $zero, Else
			addi $t2, $t2, 32
			j Endif
		Else:
			addi $t2, $t2, -32
			j Endif
		Endif:
		
		sb $t2, 0($t3)
		addi $t1, $t1, -1
		addi $t0, $t0, -1
		addi $t3, $t3, 1
		slt $t4, $t1, $0
		beq $t4, $zero, FOR
		li $v0, 4
		la $a0, str2
		syscall