class Game < ActiveRecord::Base
  belongs_to :league
  belongs_to :home_player, class_name: "Player", foreign_key: "home_player_id"
  belongs_to :away_player, class_name: "Player", foreign_key: "away_player_id"

  validates_presence_of :home_player_id, :away_player_id, :home_score, :away_score
  validates_numericality_of :home_score, :away_score

  scope :by_player, ->(id) { where("home_player_id = :id OR away_player_id = :id",{id:id}) }
  scope :by_league, ->(id) { where(league_id:id) }
  scope :by_league_player, ->(league_player) { by_league(league_player.league_id).by_player(league_player.player_id) }

  validates_presence_of :league_id, :home_player_id, :away_player_id, :home_score, :away_score

  def self.games_for(league)
    cache_keßy = "games-#{league.id}-#{by_league(league.id).maximum(:updated_at)}-#{by_league(league.id).count}"
    Rails.cache.fetch(cache_key) { by_league(league.id) }
  end

  def self.cached_by_league_player(league_player)
    cache_key = "#{by_league_player(league_player)}-#{by_league_player(league_player).maximum(:updated_at)}-#{by_league_player(league_player).count}"
    Rails.cache.fetch(cache_key) {by_league_player(league_player).to_a}
  end

  def home_won?
    home_score > away_score
  end

  def away_won?
    away_score > home_score
  end

  def tie?
    home_score == away_score
  end

  def home_lost?
    home_score < away_score
  end

  def away_lost?
    away_score < home_score
  end
end

# == Schema Information
#
# Table name: games
#
#  id             :integer          not null, primary key
#  home_player_id :integer
#  away_player_id :integer
#  home_score     :decimal(10, 2)
#  away_score     :decimal(10, 2)
#  created_at     :datetime
#  updated_at     :datetime
#
