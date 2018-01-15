describe FragmentLibrary do
  describe '#four_by_four' do
    it 'should return the coordinates for a four by four square' do
      expect(subject.four_by_four(1,1)).to eq [
        [1,1], [2,1], [3,1], [4,1], [1,2], [4,2],
        [1,3], [4,3], [1,4], [2,4], [3,4], [4,4]
      ]
    end
  end
end
