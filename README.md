# SafeLink ATM Gateway Network

SafeLink ATM Gateway Network is a secure ATM simulation developed in 8086 Assembly Language using MASM/TASM and DOS interrupts. The project simulates real-world ATM operations including secure card login, PIN verification, banking transactions, and transaction validation.

## Features

- 4-digit card number login system
- Masked 8-digit PIN entry using `*`
- PIN hashing for secure authentication
- Limited retry attempts for invalid login credentials
- Balance inquiry
- Cash withdrawal with transaction fee support
- Deposit money
- Transfer balance between accounts
- Bill payment system
- MFS cash-out to Bkash/Nagad style numbers
- Secure PIN change functionality
- Minimum balance and denomination validation
- Phone number verification for MFS transactions

## Security Highlights

- PINs are not stored directly; they are hashed before verification
- User gets limited login attempts before the program exits
- Transactions are rejected if they violate:
  - Minimum balance requirement
  - Fixed PIN length
  - Invalid denomination rules
  - Invalid account or phone number

## Transaction Rules

- Withdrawal amount must be a multiple of `500`
- Deposit amount must be a multiple of `100`
- Minimum account balance must remain `1000`
- Transfer amount must be at least `1000`
- Bill payment must be at least `1000`
- Transaction fee is applied for withdrawals and MFS cash-out

## Technologies Used

- 8086 Assembly Language
- MASM / TASM
- DOS Interrupt `21h`
- Low-level memory and string handling

## Run

```bash
tasm CSE341_Project.asm
tlink CSE341_Project.obj
CSE341_Project.exe
