
class ActionMock
  def update(formatted_string)
    true
  end
end


describe Bot do
  before do
    $stdin = StringIO.new("Test String")
  end

  after do
    $stdin = STDIN
  end

  describe '#receive_string' do
    it 'receives and output a string' do
      expect(subject.receive_string).to eq("Test String")
    end
  end

  describe '#output_string' do
    it 'returns a string to the engine' do
      subject.receive_string
      expect{ subject.output_string }.to output("Test String").to_stdout
    end
  end



  describe '#format string' do
    it 'turns a line into an array of strings' do
      subject.format_string('input line string')
      expect(subject.line[0]).to eq('input')
    end
  end

  describe '#action test' do
    it 'returns true for an ACTION line' do
      expect(subject.action_test(['action', 'move', '2'])).to be (true)
    end
  end

end
