describe LegalMove do

  before do
    @field = [['1','0','0'], ['.','.','1'], ['1','0','.']]
    @moves = ['1,2', '3,1', '2,1']
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
