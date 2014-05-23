class Leaderboard
  attr_reader :league
  def initialize(league)
    @league = league
  end

  def top(items=10)
    LeaguePlayer.top(league,items)
  end

  def cache_key
    "#{games.maximum(:updated_at)}-#{games.count}"
  end

  private 
  def games
    @games ||= league.games
  end

end