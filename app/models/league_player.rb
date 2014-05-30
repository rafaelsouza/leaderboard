class LeaguePlayer < ActiveRecord::Base
  belongs_to :league
  belongs_to :player

  validates_presence_of :league_id, :player_id, :score

  scope :by_league, ->(id) { where(league_id: id) }
  scope :by_player, ->(id) { where(player_id: id) }

  def self.top(league,items)
    Rails.cache.fetch(league_cache_key(league.id)) do
      league.league_players.order("score DESC").includes(:player)
    end.first(items)
  end

  def self.league_cache_key(id)
    "#{by_league(id).maximum(:updated_at)}-#{by_league(id).count}"
  end

  def self.cached_league_player(league_id,player_id)
    Rails.cache.fetch("LeaguePlayer/#{league_id}/#{player_id}") do
      by_league(league_id).by_player(player_id).first
    end
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

  def to_elo
    @elo ||= Elo::Player.new(rating: score)
  end

  def update_score(elo_player)
    self.update_attributes!(score: elo_player.rating)
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
