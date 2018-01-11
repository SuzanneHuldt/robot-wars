describe Action do
  describe '#generate_move' do
    it 'should return pass' do
      stub_const('Action::MOVES', ['pass'])
      expect(subject.generate_move({})).to eq 'pass'
    end
    it 'should return birth' do
      stub_const('Action::MOVES', ['birth'])
      expect(subject.generate_move({})).to eq 'birth'
    end
    it 'should return kill' do
      stub_const('Action::MOVES', ['kill'])
      expect(subject.generate_move({})).to eq 'kill'
    end
  end
end
