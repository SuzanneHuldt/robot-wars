describe KillTemplate do
  describe '#next_gen_square' do
    it 'returns an array of all variations of a next_gen_square' do
      expect(subject.next_gen_square(1,1)).to eq [
        [[1, 1], [2, 1], [1, 2]],
        [[1, 1], [2, 1], [2, 2]],
        [[1, 1], [0, 2], [1, 2]],
        [[1, 1], [1, 2], [2, 2]]
      ]
    end
  end

  describe '#block' do
    it 'returns an array of all variations of tub pattern' do
      expect(subject.tub(1,1)).to eq [
        [[1,1],[0, 2], [2, 2], [1,3]]
      ]
    end
  end

  describe '#beehive' do
    it 'returns an array of all variations of beehive pattern' do
      expect(subject.beehive(1,1)).to eq [
        [[1, 1], [0, 2], [2, 2], [0, 3], [2, 3], [1, 4]],
        [[1, 1], [2, 1], [0, 2], [3, 2], [1, 3], [2, 3]]
      ]
    end
  end

  describe '#blinker' do
    it 'returns an array of all variations of blinker pattern' do
      expect(subject.blinker(1,1)).to eq [
        [[1, 1], [1, 2], [1, 3]],
        [[1, 1], [2, 1], [3, 1]]
      ]
    end
  end

  describe '#package' do
    it 'returns an array of all variations of package pattern' do
      expect(subject.package(1,1)).to eq [
        [[1, 1], [2, 1], [0, 2], [3, 2], [0, 3], [3, 3], [1, 4], [2, 4]]
      ]
    end
  end

  describe '#boat' do
    it 'returns an array of all variations of boat pattern' do
      expect(subject.boat(1,1)).to eq [
        [[1, 1], [2, 1], [1, 2], [3, 2], [2, 3]],
        [[1, 1], [2, 1], [0, 2], [2, 2], [1, 3]],
        [[1, 1], [0, 2], [2, 2], [1, 3], [2, 3]],
        [[1, 1], [0, 2], [2, 2], [0, 3], [1, 3]]
      ]
    end
  end
end
