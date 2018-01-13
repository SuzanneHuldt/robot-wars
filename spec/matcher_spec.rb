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
      expect(subject.find(board)).to eq true
    end
  end
end
