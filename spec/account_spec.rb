require 'account'

describe Account do
  let(:account) { Account.new }
  it { is_expected.to respond_to :show_balance }
  it { is_expected.to respond_to :withdraw }
  it { is_expected.to respond_to :deposit }

  describe 'initialize' do
    it 'intializes with a default balance of 20' do
      expect(account.show_balance).to eq Account::DEFAULT_BALANCE
    end
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
  end
  describe '#deposit' do
    it 'deposits a give amount to the account balance' do
      account.deposit(10)
      expect(account.show_balance).to eq 30
    end
  end
end
