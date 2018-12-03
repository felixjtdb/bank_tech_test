require_relative 'transaction'

# Account class
class Account
  attr_reader :balance, :interactions
  HEADER = 'DATE || CREDIT || DEBIT || BALANCE'.freeze

  def initialize
    @balance = 0.00
    @interactions = []
  end

  def view_balance()
    return '%.2f' % @balance
  end

  def interact(action, amount)
    @interactions << Transaction.create(action, amount, @balance)
    @balance = interactions.last[:balance].to_i
  end

  def statement
    puts HEADER
    @interactions.reverse_each do |x|
      puts "#{x[:timestamp]} || #{'%.2f' % x[:credit]} || #{'%.2f' % x[:debit]} || #{'%.2f' % x[:balance]}"
    end
  end
end
