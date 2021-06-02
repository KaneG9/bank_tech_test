# frozen_string_literal: true

require 'account'

describe Account do
  let(:transaction_log_double) { double :transaction_log }
  subject { Account.new(transaction_log_double) }

  before do
    allow(transaction_log_double).to receive(:deposit)
    allow(transaction_log_double).to receive(:withdraw)
  end

  describe '#deposit' do

    it 'adds the transaction to the log' do
      expect(transaction_log_double).to receive(:deposit)
      subject.deposit(10)
    end

    it 'cannot add negative money' do
      expect { subject.deposit(-5) }.to raise_error('You cannot deposit a negative value.')
    end
  end

  describe '#withdraw' do
    it 'adds the transaction to the log' do
      expect(transaction_log_double).to receive(:withdraw)
      subject.deposit(10)
      subject.withdraw(10)
    end

    it 'cannot add negative money' do
      expect { subject.withdraw(-5) }.to raise_error('You cannot withdraw a negative value.')
    end
  end

  describe '#view_statement' do
    it 'retrieves the log from the transaction log' do
      allow(transaction_log_double).to receive(:log).and_return []
      expect(transaction_log_double).to receive(:log)
      subject.view_statement
    end
  end
end
