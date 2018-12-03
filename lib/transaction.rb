# Transaction class
class Transaction
  def self.create(action, amount)
    case action
    when 'Deposit'
      { timestamp: Time.now.to_s, credit: amount, debit: nil }
    when 'Withdrawl'
      { timestamp: Time.now.to_s, credit: nil, debit: amount }
    else
      raise 'Unknown action'
    end
  end
end
