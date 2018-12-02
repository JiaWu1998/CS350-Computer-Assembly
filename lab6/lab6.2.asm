.data
    enterDecimal: .asciiz "Enter a decimal number(0 to 4294967295):"
    wrongInput: .asciiz "Negative Input: Enter Again \n"
.text
.globl main
    main:
        la $a0, enterDecimal
        li $v0, 4
        syscall 
        li $v0, 5
        syscall 
        move $a0, $v0
        bltz $v0, NEG
        jal PRINTBIN
        li $v0, 10 
        syscall
        PRINTBIN:
            move $t0, $a0
            add $t2, $zero, $zero
            addi $t9, $t9, 32
            addi $t1, $t1, 1
            sll $t1, $t1, 31
        LOOPDECTOBIN:
            and $t2, $t0, $t1
            beq $t2, 0, PRINTDECTOBIN
            sub $t2, $t2, $t2
            addi $t2, $t2, 1
            j PRINTDECTOBIN
        PRINTDECTOBIN:
            move $a0, $t2
            li $v0, 1
            syscall
            addi $t9, $t9, -1
            srl $t1, $t1, 1 
            bne $t9, 0, LOOPDECTOBIN
            j $ra
        NEG: 
            la $a0, wrongInput
            li $v0, 4
            syscall
            j main


        