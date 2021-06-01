# frozen_string_literal: true

require 'date'

class TransactionLog
  attr_reader :log

  DEFAULT_AMOUNT = '0.00'

  def initialize
    @log = [] # contains each transaction in the form [Date, Credit amount, Debit amount, New balance]
  end

  def deposit(amount, new_balance)
    @log << [Date.today, format('%.2f', amount), DEFAULT_AMOUNT, format('%.2f', new_balance)]
  end

  def withdraw(amount, new_balance)
    @log << [Date.today, DEFAULT_AMOUNT, format('%.2f', amount), format('%.2f', new_balance)]
  end
end
