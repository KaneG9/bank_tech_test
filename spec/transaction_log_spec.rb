# frozen_string_literal: true

require 'transaction_log'
describe TransactionLog do
  let(:transaction_double) { double :transaction }
  subject { TransactionLog.new(transaction_double) }
  
  before do
    allow(transaction_double).to receive(:new).and_return(transaction_double)
  end

  describe '#deposit' do
    it 'creates a new transaction' do
      expect(transaction_double).to receive(:new)
      subject.deposit(10, 10)
    end

    it 'adds new transaction to log' do
      subject.deposit(10, 10)
      expect(subject.log[0]).to eq transaction_double
    end
  end

  describe '#withdraw' do
    it 'creates a new transaction' do
      expect(transaction_double).to receive(:new)
      subject.withdraw(10, 10)
    end

    it 'adds new transaction to log' do
      subject.withdraw(10, 10)
      expect(subject.log[0]).to eq transaction_double
    end
  end
end
