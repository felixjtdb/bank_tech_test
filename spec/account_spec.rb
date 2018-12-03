require "account.rb"

describe Account do
  it 'An account has a balance' do
    a = described_class.new
    expect(a.balance).to eq 0
  end

  it 'A deposit can be made' do
    a = described_class.new
    a.deposit(10)
    expect(a.balance).to eq 10
  end
end
