# Transaction class
class Transaction
  attr_reader :debit, :credit, :balance, :timestamp

  def initialize(credit, debit, balance)
    @timestamp = Time.now
    @credit = credit
    @debit = debit
    @balance = balance
  end

  def self.create(action, amount, balance)
    case action
    when 'Deposit'
      balance += amount
      Transaction.new(amount, 0, balance)
    when 'Withdrawl'
      balance -= amount
      Transaction.new(0, amount, balance)
    else
      raise 'Unknown action'
    end
  end
end
