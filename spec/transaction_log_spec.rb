require 'transaction_log'
describe TransactionLog do
   describe "#deposit" do
     it "adds an entry to the log" do
       subject.deposit(10, 10)
       expect(subject.log[0]).to eq [Date.today, "10.00", "0.00", "10.00"]
     end
   end

   describe "#withdraw" do
     it "adds an entry to the log" do
       subject.withdraw(20, 0)
       expect(subject.log[0]).to eq [Date.today, "0.00", "20.00", "0.00"]
     end
   end
end