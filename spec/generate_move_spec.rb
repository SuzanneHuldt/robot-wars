describe GenerateMove do
  let(:passed_hash) { {} }
  let(:generate_move) { described_class.new(passed_hash) }

  describe '#initialize' do
    it 'is passed a hash value' do
      expect(generate_move.game_state).to be_an_instance_of Hash
    end
  end

  describe '#generate_move' do
    it 'assigns a move_type property' do
      expect(generate_move.generate).to eq('pass').or eq('kill').or eq('birth')
    end
  end
end
