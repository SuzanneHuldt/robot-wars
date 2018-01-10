
describe Bot do

let(:state) {State.new}
let(:action) {Action.new}


describe '#update' do
  it 'calls update on action for an ACTION string' do
    expect(subject.update(['action', 'move', '2'])).to be (true)
  end
  it 'calls update on state for any other string' do
    expect(subject.update(['settings', 'move', '2'])).to be (true)

  end
end

end
