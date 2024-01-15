require 'csv'

class GameFactory

  attr_reader :file_path, :games
  
  def initialize(file_path)
    @file_path = file_path
    @games = []
  end

  def create_games
    CSV.foreach(@file_path, headers: true, header_converters: :symbol) do |row|
      game_info = {}
      game_info[:game_id] = row[:game_id].to_i
      game_info[:season] = row[:season].to_i
      game_info[:away_team_id] = row[:away_team_id].to_i
      game_info[:home_team_id] = row[:home_team_id].to_i
      game_info[:away_goals] = row[:away_goals].to_i
      game_info[:home_goals] = row[:home_goals].to_i

      @games << Game.new(game_info)
    end
    @games
  end

  def total_score
    @games.map do |game|
      game.away_goals + game.home_goals
    end
  end

  def count_of_goals(season_id)
    season_goals = 0
    @games.each do |game|
      if game.season == season_id
        season_goals += game.away_goals + game.home_goals
      end
      season_goals
    end
    season_goals
  end

  def count_of_games
    @games.count
  end

  def season_games(season)
    @games.count { |game| game.season == season }
  end
  
  def games_by_team(team_id)
    @games.find_all do |game|
      game.away_team_id == team_id || game.home_team_id == team_id
    end
  end

  def goals_by_team(team_id)
    goals = []
    @games.each do |game|
      if game.away_team_id == team_id 
        goals << game.away_goals
      elsif game.home_team_id == team_id
        goals << game.home_goals
      end
    end
    goals
  end

  def avg_goals_by_team(team_id)
    goals_by_team(team_id).sum.to_f / goals_by_team(team_id).count.to_f
  end
end
