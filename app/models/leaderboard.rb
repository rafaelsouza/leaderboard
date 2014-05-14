class Leaderboard

  attr_reader :league

  def initialize(league)
    @league = league
  end

  def top(n=10)
    Rails
  end

  def calculate
    ELO_MAPPER[league.id] ||= {}
    #map all the players
    league.players.each do |player|
      ELO_MAPPER[league.id][player.id] ||= Elo::Player.new
    end

    #inject the games
    league.games.each do |game|
      home = ELO_MAPPER[league.id][game.home_player_id]
      away = ELO_MAPPER[league.id][game.away_player_id]
      
      if game.home_won? 
        home.wins_from(away)
      elsif game.away_won?
        home.loses_from(away)
      else #tie
        home.plays_draw(away)
      end
        
    end
  end
end