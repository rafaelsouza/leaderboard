class Leaderboard
  attr_reader :league
  def initialize(league)
    @league = league
  end

  def top(items=10)
    performance_ratings.sort_by{|p| p.score }.first(items)
  end

  def cache_key
    "#{games.maximum(:updated_at)}-#{games.count}"
  end

  private 
  def games
    @games ||= league.games
  end

  def performance_ratings
    @player_scores ||= league.league_players.map(&:performance_ratings)
  end

end