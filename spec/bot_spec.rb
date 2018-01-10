describe Bot do
  before do
    $stdin = StringIO.new('Test String')
  end

  after do
    $stdin = STDIN
  end

  describe '#receive' do
    it 'should receive and output a string' do
      expect(subject.receive).to eq 'Test String'
    end
  end

  describe '#return_string' do
    it 'should return a string to the engine' do
      subject.receive
      expect { subject.return_string }.to output 'Test String'.to_stdout
    end
  end
end
