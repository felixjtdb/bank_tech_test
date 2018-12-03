# Transaction class
class Transaction
  def self.create(action, amount, balance)
    case action
    when 'Deposit'
      balance += amount
      { timestamp: Time.now.to_s, credit: amount, debit: nil, balance: balance }
    when 'Withdrawl'
      balance -= amount
      { timestamp: Time.now.to_s, credit: nil, debit: amount, balance: balance }
    else
      raise 'Unknown action'
    end
  end
end
