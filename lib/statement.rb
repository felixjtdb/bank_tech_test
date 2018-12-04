# Statement class
class Statement
  attr_reader :print_a

  def initialize(transactions)
    @print_a = generate_statement(transactions)
  end

  private

  def generate_statement(transactions)
    statement_string = "DATE || CREDIT || DEBIT || BALANCE\n"
    transactions.reverse_each do |transaction|
      formatted_time = transaction.timestamp
      formatted_credit = format('%.2f', transaction.credit)
      formatted_debit = format('%.2f', transaction.debit)
      formatted_balance = format('%.2f', transaction.balance)
      statement_string << "#{formatted_time} || #{formatted_credit} || #{formatted_debit} || #{formatted_balance}\n"
    end
    statement_string
  end
end
