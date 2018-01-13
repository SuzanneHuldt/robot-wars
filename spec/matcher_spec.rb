describe Matcher do
  describe '#find' do
    it 'a pattern being found should return true' do
      board = [
        ['.','.','.','.'],
        ['.','1','1','.'],
        ['.','1','.','.'],
        ['.','.','.','.']
      ]
      expect(subject.find(board)).to eq true
    end
    it 'no pattern found should return false' do
      board = [
        ['.','.','.','.'],
        ['.','1','1','.'],
        ['.','.','.','.'],
        ['.','.','.','.']
      ]
      expect(subject.find(board)).to eq false
    end
  end
end
