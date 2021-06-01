require_relative 'transaction_log'

class Account
  attr_reader :balance
  DEFAULT_BALANCE = 0
  def initialize(balance = DEFAULT_BALANCE, log = TransactionLog.new)
    @balance = balance
    @log = log
  end

  def deposit(amount)
    @balance += amount
    @log.deposit(amount, @balance)
  end

  def withdraw(amount)
    @balance -= amount
    @log.withdraw(amount, @balance)
  end


end