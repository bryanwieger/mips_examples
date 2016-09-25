.data 
n: 4


# make a factorial function that is recursive
.text
main:
	lw	$s0, n
	move	$a0, $s0
	jal 	factorial
	move 	$a0, $v0
	addi 	$v0, $zero, 1
	syscall
	j 	exit
	
	
factorial:
	addi	$sp, $sp, -8
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	
	addi 	$v0, $0, 1 # store the one for base case
	beqz 	$a0, leave # base case
	move	$s0, $a0 # save are argument
	addi	$a0, $a0, -1 # decrement the argument 
	jal 	factorial # recurse
	mul 	$v0, $v0, $s0 # multiply the result by arg and return
	j	leave
	
	
		
leave:
	lw	$ra, 0($sp)
	lw	$s0, 4($sp)
	addi	$sp, $sp, 8
	jr $ra
	
exit:
	
	 
	