# Account class, responsible for current state of account
class Account
  DEFAULT_BALANCE = 20
  MINIMUM_BALANCE = 0
  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def show_balance
    @balance
  end

  def withdraw(withdrawal_amount)
    @balance -= withdrawal_amount
  end

  def deposit(deposit_amount)
    @balance += deposit_amount
  end 
end
