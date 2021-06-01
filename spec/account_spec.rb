# frozen_string_literal: true

require 'account'

describe Account do
  let(:transaction_log_double) { double :transaction_log }
  subject { Account.new(Account::DEFAULT_BALANCE, transaction_log_double) }

  before do
    allow(transaction_log_double).to receive(:deposit)
    allow(transaction_log_double).to receive(:withdraw)
  end

  describe '#initialize' do
    it 'account balance defaults to 0' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'can add money to the account' do
      expect { subject.deposit(10) }.to change { subject.balance }.by 10
    end

    it 'adds the transaction to the log' do
      expect(transaction_log_double).to receive(:deposit)
      subject.deposit(10)
    end

    it 'cannot add negative money' do
      expect { subject.deposit(-5) }.to raise_error('You cannot deposit a negative value.')
    end
  end

  describe '#withdraw' do
    it 'can removes money to the account' do
      subject.deposit 20
      expect { subject.withdraw(10) }.to change { subject.balance }.by(-10)
    end

    it 'adds the transaction to the log' do
      expect(transaction_log_double).to receive(:withdraw)
      subject.deposit(10)
      subject.withdraw(10)
    end

    it 'cannot add negative money' do
      expect { subject.withdraw(-5) }.to raise_error('You cannot withdraw a negative value.')
    end

    it 'cannot withdraw more money than you have' do
      expect { subject.withdraw(5) }.to raise_error('You do not have enough money to withdraw this amount.')
    end
  end

  describe '#view_statement' do
    it 'prints a statement' do
      allow(transaction_log_double).to receive(:log).and_return([[Date.today, '50.00', '0.00', '50.00'],
                                                                 [Date.today, '0.00', '20.00', '30.00'],
                                                                 [Date.today, '0.00', '5.00', '25.00']])
      subject.deposit 50
      subject.withdraw 20
      subject.withdraw 5
      expect(subject.view_statement).to eq("date || credit || debit || balance\n#{Date.today} || 0.00 || 5.00 || 25.00\n#{Date.today} || 0.00 || 20.00 || 30.00\n#{Date.today} || 50.00 || 0.00 || 50.00")
    end
  end
end
