describe PatternTemplate do
  describe '#next_gen_square' do
    it 'should return an array of all variations that will lead to a square on the next generation' do
      expect(subject.next_gen_square(1,1)).to eq [
        [[1, 1], [2, 1], [1, 2]],
        [[1, 1], [2, 1], [2, 2]],
        [[1, 1], [0, 2], [1, 2]],
        [[1, 1], [1, 2], [2, 2]]
      ]
    end
  end
end
