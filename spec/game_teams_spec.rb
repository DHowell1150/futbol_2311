require 'spec_helper'

RSpec.describe GameTeam do
  before do
    @game_team_info = { 
                    game_id: 2012030221, team_id: 3, hoa: "away", result: "LOSS", head_coach: "John Tortorella", goals: 2, shots: 8, 
                    tackles: 44
                    }
      
    @game_team = GameTeam.new(@game_team_info)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@game_team).to be_a(GameTeam)
    end

    it 'has a game_id' do
      expect(@game_team.game_id).to eq(2012030221)
    end

    it 'has a team_id' do
      expect(@game_team.team_id).to eq(3)
    end

    it 'can return if a team is home or away' do
      expect(@game_team.hoa).to eq("away")
    end

    it 'can return game result' do
      expect(@game_team.result).to eq("LOSS")
    end

    it 'returns a teams head coach' do
      expect(@game_team.head_coach).to eq("John Tortorella")
    end

    it 'returns goals by specific team in a game' do
      expect(@game_team.goals).to eq(2)
    end

    it 'returns how many shots a team attempted' do
      expect(@game_team.shots).to eq(8)
    end

    it 'returns how many tackles a team made' do
      expect(@game_team.tackles).to eq(44)
    end
  end

  describe '#get_season_from_game_id' do
    it 'will give you the season id for a game based off of the game_id' do
      expect(@game_team.get_season_from_game_id).to eq(20122013)
    end
  end
end




