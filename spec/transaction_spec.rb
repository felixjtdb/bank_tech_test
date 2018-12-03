require 'transaction'

describe Transaction do
  deposit_ten = { timestamp: 'stubbed_time', credit: 10, debit: nil, balance: 10 }
  withdrawl_ten = { timestamp: 'stubbed_time', credit: nil, debit: 10, balance: 90 }

  before(:each) do
    allow(Time).to receive(:now).and_return 'stubbed_time'
  end

  it 'takes an action and an amount' do
    expect(described_class).to respond_to(:create).with(3).arguments
  end

  it 'deposits return a hash with a credit value' do
    expect(Transaction.create('Deposit', 10, 0)).to eq(deposit_ten)
  end

  it 'withdrawls return a hash with a debit value' do
    expect(described_class.create('Withdrawl', 10, 100)).to eq(withdrawl_ten)
  end
end
