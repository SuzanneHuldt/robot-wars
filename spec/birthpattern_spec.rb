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
  end

  describe "#set start" do
    it "sets a to the given element of the given subarray" do
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

end
