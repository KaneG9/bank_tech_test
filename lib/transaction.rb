# frozen_string_literal: true

require 'date'

class Transaction
  attr_reader :date, :credit, :debit, :new_balance

  DEFAULT_TRANSACTION_VALUE = 0
  DEFAULT_BALANCE = 0

  def initialize(date: Date.today, credit: DEFAULT_TRANSACTION_VALUE, debit: DEFAULT_TRANSACTION_VALUE, new_balance: DEFAULT_BALANCE)
    @date = date
    @credit = credit
    @debit = debit
    @new_balance = new_balance
  end
end
