# frozen_string_literal: true

class Printer
  STATEMENT_HEADER = "date || credit || debit || balance\n"

  def self.view_statement(transaction_log)
    balance, statement = 0, ''
    transaction_log.each do |transaction|
      balance += (transaction.credit - transaction.debit)
      statement = "#{transaction.date} || #{format_data(transaction.credit)} || #{format_data(transaction.debit)} || #{format_data(balance)}\n" + statement
    end
    (STATEMENT_HEADER + statement).strip
  end

  def self.format_data(data)
    return '' if data.zero?

    format('%.2f', data)
  end
end
