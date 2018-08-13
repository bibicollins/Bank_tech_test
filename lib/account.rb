require './error'
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
    raise MyError, 'Not enough money' unless withdrawal_amount < @balance
    @balance -= withdrawal_amount
    transaction = []
    transaction << - withdrawal_amount
    transaction << @balance
    @transactions << transaction
  end

  def deposit(deposit_amount)
    @balance += deposit_amount
    transaction = []
    transaction << deposit_amount
    transaction << @balance
    @transactions << transaction
  end

  def statement
    @transactions
  end
end
