require 'statement_printer'
require 'spec_helper'
# credit deposit
# debit withdraw
describe StatementPrinter do
  let(:statement) { StatementPrinter.new }
  let(:transactions) { [transaction] }
  let(:transaction) { double(:transaction, :date => "2018-08-15", :debit => ' ', :credit => 10, :balance => 30)}
  describe '#print_header' do
    it 'prints the header of the statement summary' do
      expect { statement.print_header }.to output("date      || credit || debit || balance\n").to_stdout
    end
  end
  describe '#format_transactions' do
    it 'formats the transactions' do
      expect { statement.format_transactions(transactions) }.to output("2018-08-15||   10   ||      || 30 \n").to_stdout
    end
  end
end
