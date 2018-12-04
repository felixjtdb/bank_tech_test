require_relative 'transaction'

# Account class
class Account
  attr_reader :balance, :transactions
  HEADER = 'DATE || CREDIT || DEBIT || BALANCE'.freeze

  def initialize
    @balance = 0.00
    @transactions = []
  end

  def view_balance
    format('%.2f', @balance)
  end

  def interact(action, amount)
    @transactions << Transaction.create(action, amount, @balance)
    @balance = transactions.last.balance.to_i
  end

  def statement
    puts HEADER
    @transactions.reverse_each do |transaction|
      formatted_time = transaction.timestamp[0..10]
      formatted_credit = format('%.2f', transaction.credit)
      formatted_debit = format('%.2f', transaction.debit)
      formatted_balance = format('%.2f', transaction.balance)
      puts "#{formatted_time} || #{formatted_credit} || #{formatted_debit} || #{formatted_balance}"
    end
  end
end
