require_relative 'transaction'
require_relative 'statement'

# Account class
class Account
  attr_reader :balance, :transactions

  def initialize
    @balance = 0.00
    @transactions = []
  end

  def view_balance
    format('%.2f', @balance)
  end

  def interact(action, amount, transaction_class = Transaction)
    @transactions << transaction_class.create(action, amount, @balance)
    @balance = transactions.last.balance.to_i
  end

  def statement
    print Statement.new(@transactions).print_a
  end
end
