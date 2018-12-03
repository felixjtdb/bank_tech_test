# A class for a bank account, it allows deposits and withdrawls.
class Account
  attr_reader :balance, :deposits

  def initialize
    @balance = 0
    @deposits = []
  end

  def deposit(amount)
    @balance += amount
    @deposits.push({:amount => amount, :timestamp => Time.now})
  end
end
