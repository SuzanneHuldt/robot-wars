describe Pattern do
  describe '#build' do
    it 'should return an array of all variations of the pattern' do
      pattern = Pattern.new(1, 1)
      expect(pattern.build).to eq [
        [[1, 1], [2, 1], [1, 2]],
        [[1, 1], [2, 1], [2, 2]],
        [[1, 1], [0, 2], [1, 2]],
        [[1, 1], [1, 2], [2, 2]]
      ]
    end
  end
end
