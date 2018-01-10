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
    xit 'returns the string it receives' do
      expect(subject.update_state('string')).to eq ('string')
    end
    it 'adds state and update strings to the state array' do
      expect{subject.update_state(['update', 'game', 'round', 'int'])}.to change {subject.state.length}.by(1)
    end
    it 'adds action strings to the action array' do
      expect{subject.update_state(['action', 'move', '2'])}.to change {subject.action.length}.by(1)
    end
    it 'does not add action to state' do
      expect{subject.update_state(['action', 'move', '2'])}.to change {subject.state.length}.by(0)
    end
    it 'does not add state to action' do
      expect{subject.update_state(['update', 'game', 'round', 'int'])}.to change {subject.action.length}.by(0)
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
