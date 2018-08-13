require 'account'

describe Account do
  account = Account.new
  it { is_expected.to respond_to :show_balance }

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
end
