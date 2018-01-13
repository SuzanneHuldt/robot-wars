describe Matcher do
  describe '#find' do
    it 'should return true' do
      board = [
        ['.','.','.','.'],
        ['.','1','1','.'],
        ['.','1','.','.'],
        ['.','.','.','.']
      ]
      pattern = [
        [
          ['1', '1'],
          ['.','1']
        ],
        [
          ['1','1'],
          ['1','.']
        ],
        [
          ['1','.'],
          ['1','1']
        ],
        [
          ['.','1'],
          ['1','1']
        ]
      ]
      expect(subject.find(board, pattern)).to eq true
    end
  end
end
