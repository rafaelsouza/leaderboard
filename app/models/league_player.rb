class LeaguePlayer < ActiveRecord::Base
  belongs_to :league
  belongs_to :player

  validates_presence_of :league_id, :player_id

  def performance_rating
    ELO_MAPPER[league_id][player_id].rating
  end

  def home_games
    @home_games ||= games.select{|g| g.home_player_id == player_id}
  end

  def away_games
    @away_games ||= games.select{|g| g.away_player_id == player_id}
  end

  def games
    @games ||= Game.cached_by_league_player(self)
  end

  def wins
    home_games.select{|g| g.home_won? } | away_games.select{|g| g.away_won? }
  end

  def losses
    home_games.select{|g| g.home_lost? } | away_games.select{|g| g.away_lost? }
  end

  def ties
    games.select{|g| g.tie? }
  end
end

# == Schema Information
#
# Table name: league_players
#
#  id         :integer          not null, primary key
#  league_id  :integer
#  player_id  :integer
#  created_at :datetime
#  updated_at :datetime
#
