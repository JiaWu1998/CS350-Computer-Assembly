.data
    HexSpace: .space 32
    hexStringSpace: .space 8
    hexToBinMsg: .asciiz "-Enter 1 to convert hexadecimal to binary \n"
    decToHexMsg: .asciiz "-Enter 2 to convert decimal to hexadecimal \n"
    enterDecMsg: .asciiz "\nEnter a decimal: "
    binOutputMsg: .asciiz "\nBinary Output: "
    hexOutputMsg: .asciiz "\nHexadecimal Output: "
    notValid: .asciiz "This is not a valid option, please re-enter.\n"
    aBit: .asciiz "A"
    bBit: .asciiz "B"
    cBit: .asciiz "C"
    dBit: .asciiz "D"
    eBit: .asciiz "E"
    fBit: .asciiz "F"
    enterHexMsg: .asciiz "\nEnter a hexadecimal(Use uppercase for letters): "
    overMaxMsg: .asciiz "You have entered a number over the max limit. Please Re-enter:"
    negLengthMsg: .asciiz "You have entered a negative number. Please Re-enter:"
    enterNumHex: .asciiz "\nEnter the length of the Hexadecimal(max length is 8):"
    invalidHexMsg: .asciiz "You have entered a invalid character. Please re-enter"
    set0: .asciiz "0000"
    set1: .asciiz "0001"
    set2: .asciiz "0010"
    set3: .asciiz "0011"
    set4: .asciiz "0100"
    set5: .asciiz "0101"
    set6: .asciiz "0110"
    set7: .asciiz "0111"
    set8: .asciiz "1000"
    set9: .asciiz "1001"
    set10: .asciiz "1010"
    set11: .asciiz "1011"
    set12: .asciiz "1100"
    set13: .asciiz "1101"
    set14: .asciiz "1110"
    set15: .asciiz "1111"
.text
.globl main
    main:
        li $v0, 4 
        la $a0, hexToBinMsg
        syscall
        li $v0, 4 
        la $a0, decToHexMsg
        syscall
        CHECKOPTION: 
            li $v0, 5
            syscall
            beq $v0, 1, CONVERTHEXTOBIN
            beq $v0, 2, CONVERTDECTOHEX
            li $v0, 4
            la $a0, notValid
            syscall
            j CHECKOPTION
        CONVERTHEXTOBIN:
            # enter length of hex number in $t2
            la $a0, enterNumHex
            li $v0, 4
            syscall
            li $v0, 5
            syscall
            move $t2, $v0
            move $t4, $t2
            addi $t2, $t2, 2
            # 
            CHECKLENOVER:
            move $t5, $t4
            sub $t5, $t5, 8
            blez $t5, CHECKLENNEG
            la $a0, overMaxMsg
            li $v0, 4 
            syscall
            li $t5, 0
            j CONVERTHEXTOBIN
        CHECKLENNEG:  
            bgtz $t4, PASSHEXMSG
            la $a0, negLengthMsg
            li $v0, 4 
            syscall
            j CONVERTHEXTOBIN
        PASSHEXMSG: 
            la $a0, enterHexMsg 
            li $v0, 4
            syscall
        
            li $v0, 8 
            la $a0, hexStringSpace 
            move $a1, $t2
            syscall

            la $t0, hexStringSpace
            # readCount
            li $t1, 0

            la $t5, hexStringSpace
        CHECKVALID:
            #checkCounter at t6
            lb $t7, ($t5)
            addi $t5, $t5, 1
            addi $t6, $t6, 1
            beq $t7, '0', PASSVALID
            beq $t7, '1', PASSVALID
            beq $t7, '2', PASSVALID
            beq $t7, '3', PASSVALID
            beq $t7, '4', PASSVALID
            beq $t7, '5', PASSVALID
            beq $t7, '6', PASSVALID
            beq $t7, '7', PASSVALID 
            beq $t7, '8', PASSVALID
            beq $t7, '9', PASSVALID
            beq $t7, 'A', PASSVALID
            beq $t7, 'B', PASSVALID
            beq $t7, 'C', PASSVALID
            beq $t7, 'D', PASSVALID
            beq $t7, 'E', PASSVALID
            beq $t7, 'F', PASSVALID
            la $a0, invalidHexMsg
            li $v0, 4
            syscall
            li $t5, 0 
            li $t6, 0 
            li $t7, 0
            li $a0, 0
            j CONVERTHEXTOBIN
        PASSVALID:
            bne $t6, $t4, CHECKVALID
        PRINTOUTMSG:
            move $a0, $0
            la $a0, binOutputMsg
            li $v0, 4
            syscall
        READLOOP:
            lb $t3, ($t0)
            addi $t0, $t0, 1
            addi $t1, $t1, 1
            #process
            bne $t3, '0', PRINT1
            la $a0, set0
            li $v0, 4
            syscall
            j CHECKOUT
        PRINT1:
            bne $t3, '1', PRINT2
            la $a0, set1
            li $v0, 4
            syscall
            j CHECKOUT
        PRINT2:
            bne $t3, '2', PRINT3
            la $a0, set2
            li $v0, 4
            syscall
            j CHECKOUT
        PRINT3:
            bne $t3, '3', PRINT4
            la $a0, set3
            li $v0, 4
            syscall
            j CHECKOUT
        PRINT4:
            bne $t3, '4', PRINT5
            la $a0, set4
            li $v0, 4
            syscall
            j CHECKOUT
        PRINT5:
            bne $t3, '5', PRINT6
            la $a0, set5
            li $v0, 4
            syscall
            j CHECKOUT
        PRINT6:
            bne $t3, '6', PRINT7
            la $a0, set6
            li $v0, 4
            syscall
            j CHECKOUT
        PRINT7:
            bne $t3, '7', PRINT8
            la $a0, set7
            li $v0, 4
            syscall
            j CHECKOUT
        PRINT8:
            bne $t3, '8', PRINT9
            la $a0, set8
            li $v0, 4
            syscall
            j CHECKOUT
        PRINT9:
            bne $t3, '9', PRINT10
            la $a0, set9
            li $v0, 4
            syscall
            j CHECKOUT
        PRINT10:
            bne $t3, 'A', PRINT11
            la $a0, set10
            li $v0, 4
            syscall
            j CHECKOUT 
        PRINT11:
            bne $t3, 'B', PRINT12
            la $a0, set11
            li $v0, 4
            syscall
            j CHECKOUT
        PRINT12:
            bne $t3, 'C', PRINT13
            la $a0, set12
            li $v0, 4
            syscall
            j CHECKOUT
        PRINT13:
            bne $t3, 'D', PRINT14
            la $a0, set13
            li $v0, 4
            syscall
            j CHECKOUT
        PRINT14:
            bne $t3, 'E', PRINT15 
            la $a0, set14
            li $v0, 4
            syscall
            j CHECKOUT
        PRINT15:
            bne $t3, 'F', INVALIDINPUTREDO 
            la $a0, set15
            li $v0, 4
            syscall
            j CHECKOUT   
        INVALIDINPUTREDO:
            li $t0, 0
            li $t1, 0
            li $t3, 0
            j main
        CHECKOUT:
            bne $t1, $t4, READLOOP
            j EXIT
        CONVERTDECTOHEX:
            la $t8, HexSpace
            la $t9, HexSpace 
            li $v0, 4
            la $a0, enterDecMsg
            syscall
            li $v0, 5
            syscall
            move $t0, $v0
            la $a0, hexOutputMsg
            li $v0, 4
            syscall
            #set filter 
            li $t1, 1
            sll $t1, $t1, 31
            #31-counter on t3
            li $t3, 32
            j COUNTANDEVA
        COUNTANDEVA:
            #4-counter on t2
            and $t4, $t0, $t1
            bne $t4, 0, CONVERTONE
            j PASS
        PASS:
            srl $t1, $t1, 1
            addi $t2, $t2, 1
            sub $t3, $t3, 1
            bne $t2, 4, COUNTANDEVA
            # 
            sw $t5, 0($t9)
            addi $t9, $t9, 4 
            # 
            li $t2, 0
            li $t5, 0
            beq $t3, 0, PRINTHEX
            j COUNTANDEVA
        PRINTHEX:
            addi $t6, $t6, 4 
            lw $t7, 0($t8)
            addi $t8, $t8, 4
            beq $t7, 15, PRINTF
            beq $t7, 14, PRINTE
            beq $t7, 13, PRINTD
            beq $t7, 12, PRINTC
            beq $t7, 11, PRINTB
            beq $t7, 10, PRINTA
            li $v0, 1
            move $a0, $t7
            syscall
        REPRINT:
            beq $t6, 32, EXIT
            j PRINTHEX
        EXIT: 
            li $v0, 10
            syscall
        PRINTA:
            li $v0, 4 
            la $a0, aBit
            syscall
            j REPRINT  
        PRINTB:
            li $v0, 4 
            la $a0, bBit
            syscall
            j REPRINT
        PRINTC:
            li $v0, 4 
            la $a0, cBit
            syscall
            j REPRINT
        PRINTD:
            li $v0, 4 
            la $a0, dBit
            syscall
            j REPRINT
        PRINTE:
            li $v0, 4 
            la $a0, eBit
            syscall
            j REPRINT
        PRINTF:
            li $v0, 4 
            la $a0, fBit
            syscall
            j REPRINT
        CONVERTONE:
            beq $t2, 0, FOURTH
            beq $t2, 1, THIRD
            beq $t2, 2, SECOND
            addi $t5, $t5, 1
            j PASS
        FOURTH:
            addi $t5, $t5, 8
            j PASS
        THIRD:
            addi $t5, $t5, 4
            j PASS
        SECOND:
            addi $t5, $t5, 2
            j PASS

