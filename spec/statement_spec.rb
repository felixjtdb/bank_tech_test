require 'statement'

describe Statement do
  let(:aa_transaction) { double(timestamp: 'test_time', credit: 99, debit: 99, balance: 1000) }
  let(:statement) { described_class.new([aa_transaction]) }

  it 'can take a transaction' do
    expect(Statement).to respond_to(:new).with(1).arguments
  end

  it 'generate statement returns a formateed statement' do
    header = "DATE || CREDIT || DEBIT || BALANCE\n"
    transaction_formatted = "test_time || 99.00 || 99.00 || 1000.00\n"
    expect(statement.print_a).to eq(header + transaction_formatted)
  end
end
