# A class for a bank account, it allows deposits and withdrawls.
class Account
  attr_reader :balance, :interactions

  def initialize
    @balance = 0
    @interactions = []
  end

  def deposit(amount)
    @balance += amount
    @interactions.push({amount: amount, timestamp: Time.now, balance: @balance})
  end

  def withdrawl(amount)
    @balance -= amount
    @interactions.push({amount: amount, timestamp: Time.now, balance: @balance})
  end
end
