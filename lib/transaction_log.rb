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
    @log << @transaction_class.new(credit: amount)
  end

  def withdraw(amount)
    @log << @transaction_class.new(debit: amount)
  end

  def current_balance 
    if @log.empty?
      0
    else
      @log.reduce(0) do |sum, transaction|
        sum + transaction.credit - transaction.debit
      end
    end
  end
end
