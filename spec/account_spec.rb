require 'account'

describe Account do
  account = Account.new
  it { is_expected.to respond_to :show_balance }

end
