describe Matcher do
  describe '#find' do
    it 'a pattern being found should return the coordinates of the pattern' do
      board = [
        ['.','.','.','.'],
        ['.','1','1','.'],
        ['.','1','.','.'],
        ['.','.','.','.']
      ]
      expect(subject.find(board)).to eq [[1, 1], [1, 2], [2, 1]]
    end
    it 'no pattern found should return \'No matches\'' do
      board = [
        ['.','.','.','.'],
        ['.','1','1','.'],
        ['.','.','.','.'],
        ['.','.','.','.']
      ]
      expect(subject.find(board)).to eq 'No matches'
    end
  end
end
