describe Action do
  describe '#generate_move' do
    it 'should be an instance of String' do
      stub_const("Action::MOVES", ['pass'])
      expect(subject.generate_move({})).to eq 'pass'
    end
  end
end
