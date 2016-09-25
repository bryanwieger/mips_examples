.data 
n: 100

# make a function that requires branch recursion
# make a fib function
.text
main:
	lw $a0, n
	jal fib
	move $a0, $v0
	addi $v0, $0, 1
	syscall
	j exit
	
	
fib:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	
	addi $v0, $0, 0
	beq $v0, $a0, leave
	bltz $a0, leave
	
	addi $v0, $0, 1
	beq $v0, $a0, leave
	
	addi $a0, $a0, -1
	move $s1, $a0
	jal fib
	move $s0, $v0
	
	addi $a0, $s1, -1
	jal fib
	addu $v0, $s0, $v0
	
	j leave
	
leave:
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	addi $sp, $sp, 12
	jr $ra
	
exit:


