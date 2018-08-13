require 'account'

describe Account do
  account = Account.new
  it { is_expected.to respond_to :show_balance }

  describe 'initialize' do
    it 'intializes with a default balance of 20' do
      expect(account.show_balance).to eq Account::DEFAULT_BALANCE
    end
  end
end
