require 'formatter'

describe Formatter do
  describe '#format_input' do
    it 'returns an array and formats an array of the input_string' do
      input = 'input line string'
      expected_output = ['input', 'line', 'string']
      expect(subject.format_input(input)).to eq(expected_output)
    end

    it 'replaces comma with a space for player names input' do
      input = 'settings player_names player0,player1'
      expected_output = ['settings', 'player_names', 'player0', 'player1']
      expect(subject.format_input(input)).to eq(expected_output)
    end
    
    it 'removes commas for game board input' do
      input = 'update game board .,.,.,1,.,0'
      expected_output = ['update', 'game', 'board', '...1.0']
      expect(subject.format_input(input)).to eq(expected_output)
    end    
  end

  describe '#format_output' do
    it 'converts pass move into output string' do
      action = ['pass']
      expected_output = "pass\n"
      expect(subject.format_output(action)).to eq(expected_output)
    end

    it 'converts kill move into output string' do
      action = ['kill', '2,4']
      expected_output = "kill 2,4\n"
      expect(subject.format_output(action)).to eq(expected_output)
    end
    
    it 'removes commas for game board input' do
      action = ['birth', '2,4', '1,7', '20,45']
      expected_output = "birth 2,4 1,7 20,45\n"
      expect(subject.format_output(action)).to eq(expected_output)
    end    
  end
end
