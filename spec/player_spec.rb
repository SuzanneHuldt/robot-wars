require 'state/player'

describe Player do
  let(:player) { Player.new('Marvin', 50) }

  describe '#initialize' do
    it 'should have a name property' do
      expect(player.name).to eq 'Marvin'
    end

    it 'should have a living_cells property' do
      expect(player.living_cells).to eq 50
    end
  end
end
