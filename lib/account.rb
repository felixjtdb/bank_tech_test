# A class for a bank account, it allows deposits and withdrawls.
class Account
  attr_reader :balance
  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end
end
