require "account.rb"

describe Account do
  let(:a) {described_class.new}

  it 'An account has a balance' do
    expect(a.balance).to eq 0
  end

  describe "deposit" do
    it 'A deposit can be made' do
      a.deposit(10)
      expect(a.balance).to eq 10
    end

    it "deposits have a timestamp when created" do
      allow(Time).to receive(:now).and_return("pass")
      a.deposit(20)
      expect(a.deposits.last[:timestamp]).to eq "pass"
    end
  end
end
