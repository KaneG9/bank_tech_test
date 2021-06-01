require_relative 'transaction_log'

class Account
  attr_reader :balance
  DEFAULT_BALANCE = 0
  
  def initialize(balance = DEFAULT_BALANCE, transaction_log = TransactionLog.new)
    @balance = balance
    @transaction_log = transaction_log
  end

  def deposit(amount)
    raise "You cannot deposit a negative value." if amount < 0
    @balance += amount
    @transaction_log.deposit(amount, @balance)
  end

  def withdraw(amount)
    raise "You cannot withdraw a negative value." if amount < 0
    raise "You do not have enough money to withdraw this amount." if amount > balance
    @balance -= amount
    @transaction_log.withdraw(amount, @balance)
  end

  def view_statement
    statement = "date || credit || debit || balance\n"
    @transaction_log.log.each do |transaction|
      statement += transaction.join(" || ") + "\n"
    end
    return statement.strip
  end
end