require 'statement_printer'
require 'spec_helper'
# credit deposit
# debit withdraw
describe StatementPrinter do
  let(:statement) { StatementPrinter.new }

  describe '#print_header' do
    it 'prints the header of the statement summary' do
      expect { statement.print_header }.to output("date      || credit || debit || balance\n").to_stdout
    end
  end
  describe '#format_transactions' do
    it 'formats the transactions' do
      
    end
  end
end
