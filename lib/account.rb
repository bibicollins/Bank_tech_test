require './error'
# Account class, responsible for current state of account
class Account
  DEFAULT_BALANCE = 20
  MINIMUM_BALANCE = 0
  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @current_balance = []
    @date = []
    @credit = []
    @debit = []

  end

  def show_balance
    @balance
  end

  def withdraw(withdrawal_amount)
    raise MyError, 'Not enough money' unless withdrawal_amount < @balance
    @balance -= withdrawal_amount
    @date << date
    @debit <<  withdrawal_amount
    @current_balance << @balance
    @credit << ' '
  end

  def deposit(deposit_amount)
    @balance += deposit_amount
    @date << date
    @debit << ' '
    @current_balance << @balance
    @credit << deposit_amount
  end

private

  def date
    t = Time.now
    t.to_s
    t.strftime "%Y-%m-%d"
  end

end
