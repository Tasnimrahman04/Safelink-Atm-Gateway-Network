.MODEL SMALL
.STACK 100h
.DATA
hashKey db 0x1F 

a db '0123', '..--....','500', 0 ; user A real pass:11221111
b db '1234', '))(((())','500', 0 ; user B real pass:66777766
c db '2345', '.-,+*)(&','500', 0 ; user C real pass:12345679
d db '3456', '((((((((','500', 0 ; user D real pass:77777777
e db '7891', ')()()()(','500', 0 ; user E real pass:67676767
f db '1357', '()()()()','500', 0 ; user F real pass:76767676
g db '2468', '.-,+*)((','500', 0 ; user G real pass:12345677
h db '1213', '..((--((','500', 0 ; user H real pass:11772277
i db '1415', '(())))((','500', 0 ; user I real pass:77666677
j db '1617', '(******(','500', 0 ; user J real pass:75555557
k db '1819', '..--,,++','500', 0 ; user K real pass:11223344
l db '1889', '..--,,++','500', 0 ; user L real pass:11223344
m db '1899', '..--,,++','500', 0 ; user M real pass:11223344
n db '1888', '..--,,++','500', 0 ; user N real pass:11223344
o db '1999', '..--,,++','500', 0 ; user O real pass:11223344
p db '2000', '..--,,++','500', 0 ; user P real pass:11223344
q db '2001', '..--,,++','500', 0 ; user Q real pass:11223344
r db '2002', '..--,,++','500', 0 ; user R real pass:11223344
s db '1432', '..--,,++','500', 0 ; user S real pass:11223344
t db '1555', '..--,,++','500', 0 ; user T real pass:11223344
u db '1444', '..--,,++','500', 0 ; user U real pass:11223344
v db '1811', '..--,,++','500', 0 ; user V real pass:11223344
w db '1656', '..--,,++','500', 0 ; user W real pass:11223344
x db '1912', '..--,,++','500', 0 ; user X real pass:11223344
y db '1523', '..--,,++','500', 0 ; user Y real pass:11223344
z db '3124', '..--....','500', 0 ; user Z real pass:11221111
users dw 'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
promptPassword db 13, 10, 'Enter 8-digit pin: $'
msgInvalidPassword db 13,10,'Incorrect pin.$'
msgInvalid db 13,10,'Invalid Card Number. Exiting...$'
prompt db 13,10,'Enter 4-digit Card Number: $'
userInput dw 5 dup(0)
passwordInput db 9 dup(0)
msgRetry db 'Retry<', '$'
retryEndMsg db '>', '$'
retryCount db 0
msgMaxAttempts db 'Max attempts reached. Exiting ...', 13, 10, '$'
newline db 13, 10, '$'
welcomeMsg db 'Welcome to SafeLink ATM', 13, 10, '$'
option1 db 'Press 1 to proceed...', 13, 10, '$'
option0 db 'Press 0 to exit...', 13, 10, '$'
exitMsg db 13,10,'Exiting...$'
invalidOption db 'Invalid option. Exiting...$', 13, 10, '$'
welcomeUserMsg db 'Welcome ', '$'
userLoggedInMsg db 13,10, 'User ', 'is trying to log in: $'
loggedInUserIndex dw ?
username db ' ', '$'
passwordRetryCount db 0       



;;;;;;;;;;;;;;;;----tazree--------;;;;;;;;;;;;;;;;;;;;;;;;; 

    balances    dw 11000, 22000, 33000, 44000, 55000, 5000, 8000, 15000, 2500, 25000

    fee_msg       db 0dh,0ah,'Transaction fee: $'
    invalid_amt   db 0dh,0ah,'Invalid amount! Please enter correct amount.$'
    mfs_msg       db 0dh,0ah,'Enter phone Number (11 digits): $'
    phone_error_msg db 0dh,0ah,'Phone verification failed. Transaction cancelled.$'
    retry_msg     db 0dh,0ah,'Would you like to try again? (1-Yes, 2-No): $'

    MENU_MSG    db 0dh,0ah,     '********* ATM MENU *********'
                db 0dh,0ah,     '|     1. Check Balance     |'       
                db 0dh,0ah,     '|     2. Withdraw Money    |'
                db 0dh,0ah,     '|     3. Deposit Money     |'
                db 0dh,0ah,     '|     4. MFS Cashout       |'
                db 0dh,0ah,     '|     5. Transfer Balance  |'
                db 0dh,0ah,     '|     6. Bill Payment      |'
                db 0dh,0ah,     '|     7. Change Pin        |'
                db 0dh,0ah,     '|     8. Exit              |'
                db 0dh,0ah,     '|__________________________|'
                db 0dh,0ah,     '      Enter choice: $      '
                
    balance_msg      db 0dh,0ah,'Your balance is: $'  
    min_balance_msg  db 0dh,0ah,'Minimum balance is: $'   
    withdrawal       db 0dh,0ah,'Enter withdrawal amount (multiple of 500): $' 
    deposite        db 0dh,0ah,'Enter deposit amount (multiple of 100): $'  
    mfs_cash_out    db 0dh,0ah,'Bank to Bkash/Nogod (minimum balance): $'  
    insuff_msg      db 0dh,0ah,'Insufficient funds! Cannot go below minimum balance!$' 
    invalid_amt_msg db 0dh,0ah,'Invalid amount! Please enter valid denomination.$'    
    succ_msg        db 0dh,0ah,'Transaction successful!$'  
    taka            db '$'
    
    ; Constants
    max_accs        equ 10      ; Max accounts
    min_bal         dw 1000    ; Min balance requirement
    withdrawal_type dw 500      ; Withdrawal denomination
    deposite_type   dw 100      ; Deposit denomination
    k_amt           dw 1000     ; Base amount for fee calculation
    fee_per_k       dw 10       ; Fee per 1000
    max_phones      equ 10      ; Maximum number of phone entries

    ; Phone Number System
    phone_msg    db 'Enter phone number (11 digits): $'
    invalid_p_msg  db 'Invalid phone number!$'
    phone_db     dw 0171, 234, 5678  ; First user (3 parts)
                 dw 0182, 345, 6789  ; Second user
                 dw 0193, 456, 7890   
                 dw 0174, 567, 8910  
                 dw 0193, 890, 8901
                 dw 0194, 678, 9101   
                 
                 dw 10 dup(0,0,0) 
                      
    input_p1     dw ?               ; First 4 digits
    input_p2     dw ?               ; Middle 3 digits 
    input_p3     dw ?               ; Last 4 digits

    ; Transaction Variables

    amt              dw ?
    mfs_amt          dw ?
    CURR_ACC         dw ?        ; current account index
    REMAINDER        dw ?        ; validity check
    fee_amt          dw ?        ; transaction fee
    input_phone_num  dw ?


REENTER DB 0AH, 0AH, 0DH, " Re-enter your current PIN: $"
NEW_PWD_PROMPT DB 0AH, 0DH, " Enter new 8-digit PIN: $"
NEW_PWD_SUCCESS DB 0AH, 0AH, 0DH, " Your PIN has been changed successfully!$"
RESTRICT DB 0AH, 0AH, 0DH, " New PIN must be exactly 8 digits.$"

Bill_MSG    db 0dh,0ah,     '********* Bill MENU *********'
            db 0dh,0ah,     '|     1. DESCO             |'       
            db 0dh,0ah,     '|     2. Titas Gas         |'
            db 0dh,0ah,     '|     3. Dhaka Wasa        |'
            db 0dh,0ah,     '|     4. Dot Net           |'
            db 0dh,0ah,     '|     5. BTCL              |'
            db 0dh,0ah,     '|     6. Back              |'
            db 0dh,0ah,     '|__________________________|'
            db 0dh,0ah,     '      Enter choice: $      '
Bill_PAY    db 0dh,0ah,     'Enter bill amount : $' 
TRANSFER_BALANCE_MSG db 0dh,0ah, '********* Transfer Balance *********', 0dh,0ah, 'Enter the Account Number to transfer to: $'
INVALID_ACC_MSG db 0dh,0ah, 'Invalid account number! Please try again. $'
TRANSFER_AMOUNT_MSG db 0dh,0ah, 'Enter transfer amount (minimum 1000): $'
recipientInput db 10, 0  ; Allocate 10 bytes for recipient input, 0 is for string terminator
min_bill dw 1000

.CODE
start:
mov ax, @DATA
mov ds, ax
mov ah, 02h
mov bh, 0
mov dl, 35
int 10h
mov dx, OFFSET welcomeMsg
call printString
mov dx, OFFSET option1
call printString
mov dx, OFFSET option0
call printString
mov ah, 1
int 21h
cmp al, '1'
je continueExecution
cmp al, '0'
je exitProgram
mov dx, OFFSET invalidOption
call printString
jmp exitProgram
continueExecution:
mov byte ptr [retryCount], 5
retryIDLoop:
mov dx, OFFSET prompt
call printString
lea di, userInput
call get4DigitInput
lea si, a
mov cx, 26
xor di, di
compareUsersLoop:
push cx
push si
push di
lea bx, userInput
call compareIDs
jz userMatched
pop di
pop si
pop cx
add si, 16
inc di
loop compareUsersLoop
mov dx, OFFSET msgInvalid
call printString
dec byte ptr [retryCount]
cmp byte ptr [retryCount], 0
jl passwordMaxAttempts
mov dx, OFFSET msgRetry
call printString
mov al, byte ptr [retryCount]
add al, '0'
mov dl, al
call printChar
mov dx, OFFSET retryEndMsg
call printString
mov dx, OFFSET newline
call printString
jmp retryIDLoop

userMatched:
mov [loggedInUserIndex], di
mov ax, [loggedInUserIndex]
lea si, users
add si, ax
mov al, [si]
mov username, al
mov dx, offset userLoggedInMsg
call printString
mov dx, offset username
call printString
mov dx, offset newline
call printString
jmp checkPasswordSection

checkPasswordSection:
mov ax, [loggedInUserIndex]
mov bx, 16
mul bx
add ax, offset a
add ax, 4
mov si, ax
mov byte ptr [passwordRetryCount], 3

passwordRetryLoop:
mov dx, OFFSET promptPassword
call printString
lea di, passwordInput
call get8DigitInput
mov cx, 8
lea di, passwordInput

hashAndCompareLoop:
mov al, [di]
xor al, hashKey
cmp al, [si]
jne passwordNotMatch
inc si
inc di
loop hashAndCompareLoop
jmp passwordMatched

passwordNotMatch:
dec byte ptr [passwordRetryCount]
cmp byte ptr [passwordRetryCount], 0
jl passwordMaxAttempts
mov dx, OFFSET msgInvalidPassword
call printString
mov dx, OFFSET msgRetry
call printString
mov al, byte ptr [passwordRetryCount]
add al, '0'
mov dl, al
call printChar
mov dx, OFFSET retryEndMsg
call printString
mov dx, offset newline
call printString
jmp passwordRetryLoop

passwordMatched:
mov ax, [loggedInUserIndex]
lea si, users
add si, ax
mov al, [si]
mov username, al
mov dx, offset welcomeUserMsg
call printString
mov dx, offset username
call printString
mov dx, offset newline
call printString
;jmp exitProgram
jmp menu_loop

passwordMaxAttempts:
mov dx, OFFSET msgMaxAttempts
call printString
jmp exitProgram

get4DigitInput:
mov cx, 4
inputLoop4:
mov ah, 1
int 21h
cmp al, 13
je inputDone4
mov [di], al
inc di
loop inputLoop4
inputDone4:
mov byte ptr [di], 0
ret    

get8DigitInput:
push bx
push cx
push dx
mov cx, 8
lea bx, passwordInput
inputLoop8:
mov ah, 08h
int 21h
cmp al, 13
je inputDone8
cmp al, 8
je handleBackspace
cmp al, 32
jl inputLoop8
cmp al, 126
jg inputLoop8
mov [bx], al
mov dl, '*'
mov ah, 02h
int 21h
inc bx
loop inputLoop8

inputDone8:
mov byte ptr [bx], 0
mov dl, 13
mov ah, 02h
int 21h
mov dl, 10
int 21h
pop dx
pop cx
pop bx
ret

handleBackspace:
lea si, passwordInput
cmp bx, si
je inputLoop8
dec bx
mov dl, 8
mov ah, 02h
int 21h
mov dl, ' '
mov ah, 02h
int 21h
mov dl, 8
mov ah, 02h
int 21h
jmp inputLoop8

compareIDs:
push di
mov cx, 4
lea di, userInput

compareLoop4:
mov al, [si]
cmp al, [di]
jne notMatch
inc si
inc di
loop compareLoop4
xor ax, ax
pop di
ret
notMatch:
mov ax, 1
pop di
ret
;checkPassword1:
;ret

printChar:
mov ah, 02h
int 21h
ret
printString:
mov ah, 9
int 21h
ret                              



;;;;;;;;;;;;;;;;;;;;;;;;----------tazree--------;;;;;;;;;;;;;;;;;;;

menu_loop:
    lea dx, newline
    mov ah, 09
    int 21h    
    
    ;display menu
    lea dx, MENU_MSG
    mov ah, 09h
    int 21h
    
    ;menu choice
    mov ah, 01H
    int 21h
    
    ;choices
    cmp al, '1'
    je balance_check
    cmp al, '2'
    je withdraw
    cmp al, '3'
    je deposit
    cmp al, '4' 
    je mfs_cashout
    cmp al, '5' 
    je transfer_balance
    cmp al, '6' 
    je bill_payment_menu_loop
    cmp al, '7' 
    je change_pin
    cmp al, '8'
    je exit
    jmp menu_loop

 
balance_check:
    lea dx, newline
    mov ah, 09
    int 21h 
    
    lea dx, balance_msg
    mov ah, 09h
    int 21h
    
    mov si, CURR_ACC
    mov ax, balances[si]
    call print_num

    jmp menu_loop
    
withdraw:
    lea dx, newline
    mov ah, 09
    int 21h
    
    lea dx, withdrawal
    mov ah, 09h
    int 21h
    
    call read_num
    mov amt, ax
    
; Validate amount
    mov ax, amt
    mov bx, withdrawal_type
    xor dx, dx
    div bx
    mov REMAINDER, dx
    cmp REMAINDER, 0
    jne invalid_amount
    
; Calculate the fee
    mov ax, amt
    xor dx, dx
    mov bx, k_amt
    div bx
    mul fee_per_k
    mov fee_amt, ax
    
; Display fee
    lea dx, fee_msg
    mov ah, 09h
    int 21h
    
    mov ax, fee_amt
    call print_num
    
; Check balance
    mov si, CURR_ACC
    mov ax, balances[si]
    sub ax, amt
    sub ax, fee_amt
    
    cmp ax, min_bal
    jb insufficient_funds
    
; Update balance
    mov balances[si], ax
    
    lea dx, succ_msg
    mov ah, 09h
    int 21h
    jmp menu_loop
    
deposit:
    lea dx, newline
    mov ah, 09
    int 21h
    
    lea dx, deposite
    mov ah, 09h
    int 21h
    
    call read_num
    mov amt, ax
    
; Validate amount
    mov ax, amt
    mov bx, deposite_type
    xor dx, dx
    div bx
    mov REMAINDER, dx
    cmp REMAINDER, 0
    jne invalid_amount
    
; Update balance
    mov si, CURR_ACC
    mov ax, amt
    add balances[si], ax
    
    lea dx, succ_msg
    mov ah, 09h
    int 21h
    jmp menu_loop
    
    

mfs_cashout:
    lea dx, newline
    mov ah, 09h
    int 21h
    
; Get and verify phone number
    lea dx, phone_msg
    mov ah, 09h
    int 21h
    
    call read_phone
    cmp ax, 0
    je phone_error
    
; Verify phone number
    mov cx, max_phones
    xor si, si
    
verify_phone_loop:
    push cx
    call verify_phone
    pop cx
    
    cmp ax, 1
    je phone_verified
    
    add si, 6
    loop verify_phone_loop
    jmp phone_error

phone_error:
    lea dx, phone_error_msg
    mov ah, 09h
    int 21h
    
    lea dx, retry_msg
    mov ah, 09h
    int 21h
    
    mov ah, 01h
    int 21h
    
    cmp al, '1'
    je mfs_cashout
    jmp menu_loop

phone_verified:   
    lea dx, newline
    mov ah, 09
    int 21h
    
    lea dx, mfs_cash_out
    mov ah, 09h
    int 21h   
    
    call read_num
    mov mfs_amt, ax
    
; Validate amount
    mov ax, mfs_amt
    mov bx, withdrawal_type
    xor dx, dx
    div bx
    mov REMAINDER, dx
    cmp REMAINDER, 0
    jne invalid_amount
    
; Calculate the fee
    mov ax, mfs_amt
    xor dx, dx
    mov bx, k_amt
    div bx
    mul fee_per_k
    mov fee_amt, ax
    
; Display fee
    lea dx, fee_msg
    mov ah, 09h
    int 21h
    
    mov ax, fee_amt
    call print_num
    
; Checking balance
    mov si, CURR_ACC
    mov ax, balances[si]
    sub ax, mfs_amt
    sub ax, fee_amt
    
    cmp ax, min_bal
    jb insufficient_funds
    
; Updated the balance
    mov balances[si], ax
    
    lea dx, succ_msg
    mov ah, 09h
    int 21h
    jmp menu_loop

invalid_amount:
    lea dx, newline
    mov ah, 09
    int 21h
    
    lea dx, invalid_amt
    mov ah, 09h
    int 21h
    jmp menu_loop
    
insufficient_funds:
    lea dx, insuff_msg
    mov ah, 09h
    int 21h
    jmp menu_loop


transfer_balance:
    lea dx, TRANSFER_BALANCE_MSG
    mov ah, 09h
    int 21h
    
    lea di, userInput
    call get4DigitInput
    
    ; Validate account number (check if the number exists)
    mov cx, max_accs
    lea si, balances
    xor ax, ax
validate_account:
    push cx
    lea di, userInput
    call compareIDs
    pop cx
    cmp ax, 0             ; Check if match is found
    je invalid_account
    
    lea dx, TRANSFER_AMOUNT_MSG
    mov ah, 09h
    int 21h
    call read_num
    mov amt, ax
    mov ax, amt
    cmp ax, 1000
    jb insufficient_funds
    
    ;sufficient balance
    mov si, CURR_ACC
    mov ax, balances[si]
    sub ax, amt
    cmp ax, min_bal
    jb insufficient_funds

    mov balances[si], ax

    lea si, balances
    add si, ax
    mov ax, amt
    add [si], ax

    lea dx, succ_msg
    mov ah, 09h
    int 21h
    jmp menu_loop

invalid_account:
    lea dx, INVALID_ACC_MSG
    mov ah, 09h
    int 21h
    jmp menu_loop



bill_payment_menu_loop:
    lea dx, newline
    mov ah, 09
    int 21h    
    
    lea dx, Bill_MSG
    mov ah, 09h
    int 21h
    
    mov ah, 01H
    int 21h
    
    cmp al, '1'
    je bill_payment
    cmp al, '2'
    je bill_payment
    cmp al, '3'
    je bill_payment
    cmp al, '4' 
    je bill_payment
    cmp al, '5' 
    je bill_payment
    cmp al, '6' 
    je menu_loop
    jmp bill_payment_menu_loop 


bill_payment:
    lea dx, newline
    mov ah, 09
    int 21h
    
    lea dx,  bill_pay
    mov ah, 09h
    int 21h
    
    call read_num
    mov amt, ax
    
; Validate amount
    mov ax, amt
    mov bx, min_bill
    cmp ax, bx
    jl invalid_amount

    mov fee_amt, 10
    
    
; Check balance
    mov si, CURR_ACC
    mov ax, balances[si]
    sub ax, amt
    sub ax, fee_amt
    
    cmp ax, min_bal
    jb insufficient_funds  
    
    
; Update balance
    mov balances[si], ax
    
    lea dx, succ_msg
    mov ah, 09h
    int 21h
    jmp menu_loop

; Display fee
    lea dx, fee_msg
    mov ah, 09h
    int 21h
    
    mov ax, fee_amt
    call print_num
    
    


change_pin:
    ; Prompt user to enter their current PIN
    lea dx, REENTER
    mov ah, 09h
    int 21h

    lea di, passwordInput
    call get8DigitInput

    ; Compare current PIN with the stored PIN
    mov ax, [loggedInUserIndex]
    mov bx, 16
    mul bx
    add ax, offset a
    add ax, 4
    mov si, ax
    lea di, passwordInput
    mov cx, 8
change_pin_check_loop:
    mov al, [di]
    xor al, hashKey
    cmp al, [si]
    jne pin_not_match
    inc si
    inc di
    loop change_pin_check_loop

    lea dx, NEW_PWD_PROMPT
    mov ah, 09h
    int 21h

    lea di, passwordInput
    call get8DigitInput

    mov cx, 8
    lea si, passwordInput
validate_new_pin:
    mov al, [si]
    cmp al, 0
    je pin_too_short
    inc si
    loop validate_new_pin

    mov ax, [loggedInUserIndex]
    mov bx, 16
    mul bx
    add ax, offset a
    add ax, 4
    mov si, ax
    lea di, passwordInput
    mov cx, 8
save_new_pin_loop:
    mov al, [di]
    xor al, hashKey
    mov [si], al
    inc si
    inc di
    loop save_new_pin_loop

    lea dx, NEW_PWD_SUCCESS
    mov ah, 09h
    int 21h
    jmp menu_loop

pin_not_match:
    lea dx, msgInvalidPassword
    mov ah, 09h
    int 21h
    jmp menu_loop

pin_too_short:
    lea dx, RESTRICT
    mov ah, 09h
    int 21h
    jmp menu_loop
;================================================    
exit:
    mov ah, 4CH
    int 21h


read_num PROC
    xor bx, bx
    mov cx, 4
    
read_digit:
    mov ah, 01H
    int 21h
    
    sub al, '0'
    mov ah, 0
    push ax
    
    mov ax, bx
    mov bx, 10
    mul bx
    mov bx, ax
    
    pop ax
    add bx, ax
    
    loop read_digit
    
    mov ax, bx
    ret
read_num ENDP

print_num PROC
    mov bx, 10
    xor cx, cx
    
divide:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz divide
    
print_loop:
    pop dx
    add dl, '0'
    mov ah, 02H
    int 21h
    loop print_loop
    ret
print_num ENDP

read_phone PROC
    push bp
    mov bp, sp
    
    mov input_p1, 0
    mov input_p2, 0
    mov input_p3, 0
    
    mov cx, 4
    call read_digits
    jc read_phone_error
    mov input_p1, ax
    
    mov cx, 3
    call read_digits
    jc read_phone_error
    mov input_p2, ax
    
    mov cx, 4
    call read_digits
    jc read_phone_error
    mov input_p3, ax
    
    mov ax, 1
    jmp read_phone_end
    
read_phone_error:
    mov ax, 0
    
read_phone_end:
    pop bp
    ret
read_phone ENDP

read_digits PROC
    xor bx, bx
digit_loop:
    mov ah, 01h
    int 21h

    cmp al, 13
    je invalid_digit
    
    sub al, '0'
    jb invalid_digit
    cmp al, 9
    ja invalid_digit

    xor ah, ah
    push ax
    
    mov ax, bx
    mov bx, 10
    mul bx
    mov bx, ax
    
    pop ax
    add bx, ax
    
    loop digit_loop
    
    mov ax, bx
    clc 
    ret

invalid_digit:
    lea dx, invalid_p_msg
    mov ah, 09h
    int 21h
    stc
    ret
read_digits ENDP

verify_phone PROC
    mov ax, phone_db[si]
    cmp ax, input_p1
    jne no_match

    mov ax, phone_db[si+2]
    cmp ax, input_p2
    jne no_match

    mov ax, phone_db[si+4]
    cmp ax, input_p3
    jne no_match
    
    mov ax, 1
    ret
    
no_match:
    xor ax, ax
    ret
verify_phone ENDP 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
exitProgram:
mov dx, OFFSET exitMsg
call printString
mov ah, 4Ch
int 21h
END start


