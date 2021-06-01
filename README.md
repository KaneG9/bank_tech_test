# Bank tech test

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
|                 | view_statement |           |
| TransactionLogs | deposit        | @logs     |
|                 | withdraw       |           |

* Transaction logs are created upon creation of the account via dependancy injection.
* From these requirements each user story was built up via TDD
* Once each story was completed it was tested in IRB
* Errors were then added to prevent negative values being entered into the functions and withdraws for money which was not in the account.
* These were introduced in the account class as the transaction logs are only interacted with through the account class.

## Quickstart

```bash
> git clone https://github.com/KaneG9/bank_tech_test.git
> cd bank_tech_test
> bundle install
> rspec #run tests
> irb -r './lib/account.rb' #run program in irb
```

## Notes
* Amounts are stored in the transaction logs as strings in order to maintain correct formatting
* Considered separating the logs for withdrawal and deposit so that you did not have to record the default value (0.00). This would mean an extra set would be required to generate the statement in the correct order.