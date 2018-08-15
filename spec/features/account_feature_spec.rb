require './lib/account'
describe '#deposit' do
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
    expect { account.print_summary }.to output("date      || credit || debit || balance\n2018-08-15||   10   ||       || 30 \n2018-08-15||        ||  7   || 23 \n").to_stdout 
end
end
