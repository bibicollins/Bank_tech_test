require 'statement_printer'
require 'spec_helper'
# credit deposit
# debit withdraw
describe StatementPrinter do
  let(:statement) { StatementPrinter.new }
  let(:time) { test_time }
  let(:transactions) { [transaction] }
  let(:transaction) { double(:transaction, date: test_time, debit: ' ', credit: 10.05, balance: 30.05) }
  describe '#print_header' do
    it 'prints the header of the statement summary' do
      expect { statement.print_header }.to output("date      || credit || debit    || balance\n").to_stdout
    end
  end
  describe '#format_transactions' do
    it 'formats the transactions' do
      expect { statement.format_transactions(transactions) }.to output("#{test_time}||  10.05 ||      || 30.05 \n").to_stdout
    end
  end
  describe '#print_statement' do
    it 'Prints the summary of the transaction' do
      expect { statement.print_statement(transactions) }.to output("date      || credit || debit    || balance\n#{test_time}||  10.05 ||      || 30.05 \n").to_stdout
    end
  end
end
