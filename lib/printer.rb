class Printer
  def self.view_statement(transaction_log)
    balance = 0
    statement = ""
    transaction_log.each do |transaction|
      balance += (transaction.credit - transaction.debit)
      statement = "#{transaction.date} || #{format_data(transaction.credit)} || #{format_data(transaction.debit)} || #{format_data(balance)}\n" + statement
    end
    statement = "date || credit || debit || balance\n" + statement
    statement.strip
  end

  private

  def self.format_data(data)
    return '' if data == 0
    format('%.2f', data)
  end
end