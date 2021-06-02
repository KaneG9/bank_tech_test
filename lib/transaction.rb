# frozen_string_literal: true

require 'date'

class Transaction
  attr_reader :date, :credit, :debit, :balance

  DEFAULT_TRANSACTION_VALUE = 0
  DEFAULT_BALANCE = 0

  def initialize(date: Date.today, credit: DEFAULT_TRANSACTION_VALUE, debit: DEFAULT_TRANSACTION_VALUE, old_balance:)
    @date = date
    @credit = credit
    @debit = debit
    @balance = old_balance + credit - debit
  end
end
