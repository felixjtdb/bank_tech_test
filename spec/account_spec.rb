require 'account.rb'
# testing class Account
describe Account do
  let(:a) { described_class.new }
  let(:deposit_transaction) { double(balance: 10, credit: 10, debit: 0, timestamp: 'test_time') }
  let(:withdrawl_transaction) { double(balance: -10, credit: 0, debit: 10, timestamp: 'test_time') }
  let(:trans_class_w) { double(create: withdrawl_transaction) }
  let(:trans_class_d) { double(create: deposit_transaction) }

  it 'An account has a balance' do
    expect(a.view_balance).to eq '0.00'
  end

  describe 'deposit' do
    it 'A deposit increases the balance' do
      a.interact('Deposit', 10, trans_class_d)
      expect(a.view_balance).to eq '10.00'
    end

    it 'deposits have a timestamp when created' do
      a.interact('Deposit', 10, trans_class_d)
      expect(a.transactions.last.timestamp).to eq 'test_time'
    end
  end

  describe 'withdrawl' do
    it 'withdrawls decrease the balance' do
      expect { a.interact('Withdrawl', 10, trans_class_w) }.to change { a.balance }.by(-10)
    end

    it 'withdrawls have a timestamp' do
      a.interact('Withdrawl', 10, trans_class_w)
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
