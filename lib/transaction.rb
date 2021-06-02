# frozen_string_literal: true

require 'date'

class Transaction
  attr_reader :date, :credit, :debit

  DEFAULT_TRANSACTION_VALUE = 0

  def initialize(date: Date.today, credit: DEFAULT_TRANSACTION_VALUE, debit: DEFAULT_TRANSACTION_VALUE)
    @date = date
    @credit = credit
    @debit = debit
  end
end
