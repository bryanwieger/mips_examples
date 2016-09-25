.data 
n: 1,1,1,1,1,1,0


# make a list summing function function that is recursive
# assume that the list ends with a 0
.text
main:
	la $a0, n # grab the list
	addi $a1, $0, 0 # set the index to zero
	addi $s0, $0, 0 # set the sum to zero
	jal summer
	move $a0, $v0 # get the value from the functtion
	
	addi $v0, $0, 1 # set up the print 
	syscall # print
	j exit # exit
	
summer:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp) # s0 is the value at the previous point
	# a0 is the list
	# a1 is the index
	# s0 is the value at that index
	addu $s0, $a0, $a1 # get the address of that index
	lw $s0, 0($s0) # grab the value at the index addres
	beqz $s0, leave # leave if we hit a zero
	
	addu $a1, $a1, 4 # increment the index
	jal summer
	
	addu $v0, $s0, $v0 # sum the results
	j leave
	
leave:
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	addi $sp, $sp, 8
	jr $ra	
	

exit:
