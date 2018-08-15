require './error'
require_relative 'transaction'
require_relative 'statement_printer'
# Account class, responsible for current state of account
class Account
  DEFAULT_BALANCE = 20
  MINIMUM_BALANCE = 0
  def initialize(transaction = Transaction)
    @balance = DEFAULT_BALANCE
    # @credit = []
    # @debit = []
    @transaction = transaction
  end

  def show_balance
    @balance
  end

  def withdraw(withdrawal_amount)
    raise MyError, 'Not enough money' unless withdrawal_amount < @balance
    @balance -= withdrawal_amount
    @debit =  withdrawal_amount
    @credit = ' '
    @transaction.new(date, withdrawal_amount, '', @balance)
  end

  def deposit(deposit_amount)
    @balance += deposit_amount
    @debit = ' '
    @credit = deposit_amount
    @transaction.new(date, '', deposit_amount, @balance)
  end

  def date
    t = Time.now
    t.to_s
    t.strftime "%Y-%m-%d"
  end
end
