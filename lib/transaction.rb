# Transaction class
class Transaction
  def self.create(action, amount, balance)
    case action
    when 'Deposit'
      balance += amount
      { timestamp: Time.now, credit: amount, debit: 0, balance: balance }
    when 'Withdrawl'
      balance -= amount
      { timestamp: Time.now, credit: 0, debit: amount, balance: balance }
    else
      raise 'Unknown action'
    end
  end
end
