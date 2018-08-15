# Statement printer is responsible for formatting the statement.
class StatementPrinter
  def print_statement(transactions)
    print_header
    format_transactions(transactions)
  end

  def print_header
    puts 'date      || credit || debit || balance'
  end

  def format_transactions(transactions)
    transactions.each do |x|
      puts "#{x.date}||   #{x.credit}   ||  #{x.debit}   || #{x.balance} "
    end
  end
end
