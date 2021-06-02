# frozen_string_literal: true

require_relative 'transaction_log'
require_relative 'printer'

class Account

  def initialize(transaction_log = TransactionLog.new)
    @transaction_log = transaction_log
  end

  def deposit(amount)
    raise 'You cannot deposit a negative value.' if amount.negative?

    @transaction_log.deposit(amount)
  end

  def withdraw(amount)
    raise 'You cannot withdraw a negative value.' if amount.negative?

    @transaction_log.withdraw(amount)
  end

  def view_statement
    Printer.view_statement(@transaction_log.log)
  end

  
end
