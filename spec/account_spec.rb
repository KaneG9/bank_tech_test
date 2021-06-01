require 'account'

describe Account do
  let(:transaction_log_double ) { double :transaction_log } 
  subject { Account.new(Account::DEFAULT_BALANCE, transaction_log_double)}

  describe "#balance" do
    it 'can show the balance' do
      expect(subject.balance).to eq 0
    end
  end

  describe "#deposit" do
    before do
      allow(transaction_log_double).to receive(:deposit)
    end

    it 'can add money to the account' do
      expect { subject.deposit(10) }.to change { subject.balance }.by 10
    end

    it "adds the transaction to the log" do
      expect(transaction_log_double).to receive(:deposit)
      subject.deposit(10)
    end

    it 'cannot add negative money' do
      expect { subject.deposit(-5) }.to raise_error("You cannot deposit a negative value.")
    end
  end

  describe "#withdraw" do
    before do
      allow(transaction_log_double).to receive(:deposit)
      allow(transaction_log_double).to receive(:withdraw)
    end

    it 'can removes money to the account' do
      subject.deposit 20
      expect { subject.withdraw(10) }.to change { subject.balance }.by -10
    end

    it "adds the transaction to the log" do
      expect(transaction_log_double).to receive(:withdraw)
      subject.deposit(10)
      subject.withdraw(10)
    end

    xit 'cannot add negative money' do

    end

    xit "cannot withdraw more money than you have" do
      
    end
  end

  describe "#view_statement" do
    before do
      allow(transaction_log_double).to receive(:deposit)
      allow(transaction_log_double).to receive(:withdraw)
    end
    
    it "prints a statement" do
      allow(transaction_log_double).to receive(:log).and_return([[Date.today, "50.00", "0.00", "50.00"],[Date.today, "0.00", "20.00", "30.00"],[Date.today, "0.00", "5.00", "25.00"]])
      subject.deposit 50
      subject.withdraw 20
      subject.withdraw 5
      expect(subject.view_statement).to eq("date || credit || debit || balance\n#{Date.today} || 50.00 || 0.00 || 50.00\n#{Date.today} || 0.00 || 20.00 || 30.00\n#{Date.today} || 0.00 || 5.00 || 25.00")      
    end
  end
end