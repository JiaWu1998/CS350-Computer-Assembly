.data
	prompt: .asciiz "\nPlease Input a value for N = (The range of N:3<=N<=45, 0:Quit)\n"
	bye: 	.asciiz "\nHave a good day!\n "
.globl main
.text
	main:
		li $v0, 4 		# system call code for Print String
		la $a0, prompt		# load address of prompt into $a0
		syscall 		# call system call
		li $v0, 5 		# system call code for Read Integer
		syscall 		# reads the value of N into $v0
		blez $v0, end 		# branch to end if $v0 < = 0
		li $t0, 0 		# clear register $t0 to zero

		li $t1, 1
		li $t2, 1
		li $t3, 1
		addi $v0, $v0, -2 	# summing integers with -2
	
	loop:
		move $t1, $t2 		# move value to be printed to $a0
		move $t2, $t3 		# move value to be printed to $a0
		add $t3, $t2, $t1
		addi $v0, $v0, -1 	# summing integers with -1
		bnez $v0, loop 		# branch to loop if $v0 is != zero
		
		li $v0, 1 		# system call code for Print Integer
		move $a0, $t3 		# move value to be printed to $a0
		syscall 		# print sum of integers
		b main 			# branch to main
	
	end: 
		li $v0, 4 		# system call code for Print String
		la $a0, bye 		# load address of msg. into $a0
		syscall 		# print the string
		li $v0, 10 		# terminate program run and