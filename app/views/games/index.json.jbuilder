json.array!(@games) do |game|
  json.extract! game, :id, :player_home_id, :player_away_id, :home_score, :home_score, :away_score, :away_score
  json.url game_url(game, format: :json)
end
