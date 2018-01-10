require 'state/player'

describe Player do
  let(:player) { Player.new('Marvin', 50, 'pass') }

  describe '#initialize' do
    it 'should have a name property' do
      expect(player.name).to eq 'Marvin'
    end

    it 'should have a living_cells property' do
      expect(player.living_cells).to eq 50
    end

    it 'should have a last_move property' do
      expect(player.last_move).to eq 'pass'
    end
  end
end
