describe GenerateMove do
  let(:passed_hash) { {field_height: 5, field_width: 5} }
  let(:generate_move) { described_class.new(passed_hash) }

  describe '#random_move' do
    it 'returns pass' do
      expect(generate_move).to receive(:generate_action).and_return 'pass'
      expect(generate_move.random_move).to eq 'pass'
    end

    it 'returns a pair of coordinates as a string' do
      expect(generate_move).to receive(:generate_action).and_return 'kill'
      expect(generate_move).to receive(:rand).with(passed_hash[:field_height]).and_return 3
      expect(generate_move).to receive(:rand).with(passed_hash[:field_width]).and_return 2
      expect(generate_move.random_move).to eq '3,2'
    end

    it 'returns three pairs of string coordinates in an array' do
      dummy_kill_coordinates = ['4,1', '1,2', '3,0']
      expect(generate_move).to receive(:generate_action).and_return 'birth'
      3.times do
        expect(generate_move).to receive(:assign_coordinates).and_return dummy_kill_coordinates.shift
      end
      expect(generate_move.random_move).to eq ['4,1', '1,2', '3,0']
    end
  end
end
