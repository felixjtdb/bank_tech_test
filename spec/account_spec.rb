require 'account.rb'
# testing class Account
describe Account do
  let(:a) { described_class.new }

  it 'An account has a balance' do
    expect(a.balance).to eq 0
  end

  describe 'deposit' do
    it 'A deposit increases the balance' do
      a.deposit(10)
      expect(a.balance).to eq 10
    end

    it 'deposits have a timestamp when created' do
      allow(Time).to receive(:now).and_return('pass')
      a.deposit(20)
      expect(a.interactions.last[:timestamp]).to eq 'pass'
    end
  end

  describe 'withdrawl' do
    it 'withdrawls decrease the balance' do
      expect { a.withdrawl(10) }.to change { a.balance }.by(-10)
    end
    it 'withdrawls decrease the balance' do
      allow(Time).to receive(:now).and_return('correct')
      a.withdrawl(10)
      expect(a.interactions.last[:timestamp]).to eq 'correct'
    end
  end

  describe 'statement' do
    it 'statement prints all interactions' do
      x = described_class.new
      allow(Time).to receive(:now).and_return('testing123')
      x.deposit(9)
      header = "DATE || CREDIT || DEBIT || BALANCE\n"
      expected_statement = "testing123 || 9 ||  || 9\n"
      expect { x.statement }.to output(header + expected_statement).to_stdout
    end
  end
end
