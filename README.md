# Bank tech test

## Introduction
* This program was created as practice for tech tests and focuses on creating readable, clean code with well formulated tests.
* Each user story was built up via TDD
* Once each story was completed it was tested in IRB 
* The program acts as a banking app in which the user can deposit and withdraw money as well as view a statement of thier transactions.
## Approach
* The initial requirements were broken down into users stories:
```
As a client
So I can store my money
I would like to make a deposit

As a client
So I can spend my money
I would like to be able to make a withdrawal

As a client
So I can manage my finances
I would like to be able to view a bank statement
```
* These requirements were then broken down into the classes and methods required to complete the task.

| Class           | Method         | Variables |
|-----------------|----------------|-----------|
| Account         | deposit        | @balance  |
|                 | withdraw       |           |
| TransactionLogs | deposit        | @logs     |
|                 | withdraw       |           |
| Transaction     |                | @date     |
|                 |                | @credit   |
|                 |                | @debit    |
|Printer          | view_statement |           |

* Transaction logs are created upon creation of the account via dependancy injection.
* Transactions are created each time a deposit or withdrawal is made  and stored in the transaction logs.
* Errors were then added to prevent negative values being entered into the functions and withdrawals for money which was not in the account.
* These were introduced in the account class as the transaction logs are dependant on the account class.

## Quickstart

```bash
> git clone https://github.com/KaneG9/bank_tech_test.git
> cd bank_tech_test
> bundle install
> rspec #run tests
> irb -r './lib/account.rb' #run program in irb
```

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

