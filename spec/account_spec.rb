require 'account.rb'
# testing class Account
describe Account do
  let(:a) { described_class.new }
  let(:transaction) { double(balance: 0, credit: 10, debit: 10, timestamp: 'test_time') }

  before do
    allow(Transaction).to receive(:create).and_return(transaction)
  end

  it 'An account has a balance' do
    expect(a.view_balance).to eq '0.00'
  end

  describe 'deposit' do
    it 'A deposit increases the balance' do
      allow(Transaction).to receive(:create).and_return(double(balance: 10))
      a.interact('Deposit', 10)
      expect(a.view_balance).to eq '10.00'
    end

    it 'deposits have a timestamp when created' do
      a.interact('Deposit', 10)
      expect(a.transactions.last.timestamp).to eq 'test_time'
    end
  end

  describe 'withdrawl' do
    it 'withdrawls decrease the balance' do
      allow(Transaction).to receive(:create).and_return(double(balance: -10))
      expect { a.interact('Withdrawl', 10) }.to change { a.balance }.by(-10)
    end

    it 'withdrawls have a timestamp' do
      a.interact('Withdrawl', 10)
      expect(a.transactions.last.timestamp).to eq 'test_time'
    end
  end

  describe 'statement' do
    it 'statement calls Statement.new' do
      expect_any_instance_of(Statement).to receive(:print_a)
      a.statement
    end
  end
end
