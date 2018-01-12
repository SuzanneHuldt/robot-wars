describe GenerateMove do
  let(:passed_hash) { {field_height: 5, field_width: 5} }
  let(:generate_move) { described_class.new(passed_hash) }

  describe '#initialize' do
    it 'is passed a hash value' do
      expect(generate_move.game_state).to be_an_instance_of Hash
    end
  end

  describe '#random_move' do
    it 'returns pass' do
      expect(generate_move).to receive(:generate_action).and_return('pass')
      expect(generate_move.random_move).to eq('pass')
    end
  end

  describe '#generate_action' do
    it 'assigns a move_type property' do
      expect(generate_move.generate_action).to eq('pass').or eq('kill')
        .or eq('birth')
    end
  end

  describe '#assign_kill_coordinates' do
    it 'assigns random coordinates' do
      coordinates = generate_move.assign_kill_coordinates.split(',')
      coordinates.each do |coordinate|
        expect((coordinate.to_i <= 5) && (coordinate.to_i >= 0)).to eq(true)
      end
    end
  end

  describe '#assign_birth_coordinates' do
    it 'assigns three pairs of random coordinates' do
      coordinates = generate_move.assign_birth_coordinates.join(',').split(',')
      coordinates.each do |coordinate|
        expect((coordinate.to_i <= 5) && (coordinate.to_i >= 0)).to eq(true)
      end
    end
  end
end
