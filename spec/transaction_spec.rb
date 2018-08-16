require 'transaction'
require 'spec_helper'
describe Transaction do
  let(:transaction) { Transaction.new("#{test_time}", 'debit', 'credit', 'balance') }
  let(:time) { test_time }
  it 'stores the date of any transaction' do
    expect(transaction.instance_variable_get('@date')).to eq time
  end
end
