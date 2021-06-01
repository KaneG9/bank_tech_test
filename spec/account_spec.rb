require 'account'

describe Account do
  describe "#balance" do
    it 'can show the balance' do
      expect(subject.balance).to eq 0
    end
  end
end