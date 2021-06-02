# frozen_string_literal: true

describe Printer do
  let(:transaction_mock_one) { double :transaction, credit: 1000, debit: 0, date: '20/12/2021' }
  let(:transaction_mock_two) { double :transaction, credit: 2000, debit: 0, date: '21/12/2021' }
  let(:transaction_mock_three) { double :transaction, credit: 0, debit: 1500, date: '25/12/2021' }

  describe '#view_statement' do
    it 'prints the correct statement for given transactions' do
      data = [transaction_mock_one, transaction_mock_two, transaction_mock_three]
      expect(Printer.view_statement(data)).to eq "date || credit || debit || balance\n25/12/2021 ||  || 1500.00 || 1500.00\n21/12/2021 || 2000.00 ||  || 3000.00\n20/12/2021 || 1000.00 ||  || 1000.00"
    end
  end
end
