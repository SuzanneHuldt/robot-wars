describe State do
  describe '#update_info' do
    it 'sets timebank' do
      subject.update_info(['timebank', '500'])
      expect(subject.info[:timebank]).to eq 500
    end

    it 'sets time_per_move' do
      subject.update_info(['time_per_move', '100'])
      expect(subject.info[:time_per_move]).to eq 100
    end

    it 'sets your_botid' do
      subject.update_info(['your_botid', '0'])
      expect(subject.info[:your_botid]).to eq 0
    end

    it 'sets field_width' do
      subject.update_info(['field_width', '18'])
      expect(subject.info[:field_width]).to eq 18
    end

    it 'sets field_height' do
      subject.update_info(['field_height', '16'])
      expect(subject.info[:field_height]).to eq 16
    end

    it 'sets max_rounds' do
      subject.update_info(['max_rounds', '100'])
      expect(subject.info[:max_rounds]).to eq 100
    end

    it 'sets current round' do
      subject.update_info(['game', 'round', '5'])
      expect(subject.info[:round]).to eq 5
    end

    it 'sets field' do
      subject.update_info(['field_width', '2'])
      subject.update_info(['game', 'field', '1..0'])
      expect(subject.info[:field]).to eq [['1', '.'], ['.', '0']]
    end

    it 'sets your_bot' do
      subject.update_info(['your_bot', 'player0'])
      expect(subject.info[:your_bot]).to eq 'player0'
    end

    it 'sets my_living_cells' do
      subject.update_info(['your_bot', 'player0'])
      subject.update_info(['player0', 'living_cells', '50'])
      expect(subject.info[:me].living_cells).to eq 50
    end

    it 'sets opponent_living_cells' do
      subject.update_info(['your_bot', 'player0'])
      subject.update_info(['player1', 'living_cells', '50'])
      expect(subject.info[:opponent].living_cells).to eq 50
    end

    it 'sets a player\'s last_move' do
      subject.update_info(['your_bot', 'player0'])
      subject.update_info(['player1', 'move', 'pass'])
      expect(subject.info[:opponent].last_move).to eq 'pass'
    end

    it 'set\'s your bot\'s name' do
      subject.update_info(['player_names', 'player0', 'player1'])
      expect(subject.info[:me].name).to eq 'player0'
    end

    it 'set\'s opponent\'s name' do
      subject.update_info(['player_names', 'player0', 'player1'])
      expect(subject.info[:opponent].name).to eq 'player1'
    end
  end
end

