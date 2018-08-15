require 'statement_printer'

describe StatementPrinter do
  let(:statement) { StatmentPrinter.new }
  describe '#print_header' do
    it 'prints the header of the statement summary' do
      expect(statement.print_header).to eq 'date || credit || debit || balance \n'
    end
  end
end
