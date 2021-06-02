# frozen_string_literal: true

require_relative 'transaction_log'
require_relative 'printer'

class Account

  def initialize(transaction_log: TransactionLog.new, printer_class: Printer )
    @transaction_log = transaction_log
    @printer_class = printer_class
  end

  def deposit(amount)
    raise 'You cannot deposit a negative value.' if amount.negative?

    @transaction_log.deposit(amount)
  end

  def withdraw(amount)
    raise 'You cannot withdraw a negative value.' if amount.negative?
    raise 'You do not have enough money to withdraw this amount.' if amount > @transaction_log.current_balance

    @transaction_log.withdraw(amount)
  end

  def view_statement
    @printer_class.view_statement(@transaction_log.log)
  end

  
end
