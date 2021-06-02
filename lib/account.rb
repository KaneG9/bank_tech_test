# frozen_string_literal: true

require_relative 'transaction_log'
require_relative 'printer'

class Account
  attr_reader :balance

  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE, transaction_log = TransactionLog.new)
    @balance = balance
    @transaction_log = transaction_log
  end

  def deposit(amount)
    raise 'You cannot deposit a negative value.' if amount.negative?

    @balance += amount
    @transaction_log.deposit(amount, @balance)
  end

  def withdraw(amount)
    raise 'You cannot withdraw a negative value.' if amount.negative?
    raise 'You do not have enough money to withdraw this amount.' if amount > balance

    @balance -= amount
    @transaction_log.withdraw(amount, @balance)
  end

  def view_statement
    Printer.view_statement(@transaction_log.log)
  end

  
end
