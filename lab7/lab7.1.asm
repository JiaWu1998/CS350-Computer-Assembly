.data
    msgGetX: .asciiz "Enter a integer for x:"
    msgGetY: .asciiz "Enter a integer for y:"
    msgGotNeg: .asciiz "You entered a negative, enter again.\n"
    msgAckerMan: .asciiz "ACKERMANN OUTPUT: "
.text
.globl main
    main:
        jal CHECKNEG
        jal ACKERMANN
        la $a0, msgAckerMan
        li $v0, 4
        syscall
        move $a0, $t3
        li $v0, 1 
        syscall
        # 
        # move $a0, $t8
        # li $v0, 1 
        # syscall
        # 
        li $v0, 10 
        syscall
        CHECKNEG:
            la $a0, msgGetX
            li $v0, 4
            syscall
            li $v0, 5
            syscall
            move $t0, $v0 
            blt $t0, 0, ENTEREDNEGMES
            la $a0, msgGetY
            li $v0, 4
            syscall
            li $v0, 5
            syscall
            move $t1, $v0
            blt $t1, 0, ENTEREDNEGMES
            j $ra
        ENTEREDNEGMES:
            la $a0, msgGotNeg
            li $v0, 4
            syscall
            j CHECKNEG
        ACKERMANN:
            # addi $t8, $t8, 1
            sub $sp, $sp, 8 
            sw $t2, 4($sp)
            sw $ra, 0($sp)

            beq $t0, 0, FIRSTCONDITION
            beq $t1, 0, SECONDCONDITION
            j THIRDCONDITION
        FIRSTCONDITION:
            addi $t3, $t1,1
            j GOBACK
        SECONDCONDITION: 
            sub $t0, $t0, 1
            li $t1, 1
            jal ACKERMANN
            j GOBACK
        THIRDCONDITION:
            move $t2, $t0 
            sub $t1, $t1, 1
            jal ACKERMANN
            move $t1, $t3
            sub $t0, $t2, 1
            jal ACKERMANN
        GOBACK:
            lw $t2, 4($sp)
            lw $ra, 0($sp)
            addi $sp, $sp 8
            j $ra

       		
            
        	
            