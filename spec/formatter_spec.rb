describe Formatter do
  describe '#format_input' do
    it 'returns an array and formats an array of the input_string' do
      subject.format_input('input line string')
      expect(subject.line[0]).to eq('input')
    end
  end
end
