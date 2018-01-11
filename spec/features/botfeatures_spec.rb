describe Bot do
  let(:state) { State.new }
  let(:action) { Action.new }

  describe '#update' do
    xit 'calls update on action for an ACTION string' do
      expect(subject.update(['action', 'move', '2'])).to be true
    end
    it 'calls update on state for any other string' do
      subject.update(['update', 'player1', 'move', 'pass'])
      expect(subject.state.info[:opponent].last_move).to eq 'pass'
    end
  end

  describe '#format string' do
    it 'returns the input string as an array' do
      expect(subject.format_string('settings move 2')).to be_instance_of Array
    end
  end
end
