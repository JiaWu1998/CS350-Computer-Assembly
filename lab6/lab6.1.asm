.data
    promptMessage: .asciiz "Enter a integer for factorial:"
    answerMessage: .asciiz " factorial is "
.text
.globl main
    main:
    # prompt and get int
    LOOP:
        li $v0, 4
        la $a0, promptMessage
        syscall
        li $v0, 5
        syscall
        addi $t8, $v0, 0 
        move $a0, $v0
        blt $a0, 0, LOOP
        jal Factorial
        move $t7, $v0 
        li $v0, 1
        move $a0, $t8
        syscall
        li $v0, 4
        la $a0, answerMessage
        syscall
        move $a0, $t7
        li $v0, 1
        syscall
        li $v0, 10 
        syscall
        Factorial: 
	        subu $sp, $sp, 4 
	        sw $ra, 4($sp) 		# save the return address on stack 
	        beqz $a0, terminate 	# test for termination 
	        subu $sp, $sp, 4 		# do not terminate yet 
	        sw $a0, 4($sp) 		# save the parameter 
	        sub $a0, $a0, 1 		# will call with a smaller argument 
	        jal Factorial 
            lw $t0, 4($sp) 	# the argument I have saved on stack mul 
	        mul $v0, $v0, $t0	# do the multiplication 
	        lw $ra, 8($sp) 	# prepare to return 
	        addu $sp, $sp, 8 	# I’ve popped 2 words (an address and 
	        jr $ra 		# .. an argument)
        terminate: 
	        li $v0, 1 		# 0! = 1 is the return value 
	        lw $ra, 4($sp) 	# get the return address 
	        addu $sp, $sp, 4 	# adjust the stack pointer 
	        jr $ra  	
        