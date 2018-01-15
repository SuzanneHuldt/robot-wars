describe Action do

    let(:birth) {BirthPattern.new}

    describe "#birth" do
      it "returns a birth move for formatting" do
        expect(subject.birthpattern.birth(field)).to be_instance_of(String)
      end
    end
end
