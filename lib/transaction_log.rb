# frozen_string_literal: true

require 'date'
require_relative 'transaction'

class TransactionLog
  attr_reader :log

  DEFAULT_AMOUNT = '0.00'

  def initialize(transaction = Transaction)
    @log = []
    @transaction = transaction
  end

  def deposit(amount, new_balance)
    @log << @transaction.new(credit: amount, new_balance: new_balance)
  end

  def withdraw(amount, new_balance)
    @log << @transaction.new(debit: amount, new_balance: new_balance)
  end
end
