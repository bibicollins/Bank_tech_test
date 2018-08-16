require 'account'
require './error'
require 'spec_helper'
# credit = deposit
# debit = withdraw
describe Account do
  let(:account) { Account.new(transaction_class, statement_printer) }
  let(:time) { test_time }
  let(:statement_printer) { double('StatementPrinter') }
  let(:transaction_class) { double('Transaction') }
  let(:transactions) { [:transaction] }
  let(:transaction) { double(:transaction, date: test_time, debit: ' ', credit: 10, balance: 30) }

  describe 'initialize' do
    it 'intializes with a default balance of 20' do
      expect(account.show_balance).to eq Account::DEFAULT_BALANCE
    end
    it 'stores the date of any transaction' do
      allow(transaction_class).to receive(:new).and_return(test_time.to_s, 10, '  ', 10)
      account.withdraw(10)
      expect(account.date).to eq time
    end
  end
  describe 'minimum balance' do
    it 'has a minimum balance of 0' do
      expect(Account::MINIMUM_BALANCE).to eq 0
    end
  end
  describe '#withdraw' do
    it 'withdraws a given amount from the account balance' do
      allow(transaction_class).to receive(:new).and_return('2018-08-16', ' ', 10, 30)
      account.withdraw(10)
      expect(account.show_balance).to eq 10
    end
    it 'raises an error if you try to withdraw more than available balance' do
      expect { account.withdraw(40) }.to raise_error('Not enough money')
      expect(account.show_balance).to eq 20
    end
  end
  describe '#deposit' do
    it 'deposits a give amount to the account balance' do
      allow(transaction_class).to receive(:new).and_return('2018-08-16', 10, '  ', 10)
      account.deposit(10)
      expect(account.show_balance).to eq 30
    end
  end
  describe '#print_summary' do
    it 'Prints the entire transaction summary' do
      allow(transaction_class).to receive(:new).and_return('2018-08-16', 10, '  ', 10)
      allow(statement_printer).to receive(:print_statement).and_return(transaction)
      expect(account.print_summary).to receive(:print_statement).with('2018-08-16', 10, '  ', 10)
      account.print_summary
    end
  end
end
