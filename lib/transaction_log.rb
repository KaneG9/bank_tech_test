# frozen_string_literal: true

require 'date'
require_relative 'transaction'

class TransactionLog
  attr_reader :log

  def initialize(transaction_class = Transaction)
    @log = []
    @transaction_class = transaction_class
  end

  def deposit(amount)
    @log << @transaction_class.new(credit: amount, balance: current_balance)
  end

  def withdraw(amount)
    raise 'You do not have enough money to withdraw this amount.' if amount > current_balance

    new_balance = current_balance - amount
    @log << @transaction_class.new(debit: amount, balance: current_balance)
  end

  def current_balance 
    @log.last ? @log.last.balance : 0
  end
end
