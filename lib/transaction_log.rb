require 'date'

class TransactionLog
  attr_reader :log
  
  def initialize
    @log = [] #contains each transaction in the form [Date, Credit amount, Debit amount, New balance]
  end

  def deposit(amount, new_balance)
    @log << [Date.today, amount, 0, new_balance]
  end

  def withdraw(amount, new_balance)
    @log << [Date.today, 0, amount, new_balance]
  end
end