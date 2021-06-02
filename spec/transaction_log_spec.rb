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
      subject.deposit(10)
    end

    it 'adds new transaction to log' do
      subject.deposit(10)
      expect(subject.log[0]).to eq transaction_double
    end
  end

  describe '#withdraw' do
    before do
      allow(transaction_double).to receive(:credit).and_return(20)
      allow(transaction_double).to receive(:debit).and_return(10)
    end

    it 'creates a new transaction' do
      subject.deposit(20)
      expect(transaction_double).to receive(:new)
      subject.withdraw(10)
    end

    it 'adds new transaction to log' do
      subject.deposit(20)
      subject.withdraw(10)
      expect(subject.log[1]).to eq transaction_double
    end
  end
end
