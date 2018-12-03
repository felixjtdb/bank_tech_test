# A class for a bank account, it allows deposits and withdrawls.
class Account
  attr_reader :balance, :interactions
  HEADER = "DATE || CREDIT || DEBIT || BALANCE"
  def initialize
    @balance = 0
    @interactions = []
  end

  def deposit(amount)
    @balance += amount
    @interactions.push({timestamp: Time.now.to_s, balance: @balance, credit: amount, debit: ""})
  end

  def withdrawl(amount)
    @balance -= amount
    @interactions.push({timestamp: Time.now.to_s, balance: @balance, credit: "", debit: amount})
  end

  def statement
    puts HEADER
    @interactions.reverse_each do |x|
      puts "#{x[:timestamp]} || #{x[:credit]} || #{x[:debit]} || #{x[:balance]}"
    end
  end
end
