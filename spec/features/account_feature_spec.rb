require './lib/account'
require './spec/spec_helper'
describe '#deposit' do
  let(:time) { test_time }
  it 'should add money to the account balance' do
    account = Account.new
    account.deposit(10)
    expect(account.instance_variable_get('@balance')).to eq 30
  end
end
describe '#withdraw' do
  it 'should take money from the account balance' do
    account = Account.new
    account.withdraw(10)
    expect(account.instance_variable_get('@balance')).to eq 10
  end
end
describe '#print_summary' do
  it 'should print a summary of all of the transactions' do
    account = Account.new
    account.deposit(10)
    account.withdraw(7)
    expect { account.print_summary }.to output("date      || credit || debit    || balance\n05-09-2018||  10.00 ||          || 30.00 \n05-09-2018||        ||  7.00   || 23.00 \n").to_stdout
  end
end
