require 'spec_helper'

RSpec.describe Team do
  describe '#initialize' do

    before do
      @team_info = {team_id: 1, franchise_id: 23, team_name: "Atlanta United", abbreviation: "ATL", stadium: "Mercedes-Benz Stadium", link: "/api/v1/teams/1"}
      @team = Team.new(@team_info)
    end

    it 'exists' do

      expect(@team).to be_a(Team)

    end

    it 'has a team id' do

      expect(@team.team_id).to eq(1)
        
    end

    it 'has a team_name' do

      expect(@team.team_name).to eq("Atlanta United")

    end
  end
end
