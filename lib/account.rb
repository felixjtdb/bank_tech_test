require_relative 'transaction'

# Account class
class Account
  attr_reader :balance, :interactions
  HEADER = 'DATE || CREDIT || DEBIT || BALANCE'.freeze

  def initialize
    @balance = 0.00
    @interactions = []
  end

  def interact(action, amount)
    @interactions << Transaction.create(action, amount, @balance)
    @balance = interactions.last[:balance]
  end

  def statement
    puts HEADER
    @interactions.reverse_each do |x|
      puts "#{x[:timestamp]} || #{x[:credit]} || #{x[:debit]} || #{x[:balance]}"
    end
  end
end
