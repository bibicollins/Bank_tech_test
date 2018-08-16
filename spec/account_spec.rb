require 'account'
require './error'
require 'spec_helper'
# credit = deposit
# debit = withdraw
describe Account do
  let(:account) { Account.new }
  let(:time) { test_time }
  let(:@transactions) { [transaction] }
  let(:transaction) { double(:transaction, :date => "2019-05-15", :debit => ' ', :credit => 20, :balance => 30)}

  it { is_expected.to respond_to :show_balance }
  it { is_expected.to respond_to :withdraw }
  it { is_expected.to respond_to :deposit }
  it { is_expected.to respond_to :date }

  describe 'initialize' do
    it 'intializes with a default balance of 20' do
      expect(account.show_balance).to eq Account::DEFAULT_BALANCE
    end
    it 'stores the date of any transaction' do
      account.withdraw(10)
      expect(account.date).to eq time
    end
    # describe Transaction do
    #   let(:time) { test_time }
    #   it 'stores the date of any transaction' do
    #     account = double('Account')
    #     allow(account).to receive(:date).and_return("2018-08-15")
    #     expect(account.date).to eq time
    #   end
    # end
  end
  describe 'minimum balance' do
    it 'has a minimum balance of 0' do
      expect(Account::MINIMUM_BALANCE).to eq 0
    end
  end
  describe '#withdraw' do
    it 'withdraws a given amount from the account balance' do
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
      account.deposit(10)
      expect(account.show_balance).to eq 30
    end
  end
  # describe '#print_summary' do
  #   it 'Prints the entire transaction summary' do
  #
  #     ### expect .to be called. stub print_statement?
  #   end
  # end
  ### Think about what you need to stub or double here, multiple dependencies.
end
