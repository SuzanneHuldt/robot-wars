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

  describe "#find birth" do
    it "returns true for birth pattern" do
    expect(subject.find_birth(@field_1)).to be(true)
  end
  it "returns true for birth pattern" do
  expect(subject.find_birth(@field_2)).to be(false)
end
end
end
