require './error'
require_relative 'transaction'
require_relative 'statement_printer'
# Account class, responsible for current state of account
class Account
  attr_reader :transaction
  DEFAULT_BALANCE = 20
  MINIMUM_BALANCE = 0
  def initialize(transaction = Transaction,
                 printed_statement = StatementPrinter.new)
    @balance = DEFAULT_BALANCE
    @transaction = transaction
    @printed_statement = printed_statement
    @transactions = []
  end

  def withdraw(withdrawal_amount)
    raise MyError, 'Not enough money' unless withdrawal_amount < @balance
    @balance -= withdrawal_amount
    withdrawal_result = @transaction.new(Time.now.strftime('%d-%m-%Y'), format('%.2f',
                      withdrawal_amount), '     ', format('%.2f', @balance))
    store_transaction(withdrawal_result)
  end

  def deposit(deposit_amount)
    @balance += deposit_amount
    deposit_result = @transaction.new(Time.now.strftime('%d-%m-%Y'), '     ', format('%.2f', deposit_amount), format('%.2f', @balance))
    store_transaction(deposit_result)
  end

  def print_summary
    @printed_statement.print_statement(@transactions)
  end

  private

  def store_transaction(transaction)
    @transactions << transaction
  end
end
