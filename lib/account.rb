# Account class, responsible for current state of account
class Account
  DEFAULT_BALANCE = 20
  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def show_balance
    @balance
  end
end
