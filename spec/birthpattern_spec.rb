describe BirthPattern do


  before (:each) do
    @field_1 = [
      ['0','.','.','.','.'],['.','0','0','.','.'],['.','.','.','.','.'],['.','.','.','.','.'],
      ['.','.','.','.','.'],['1','.','.','.','.'],['.','0','0','.','.'],['.','.','.','.','.'],['.','.','.','.','.'],
      ['.','.','.','.','.']
    ]

    @field_2 = [
      ['0','.','1','.','.'],['.','1','1','.','.'],['1','.','.','.','.'],['.','.','.','.','.'],
      ['.','.','.','.','.'],['1','.','.','.','.'],['.','1','1','.','.'],['.','.','.','.','.'],['.','.','.','.','.'],
      ['.','.','.','.','.']
    ]

    @field_3= [
      ['0','0','0','.','.'],['.','1','1','.','.'],['1','.','.','.','.'],['.','.','.','.','.'],
      ['.','.','.','.','.'],['1','.','.','.','.'],['.','1','1','.','.'],['.','.','.','.','.'],['.','.','.','.','.'],
      ['.','.','.','.','.']
    ]
  end

  describe "#set start" do
    xit "sets a to the given element of the given subarray" do
      subject.set_start(@field_1,0,0)
      expect(subject.a).to eq('0')
    end
  end

  describe "#clear horizontal" do
    it "returns true if a's next three horizontal cells are empty" do
      expect(subject.clear_horizontal(@field_1,0,0)).to be(true)
    end
    it "returns false if a's next three horizontal cells are not" do
      expect(subject.clear_horizontal(@field_2,0,0)).to be(false)
    end
  end

  describe "#clear vertical" do
    it "returns true if a's next three vertical cells are empty" do
      expect(subject.clear_vertical(@field_1,0,0)).to be(true)
    end
    it "returns false if a's next three vertical cells are empty" do
      expect(subject.clear_vertical(@field_2,0,0)).to be(false)
    end
  end

  describe "#two consecutive" do
    it "returns true for two consecutive cells owned by player" do
      expect(subject.two_consecutive(@field_3,0,0)).to be(true)
    end
    it "returns true for two consecutive cells owned by player" do
      expect(subject.two_consecutive(@field_1,0,0)).to be(false)
    end
  end

  describe "#match" do
    it "returns true for the two cells pattern" do
      expect(subject.match_square(@field_1,0,0)).to be(true)
    end
    it "returns true for the two cells pattern" do
    expect(subject.match_square(@field_2,0,0)).to be(false)
  end
end
end
