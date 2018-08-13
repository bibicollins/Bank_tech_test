# Account class, responsible for current state of account
class Account
  DEFAULT_BALANCE = 20
  MINIMUM_BALANCE = 0
  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @transactions = []
  end

  def show_balance
    @balance
  end

  def withdraw(withdrawal_amount)
    @balance -= withdrawal_amount
    @transactions << - withdrawal_amount
    @transactions << @balance
  end

  def deposit(deposit_amount)
    @balance += deposit_amount
    @transactions << deposit_amount
    @transactions << @balance
  end

  def statement
    @transactions
  end
end
