.data
    #NOTE: FOR THE CONVERSIONS IT IS WITH TWO's COMPLEMENT

    #Dec to Hex Space
    HexSpace: .space 32
    #Hex to Bin Space and Hex to Dec Space
    hexStringSpace: .space 8

    lineDivider: .asciiz "\n-----------------------------------------------------------\n"
    mainMenuMsg: .asciiz "Main Menu\n"
    additionFirstOption: .asciiz "1. Integer Addition\n"
    subtractionSecondOption: .asciiz "2. Integer Subtraction\n"
    multiplicationThirdOption: .asciiz "3. Integer Multiplication\n"
    divisionFourthOption: .asciiz "4. Integer Division\n"
    conversionMenuOption: .asciiz "5. Conversion Menu\n"
    exitProgramTenthOption: .asciiz "10. Exit Calculator\n"
    yourOption: .asciiz "Your Option: "
    invalidInputMsg: .asciiz "Your input is invalid. Please re-enter.\n"

    #first four operational items
    firstOperandMsg: .asciiz "Enter first Operand:"
    secondOperandMsg: .asciiz "Enter second Operand:"
    sumMsg: .asciiz "Sum: "
    diffMsg: .asciiz "Difference: "
    ProductMsg: .asciiz "Product: "
    quotientMsg: .asciiz "Quotient: "
    remainMsg: .asciiz "\nRemainder: "

    #conversion menu items 
    conversionMenuMsg: .asciiz "Conversion Menu\n"
    binToDecFirstOption: .asciiz "1. Binary To Hexadecimal\n"
    binToHexSecondOption: .asciiz "2. Binary To Decimal\n"
    decToBinThridOption: .asciiz "3. Decimal To Binary\n"
    decToHexFourthOption: .asciiz "4. Decimal To Hexadecimal\n"
    hexToDecFifthOption: .asciiz "5. Hexadecimal To Decimal\n"
    hexToBinSixthOption: .asciiz "6. Hexadecimal To Binary\n"
    exitToMainMenuOption: .asciiz "7. Exit To Main Menu\n"

    #Binary To Hexadecimal and Binary To Decimal
    enterBinMsg: .asciiz "Enter a binary number of 32 bits:"

    #Deciaml To Hexadecimal and Decimal To Binary
    enterDecimal: .asciiz "Enter a decimal number:"
    enterDecMsg: .asciiz "\nEnter a decimal: "
    hexOutputMsg: .asciiz "\nHexadecimal Output: "
    aBit: .asciiz "A"
    bBit: .asciiz "B"
    cBit: .asciiz "C"
    dBit: .asciiz "D"
    eBit: .asciiz "E"
    fBit: .asciiz "F"
 
    #Hexadeciaml To Binary and Hexadecimal To Decimal
    enterHexMsg: .asciiz "\nEnter a hexadecimal(Use uppercase for letters): "
    overMaxMsg: .asciiz "\nYou have entered a number over the max limit. Please Re-enter:"
    negLengthMsg: .asciiz "\nYou have entered a negative number. Please Re-enter:"
    enterNumHex: .asciiz "\nEnter the length of the Hexadecimal(max length is 8):"
    invalidHexMsg: .asciiz "\nYou have entered a invalid character. Please re-enter:"
    binOutputMsg: .asciiz "\nBinary Output: "
    decOutputMsg: .asciiz "\nDecimal Output: "
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
    MAINMENU:
        #Show all options of the menu
        la $a0, lineDivider
        li $v0, 4
        syscall 
        la $a0, mainMenuMsg
        li $v0, 4
        syscall
        la $a0, lineDivider
        li $v0, 4
        syscall 
        la $a0, additionFirstOption
        li $v0, 4
        syscall
        la $a0, subtractionSecondOption
        li $v0, 4
        syscall 
        la $a0, multiplicationThirdOption
        li $v0, 4
        syscall 
        la $a0, divisionFourthOption
        li $v0, 4
        syscall 
        la $a0, conversionMenuOption
        li $v0, 4
        syscall 
        la $a0, exitProgramTenthOption
        li $v0, 4
        syscall
        la $a0, lineDivider
        li $v0, 4
        syscall
        #Show option msg and get option to store in t0
        la $a0, yourOption
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $t0, $v0
        #Check Valid Option and Branch
        beq $t0, 1, ADDITION
        beq $t0, 2, SUBTRACTION
        beq $t0, 3, MULTIPLICATION
        beq $t0, 4, DIVISION
        beq $t0, 5, CONVERSIONMENU
        beq $t0, 10, EXITCALCULATOR
        #If t0 pass through all branches, then it is a invalid input
        la $a0, invalidInputMsg
        li $v0, 4
        syscall
        j MAINMENU
    EXITCALCULATOR:
        li $v0, 10
        syscall 
    ADDITION:
        # first operand in t0, second operand in t1, and sum in t2
        la $a0, firstOperandMsg
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $t0, $v0
        la $a0, secondOperandMsg
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $t1, $v0
        add $t2, $t0, $t1
        la $a0, sumMsg
        li $v0, 4
        syscall
        move $a0, $t2
        li $v0, 1
        syscall

        #reset t0, t1, and t2 before jump back to Main Menu
        li $t0, 0
        li $t1, 0
        li $t2, 0
        j MAINMENU
    SUBTRACTION:
        # first operand in t0, second operand in t1, and difference in t2
        la $a0, firstOperandMsg
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $t0, $v0
        la $a0, secondOperandMsg
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $t1, $v0
        sub $t2, $t0, $t1
        la $a0, sumMsg
        li $v0, 4
        syscall
        move $a0, $t2
        li $v0, 1
        syscall

        #reset t0, t1, and t2 before jump back to Main Menu
        li $t0, 0
        li $t1, 0
        li $t2, 0
        j MAINMENU
    MULTIPLICATION:
        # first operand in t0, second operand in t1, and product in t2
        la $a0, firstOperandMsg
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $t0, $v0
        la $a0, secondOperandMsg
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $t1, $v0
        mult $t0, $t1
        mflo $t2					
        la $a0, ProductMsg
        li $v0, 4
        syscall
        move $a0, $t2
        li $v0, 1
        syscall

        #reset t0, t1, and t2 before jump back to Main Menu
        li $t0, 0
        li $t1, 0
        li $t2, 0
        j MAINMENU
    DIVISION:
        # first operand in t0, second operand in t1, quotient in t2, and remainder in t3
        la $a0, firstOperandMsg
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $t0, $v0
        la $a0, secondOperandMsg
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $t1, $v0
        
        beq $t1, 0, ERROR
        div	$t0, $t1			
        mflo $t2					
        mfhi $t3					
    				
        la $a0, quotientMsg
        li $v0, 4
        syscall
        move $a0, $t2
        li $v0, 1
        syscall
        la $a0, remainMsg
        li $v0, 4
        syscall
        move $a0, $t3
        li $v0, 1
        syscall

        #reset t0, t1, and t2 before jump back to Main Menu
        li $t0, 0
        li $t1, 0
        li $t2, 0
        li $t3, 0
        j MAINMENU
    ERROR:
        la $a0, invalidInputMsg
        li $v0, 4
        syscall
        jal RESET
        j DIVISION
    CONVERSIONMENU:
        jal RESET
        la $a0, lineDivider
        li $v0, 4
        syscall 
        la $a0, conversionMenuMsg
        li $v0, 4
        syscall
        la $a0, lineDivider
        li $v0, 4
        syscall
        la $a0, binToDecFirstOption
        li $v0, 4
        syscall
        la $a0, binToHexSecondOption
        li $v0, 4
        syscall
        la $a0, decToBinThridOption
        li $v0, 4
        syscall
        la $a0, decToHexFourthOption
        li $v0, 4
        syscall
        la $a0, hexToDecFifthOption
        li $v0, 4
        syscall
        la $a0, hexToBinSixthOption
        li $v0, 4
        syscall
        la $a0, exitToMainMenuOption
        li $v0, 4
        syscall
        la $a0, exitProgramTenthOption
        li $v0, 4
        syscall
        la $a0, lineDivider
        li $v0, 4
        syscall
        #Show option msg and get option to store in t0
        la $a0, yourOption
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $t0, $v0
        #Check Valid Option and Branch
        beq $t0, 1, BINTOHEX
        beq $t0, 2, BINTODEC
        beq $t0, 3, DECTOBIN
        beq $t0, 4, DECTOHEX
        beq $t0, 5, HEXTODEC
        beq $t0, 6, HEXTOBIN
        beq $t0, 7, MAINMENU
        beq $t0, 10, EXITCALCULATOR
        #If t0 pass through all branches, then it is a invalid input
        la $a0, invalidInputMsg
        li $v0, 4
        syscall
        j CONVERSIONMENU
    BINTOHEX:
        #space on t0 and t3, evaluated substring on t1 and t4, valid counter on t2, 4-block counter on t5 and 32-block counter on t6, and decimal value on t7 
        la $a0, enterBinMsg
        li $v0, 4
        syscall
        la $a0, HexSpace
        li $a1, 34
        li $v0, 8
        syscall
        
        la $t0, HexSpace
    CHECKBINSTRINGVALID:
        lb $t1, ($t0)
        addi $t0, $t0, 1
        addi $t2, $t2, 1
        beq $t1, '1', CORRECTBIN
        beq $t1, '0', CORRECTBIN
        la $a0, invalidInputMsg
        li $v0, 4
        syscall
        jal RESET
        j BINTOHEX
    CORRECTBIN:
        bne $t2, 32, CHECKBINSTRINGVALID
        la $a0, hexOutputMsg
        li $v0, 4 
        syscall
        la $t3, HexSpace
    THIRTYTWOBINLOOP:
        lb $t4, ($t3)
        addi $t3, $t3, 1
        addi $t5, $t5, 1 #4 counter 
        addi $t6, $t6, 1 #32 counter
        beq $t4, '1', ADDITIONANDEVA
        j CHECKOUTBINTOHEX
    ADDITIONANDEVA:
        bne $t5, 1, SECONDSPACE
        addi $t7, $t7, 8
        j CHECKOUTBINTOHEX
    SECONDSPACE:
        bne $t5, 2, THIRDSPACE
        addi $t7, $t7, 4
        j CHECKOUTBINTOHEX
    THIRDSPACE:
        bne $t5, 3, FOURTHSPACE
        addi $t7, $t7, 2
        j CHECKOUTBINTOHEX
    FOURTHSPACE:
        addi $t7, $t7, 1
        j CHECKOUTBINTOHEX
    CHECKOUTBINTOHEX:
        bne $t5, 4, PASSBINTOHEX 
        li $t5, 0
        bne $t7, 15, PRINTHEX14
        la $a0, fBit
        li $v0, 4
        syscall
        li $t7, 0
        j PASSBINTOHEX
    PRINTHEX14:
        bne $t7, 14, PRINTHEX13
        la $a0, eBit
        li $v0, 4
        syscall
        li $t7, 0
        j PASSBINTOHEX
    PRINTHEX13:
        bne $t7, 13, PRINTHEX12
        la $a0, dBit
        li $v0, 4
        syscall
        li $t7, 0
        j PASSBINTOHEX
    PRINTHEX12:
        bne $t7, 12, PRINTHEX11
        la $a0, cBit
        li $v0, 4
        syscall
        li $t7, 0
        j PASSBINTOHEX
    PRINTHEX11:
        bne $t7, 11, PRINTHEX10
        la $a0, bBit
        li $v0, 4
        syscall
        li $t7, 0
        j PASSBINTOHEX
    PRINTHEX10:
        bne $t7, 10, PRINTNUMHEX
        la $a0, aBit
        li $v0, 4
        syscall
        li $t7, 0
        j PASSBINTOHEX
    PRINTNUMHEX:
        move $a0, $t7
        li $v0, 1
        syscall
        li $t7, 0
    PASSBINTOHEX:
        bne $t6, 32, THIRTYTWOBINLOOP
        jal RESET
        j CONVERSIONMENU 
    BINTODEC:
        # space on t0 and t3, stop address on t4, evaluated substring on t1 and t6, valid counter on t2, value of position on t5, value of 2 on t7, and decimal on t8
        la $a0, enterBinMsg
        li $v0, 4
        syscall
        la $a0, HexSpace
        li $a1, 34
        li $v0, 8
        syscall
        
        la $t0, HexSpace
    CHECKBINSTRINGVALIDBINTODEC:
        lb $t1, ($t0)
        addi $t0, $t0, 1
        addi $t2, $t2, 1
        beq $t1, '1', CORRECTBINTODEC
        beq $t1, '0', CORRECTBINTODEC
        la $a0, invalidInputMsg
        li $v0, 4
        syscall
        jal RESET
        j BINTODEC
    CORRECTBINTODEC:
        bne $t2, 32, CHECKBINSTRINGVALIDBINTODEC
        la $a0, decOutputMsg
        li $v0, 4 
        syscall
        la $t3, HexSpace
        move $t4, $t3 #copy and stop address
        sub $t4, $t4, 1
        addi $t3, $t3, 31
        li $t5, 1
        li $t7, 2

    CONVERTBINTODECLOOP:
        lb $t6, ($t3)
        sub $t3, $t3, 1
        beq $t6, '1', COMPUTEANDINCREASE
        j BACKONESPACE
    COMPUTEANDINCREASE:
        add $t8, $t8, $t5
    BACKONESPACE:
        mult $t5, $t7
        mflo $t5
        bne $t3, $t4, CONVERTBINTODECLOOP
        move $a0 ,$t8
        li $v0, 1
        syscall
        jal RESET
        j CONVERSIONMENU
    DECTOBIN:
        la $a0, enterDecimal
        li $v0, 4
        syscall 
        li $v0, 5
        syscall 
        move $a0, $v0
        jal PRINTBIN
        jal RESET
        j CONVERSIONMENU
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
    DECTOHEX:
        #space array in t8 and t9, decimal in t0, filter in t1, 32-length counter on t3
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
        li $t1, 1
        sll $t1, $t1, 31
        li $t3, 32
    COUNTANDEVALUATE:
        and $t4, $t0, $t1
        bne $t4, 0, CONVERTONEHEX
    PASS:
        srl $t1, $t1, 1
        addi $t2, $t2, 1
        sub $t3, $t3, 1
        bne $t2, 4, COUNTANDEVALUATE
        sw $t5, 0($t9)
        addi $t9, $t9, 4 
        li $t2, 0
        li $t5, 0
        beq $t3, 0, PRINTHEX
        j COUNTANDEVALUATE
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
        beq $t6, 32, CONVERSIONMENU
        j PRINTHEX
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
    CONVERTONEHEX:
        bne $t2, 0, THIRD
        addi $t5, $t5, 8
        j PASS
    THIRD:
        bne $t2, 1, SECOND
        addi $t5, $t5, 4
        j PASS
    SECOND:
        bne $t2, 2, FIRST
        addi $t5, $t5, 2
        j PASS
    FIRST:
        addi $t5, $t5, 1
        j PASS
    HEXTODEC:
        #length of Hexadecimal in t4, length of input space in t2, address of space array in t0 and t5, counters in t1 and t6, decimal in s3,   
        la $a0, enterNumHex
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $t2, $v0
        move $t4, $t2
        addi $t2, $t2, 2
    CHECKLENOVERHEXTODEC:
        #check if length is over 8
        move $t5, $t4
        sub $t5, $t5, 8
        blez $t5, CHECKLENNEGHEXTODEC
        la $a0, overMaxMsg
        li $v0, 4 
        syscall
        li $t5, 0
        j HEXTODEC
    CHECKLENNEGHEXTODEC:  
        #check if length is negative
        bgtz $t4, PASSHEXMSGHEXTODEC
        la $a0, negLengthMsg
        li $v0, 4 
        syscall
        j HEXTODEC
    PASSHEXMSGHEXTODEC:
        la $a0, enterHexMsg
        li $v0, 4
        syscall

        li $v0, 8
        la $a0, hexStringSpace
        move $a1, $t2
        syscall

        la $t0, hexStringSpace
        la $t5, hexStringSpace
    CHECKVALIDHEXTODEC:
        lb $t7, ($t5)
        addi $t5, $t5, 1
        addi $t6, $t6, 1
        beq $t7, '0', PASSVALIDHEXTODEC
        beq $t7, '1', PASSVALIDHEXTODEC
        beq $t7, '2', PASSVALIDHEXTODEC
        beq $t7, '3', PASSVALIDHEXTODEC
        beq $t7, '4', PASSVALIDHEXTODEC
        beq $t7, '5', PASSVALIDHEXTODEC
        beq $t7, '6', PASSVALIDHEXTODEC
        beq $t7, '7', PASSVALIDHEXTODEC 
        beq $t7, '8', PASSVALIDHEXTODEC
        beq $t7, '9', PASSVALIDHEXTODEC
        beq $t7, 'A', PASSVALIDHEXTODEC
        beq $t7, 'B', PASSVALIDHEXTODEC
        beq $t7, 'C', PASSVALIDHEXTODEC
        beq $t7, 'D', PASSVALIDHEXTODEC
        beq $t7, 'E', PASSVALIDHEXTODEC
        beq $t7, 'F', PASSVALIDHEXTODEC
        la $a0, invalidHexMsg
        li $v0, 4
        syscall
        jal RESET
        j HEXTODEC
    PASSVALIDHEXTODEC:
        bne $t6, $t4, CHECKVALIDHEXTODEC
        la $a0, decOutputMsg
        li $v0, 4
        syscall
    CONVERTHEXTODECLOOP:
        lb $t3, ($t0)
        addi $t0, $t0, 1
        addi $t1, $t1, 1
        bne $t3, '0', ADD1
        li $s1, 0
        jal CHECKPOSITIONANDCOMPUTE
        j CHECKOUTHEXTODEC
    ADD1:
        bne $t3, '1', ADD2
        li $s1, 1
        jal CHECKPOSITIONANDCOMPUTE
        j CHECKOUTHEXTODEC
    ADD2:
        bne $t3, '2', ADD3
        li $s1, 2
        jal CHECKPOSITIONANDCOMPUTE
        j CHECKOUTHEXTODEC
    ADD3:
        bne $t3, '3', ADD4
        li $s1, 3
        jal CHECKPOSITIONANDCOMPUTE
        j CHECKOUTHEXTODEC
    ADD4:
        bne $t3, '4', ADD5
        li $s1, 4
        jal CHECKPOSITIONANDCOMPUTE
        j CHECKOUTHEXTODEC
    ADD5:
        bne $t3, '5', ADD6
        li $s1, 5
        jal CHECKPOSITIONANDCOMPUTE
        j CHECKOUTHEXTODEC
    ADD6:
        bne $t3, '6', ADD7
        li $s1, 6
        jal CHECKPOSITIONANDCOMPUTE
        j CHECKOUTHEXTODEC
    ADD7:
        bne $t3, '7', ADD8
        li $s1, 7
        jal CHECKPOSITIONANDCOMPUTE
        j CHECKOUTHEXTODEC
    ADD8:
        bne $t3, '8', ADD9
        li $s1, 8
        jal CHECKPOSITIONANDCOMPUTE
        j CHECKOUTHEXTODEC
    ADD9:
        bne $t3, '9', ADD10
        li $s1, 9
        jal CHECKPOSITIONANDCOMPUTE
        j CHECKOUTHEXTODEC
    ADD10:
        bne $t3, 'A', ADD11
        li $s1, 10
        jal CHECKPOSITIONANDCOMPUTE
        j CHECKOUTHEXTODEC
    ADD11:
        bne $t3, 'B', ADD12
        li $s1, 11
        jal CHECKPOSITIONANDCOMPUTE
        j CHECKOUTHEXTODEC
    ADD12:
        bne $t3, 'C', ADD13
        li $s1, 12
        jal CHECKPOSITIONANDCOMPUTE
        j CHECKOUTHEXTODEC
    ADD13:
        bne $t3, 'D', ADD14
        li $s1, 13
        jal CHECKPOSITIONANDCOMPUTE
        j CHECKOUTHEXTODEC
    ADD14:
        bne $t3, 'E', ADD15
        li $s1, 14
        jal CHECKPOSITIONANDCOMPUTE
        j CHECKOUTHEXTODEC
    ADD15:
        li $s1, 15
        jal CHECKPOSITIONANDCOMPUTE
        j CHECKOUTHEXTODEC
    CHECKOUTHEXTODEC:
        bne $t1, $t4, CONVERTHEXTODECLOOP
        move $a0, $s3
        li $v0, 1
        syscall
        li $s0, 0
        li $s1, 0
        li $s2, 0
        li $s3, 0
        jal RESET
        j CONVERSIONMENU
    CHECKPOSITIONANDCOMPUTE:
        bne $t1, 1, NEXT1
        li $s0, 268435456
        j COMPUTEANDADD
    NEXT1:
        bne $t1, 2, NEXT2
        li $s0, 16777216
        j COMPUTEANDADD
    NEXT2: 
        bne $t1, 3, NEXT3
        li $s0, 1048576
        j COMPUTEANDADD
    NEXT3: 
        bne $t1, 4, NEXT4
        li $s0, 65536
        j COMPUTEANDADD
    NEXT4: 
        bne $t1, 5, NEXT5
        li $s0, 4096
        j COMPUTEANDADD
    NEXT5: 
        bne $t1, 6, NEXT6
        li $s0, 256
        j COMPUTEANDADD
    NEXT6: 
        bne $t1, 7, NEXT7
        li $s0, 16
        j COMPUTEANDADD
    NEXT7:
        li $s0, 1
    COMPUTEANDADD:
        multu $s0, $s1			
        mflo $s2	
        add $s3, $s3, $s2
        j $ra
    HEXTOBIN:
        #length of Hexadecimal in t4, length of input space in t2, address of space array in t0 and t5, counters in t1 and t6   
        la $a0, enterNumHex
        li $v0, 4
        syscall
        li $v0, 5
        syscall
        move $t2, $v0
        move $t4, $t2
        addi $t2, $t2, 2
    CHECKLENOVER:
        #check if length is over 8
        move $t5, $t4
        sub $t5, $t5, 8
        blez $t5, CHECKLENNEG
        la $a0, overMaxMsg
        li $v0, 4 
        syscall
        li $t5, 0
        j HEXTOBIN
    CHECKLENNEG:  
        #check if length is negative
        bgtz $t4, PASSHEXMSG
        la $a0, negLengthMsg
        li $v0, 4 
        syscall
        j HEXTOBIN
    PASSHEXMSG: 
        la $a0, enterHexMsg 
        li $v0, 4
        syscall
        
        li $v0, 8 
        la $a0, hexStringSpace 
        move $a1, $t2
        syscall

        la $t0, hexStringSpace
        la $t5, hexStringSpace
    CHECKVALID:
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
        jal RESET
        j HEXTOBIN
    PASSVALID:
        bne $t6, $t4, CHECKVALID
        la $a0, binOutputMsg
        li $v0, 4
        syscall
    CONVERTHEXTOBINLOOP:
        lb $t3, ($t0)
        addi $t0, $t0, 1
        addi $t1, $t1, 1
        bne $t3, '0', PRINT1
        la $a0, set0
        li $v0, 4
        syscall
        j CHECKOUTHEXTOBIN
    PRINT1:
        bne $t3, '1', PRINT2
        la $a0, set1
        li $v0, 4
        syscall
        j CHECKOUTHEXTOBIN
    PRINT2:
        bne $t3, '2', PRINT3
        la $a0, set2
        li $v0, 4
        syscall
        j CHECKOUTHEXTOBIN
    PRINT3:
        bne $t3, '3', PRINT4
        la $a0, set3
        li $v0, 4
        syscall
        j CHECKOUTHEXTOBIN
    PRINT4:
        bne $t3, '4', PRINT5
        la $a0, set4
        li $v0, 4
        syscall
        j CHECKOUTHEXTOBIN
    PRINT5:
        bne $t3, '5', PRINT6
        la $a0, set5
        li $v0, 4
        syscall
        j CHECKOUTHEXTOBIN
    PRINT6:
        bne $t3, '6', PRINT7
        la $a0, set6
        li $v0, 4
        syscall
        j CHECKOUTHEXTOBIN
    PRINT7:
        bne $t3, '7', PRINT8
        la $a0, set7
        li $v0, 4
        syscall
        j CHECKOUTHEXTOBIN
    PRINT8:
        bne $t3, '8', PRINT9
        la $a0, set8
        li $v0, 4
        syscall
        j CHECKOUTHEXTOBIN
    PRINT9:
        bne $t3, '9', PRINT10
        la $a0, set9
        li $v0, 4
        syscall
        j CHECKOUTHEXTOBIN
    PRINT10:
        bne $t3, 'A', PRINT11
        la $a0, set10
        li $v0, 4
        syscall
        j CHECKOUTHEXTOBIN 
    PRINT11:
        bne $t3, 'B', PRINT12
        la $a0, set11
        li $v0, 4
        syscall
        j CHECKOUTHEXTOBIN
    PRINT12:
        bne $t3, 'C', PRINT13
        la $a0, set12
        li $v0, 4
        syscall
        j CHECKOUTHEXTOBIN
    PRINT13:
        bne $t3, 'D', PRINT14
        la $a0, set13
        li $v0, 4
        syscall
        j CHECKOUTHEXTOBIN
    PRINT14:
        bne $t3, 'E', PRINT15 
        la $a0, set14
        li $v0, 4
        syscall
        j CHECKOUTHEXTOBIN
    PRINT15:
        la $a0, set15
        li $v0, 4
        syscall 
    CHECKOUTHEXTOBIN:
        bne $t1, $t4, CONVERTHEXTOBINLOOP
        jal RESET
        j CONVERSIONMENU
    RESET:
        li $t0, 0
        li $t1, 0
        li $t2, 0
        li $t3, 0
        li $t4, 0
        li $t5, 0 
        li $t6, 0 
        li $t7, 0
        li $t8, 0
        li $t9, 0
        li $a0, 0
        j $ra