# frozen_string_literal: true

require 'transaction'

describe Transaction do

  subject { Transaction.new(balance: 0) }

  describe '#initialize' do
    it 'is created with todays date' do
      expect(subject.date).to eq Date.today
    end

    it 'has a default credit amount of 0' do
      expect(subject.credit).to eq 0
    end

    it 'has a default debit amount of 0' do
      expect(subject.debit).to eq 0
    end

    it 'calculated the balance based upon the transaction' do
      example_transaction = Transaction.new(balance: 5, debit: 2)
      expect(example_transaction.balance).to eq 3
    end
  end
end
