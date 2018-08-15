class Transaction
  def initialize(date, debit, credit, balance)
    @debit = debit
    @credit = credit
    @date = date
    @balance = balance
  end
end
