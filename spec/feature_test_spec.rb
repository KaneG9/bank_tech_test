# frozen_string_literal: true

require 'account'

describe 'feature test' do
  subject { Account.new }

  it 'returns correct statement for given set of transactions' do
    allow(Date).to receive(:today).and_return("25/12/2021")
    subject.deposit 1000
    subject.deposit 2000
    subject.withdraw 1500
    expect(subject.view_statement).to eq "date || credit || debit || balance\n25/12/2021 ||  || 1500.00 || 1500.00\n25/12/2021 || 2000.00 ||  || 3000.00\n25/12/2021 || 1000.00 ||  || 1000.00"
  end
end
