describe FragmentLibrary do
  describe '#four_by_four' do
    it 'should return the coordinates for a four by four square' do
      expect(subject.four_by_four(1,1)).to eq [
        [1,1], [2,1], [3,1], [4,1],
        [1,2],               [4,2],
        [1,3],               [4,3],
        [1,4], [2,4], [3,4], [4,4]
      ]
    end
  end

  describe '#five_by_six' do
    it 'should return the coordinates for a five by six square' do
      expect(subject.five_by_six(1,1)).to eq [
        [1,1], [2,1], [3,1], [4,1], [5,1],
        [1,2],                      [5,2],
        [1,3],                      [5,3],
        [1,4],                      [5,4],
        [1,5],                      [5,5],
        [1,6], [2,6], [3,6], [4,6], [5,6]
      ]
    end
  end

  describe '#six_by_five' do
    it 'should return the coordinates for a five by six square' do
      expect(subject.six_by_five(1,1)).to eq [
        [1,1], [2,1], [3,1], [4,1], [5,1], [6,1],
        [1,2],                             [6,2],
        [1,3],                             [6,3],
        [1,4],                             [6,4],
        [1,5], [2,5], [3,5], [4,5], [5,5], [6,5],
      ]
    end
  end
end
