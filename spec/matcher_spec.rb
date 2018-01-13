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
  end
end
