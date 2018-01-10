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

  describe '#update_state' do
    it 'returns the string it receives' do
      expect(subject.update_state('string')).to eq ('string')
    end
  end

  describe '#format string' do
    it 'turns a line into an array of strings' do
      subject.format_string('input line string')
      expect(subject.line[0]).to eq('input')
    end
  end

  

end
