describe LegalMove do

  before(:each) do
    @field = [['1','0','0'], ['.','.','1'], ['1','0','.']]
    @moves = ['1,2', '3,1', '2,1']
  end

  describe '#filled_cell' do
    it 'returns true if the cell is occupied by either player' do
      expect(subject.filled_cell('2,3', @field)).to be(true)
    end
    it 'returns false if the cell is unoccupied' do
      expect(subject.filled_cell('1,2', @field)).to be(false)
    end
  end

  describe '#owned_cell' do
    it 'returns true if the cell is owned by the specified player' do
      expect(subject.owned_cell('0', '2,1', @field)).to be(true)
    end
    it 'returns false if the cell is not owned by the specified player' do
      expect(subject.owned_cell('1', '2,1', @field)).to be(false)
    end
  end

  describe '#legal_kill' do
    it 'returns true if the cell is occupied' do
      expect(subject.legal_kill('2,3', @field)).to be(true)
    end
  end

  describe '#legal_birth' do
    it 'returns true if the kill cells are owned and the birth cell is free' do
      expect(subject.legal_birth('0', @moves, @field)).to be(true)
    end
  end

  describe 'legal?' do
    it 'should return true' do
      expect(subject.legal?('2,3', @field)).to eq true
    end
    it 'should return false'do
      expect(subject.legal?('3,3', @field)).to eq false
    end
    it 'should return true' do
      expect(subject.legal?('pass', @field)).to eq true
    end
    it 'should return true' do
      expect(subject.legal?(@moves, @field, '0')).to eq true
    end
    it 'should return false' do
      expect(subject.legal?(['1,2', '3,1', '3,3'], @field, '0')).to eq false
    end
  end
end
