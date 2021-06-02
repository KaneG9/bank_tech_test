# frozen_string_literal: true

require 'account'

describe 'feature test' do
  subject { Account.new }

  it 'returns correct statement for given set of transactions' do
    subject.deposit 1000
    subject.deposit 2000
    subject.withdraw 1500
    expect(subject.view_statement).to eq "date || credit || debit || balance\n#{Date.today} ||  || 1500.00 || 1500.00\n#{Date.today} || 2000.00 ||  || 3000.00\n#{Date.today} || 1000.00 ||  || 1000.00"
  end
end
