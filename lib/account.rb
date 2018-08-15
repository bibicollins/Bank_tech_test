require './error'
require_relative 'transaction'
require_relative 'statement_printer'
# Account class, responsible for current state of account
class Account
  DEFAULT_BALANCE = 20
  MINIMUM_BALANCE = 0
  def initialize(transaction = Transaction,
                 printed_statement = StatementPrinter.new)
    @balance = DEFAULT_BALANCE
    @transaction = transaction
    @printed_statement = printed_statement
    @transactions = []
  end

  def show_balance
    @balance
  end

  def withdraw(withdrawal_amount)
    raise MyError, 'Not enough money' unless withdrawal_amount < @balance
    @balance -= withdrawal_amount
    with = @transaction.new(date, withdrawal_amount, '  ', @balance)
    store_transaction(with)
  end

  def deposit(deposit_amount)
    @balance += deposit_amount
    dep = @transaction.new(date, '  ', deposit_amount, @balance)
    store_transaction(dep)
  end

  def date
    t = Time.now
    t.to_s
    t.strftime '%Y-%m-%d'
  end

  def store_transaction(transaction)
    @transactions << transaction
  end

  def print_summary
    @printed_statement.print_statement(@transactions)
  end
end
