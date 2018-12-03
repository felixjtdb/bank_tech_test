require_relative 'transaction'

# Account class
class Account
  attr_reader :balance, :interactions
  HEADER = 'DATE || CREDIT || DEBIT || BALANCE'.freeze

  def initialize
    @balance = 0.00
    @interactions = []
  end

  def view_balance
    format('%.2f', @balance)
  end

  def interact(action, amount)
    @interactions << Transaction.create(action, amount, @balance)
    @balance = interactions.last[:balance].to_i
  end

  def statement
    puts HEADER
    @interactions.reverse_each do |x|
      formatted_credit = format('%.2f', x[:credit])
      formatted_debit = format('%.2f', x[:debit])
      formatted_balance = format('%.2f', x[:balance])
      puts "#{x[:timestamp]} || #{formatted_credit} || #{formatted_debit} || #{formatted_balance}"
    end
  end
end
