require_relative '../src/account'

describe Account do
  it "A deposit can be made" do
    a = Account.new
    a.deposit(10)
    expect(a.balance).to eq 10
  end
end
