# frozen_string_literal: true

require 'account'

describe Account do
  let(:transaction_log_double) { double :transaction_log }
  let(:printer_double) { double :printer }
  subject { Account.new(printer_class: printer_double, transaction_log: transaction_log_double) }

  before do
    allow(transaction_log_double).to receive(:deposit)
    allow(transaction_log_double).to receive(:withdraw)
    allow(printer_double).to receive(:view_statement)
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
    before do
      allow(transaction_log_double).to receive(:log)
    end

    it 'retrieves the log from the transaction log' do
      expect(transaction_log_double).to receive(:log)
      subject.view_statement
    end

    it 'calls the printer to print the statement' do
      expect(printer_double).to receive(:view_statement)
      subject.view_statement
    end
  end
end
