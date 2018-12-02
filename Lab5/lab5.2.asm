.data
    my_array: .space 40
    get_value: .asciiz "Give me the Initial Value:"
.text
.globl main
    main:
        li $v0, 4
        la $a0, get_value
        syscall
        li $v0, 5
        syscall
        add $a3, $a3, $v0
        la $t0, my_array
        addi $t2, $t2, 10
        LOOP:
            ble $t2, $t1, EXIT
                sw $a3, 0($t0)
                addi $t0, $t0, 4
                addi $a3, $a3, 1 
                addi $t1, $t1, 1
                j LOOP
        EXIT:
            li $v0, 10 
            syscall