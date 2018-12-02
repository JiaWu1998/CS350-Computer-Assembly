.data
    var1: .word 2
    var2: .word 0
    var3: .word -2018 
.text
.globl main
    main:
        lw $a0, var1
        lw $a1, var2
        lw $a2, var3
        bne $a0, $a1, ELSE
        sw $a2, var1
        sw $a2, var2
        j EXIT
    ELSE:
        addi $t0, $a0, 0  
        sw $a1, var1
        sw $t0, var2
    EXIT:
        li $v0, 10 
        syscall  