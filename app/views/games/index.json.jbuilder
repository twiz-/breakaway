json.array!(@games) do |game|
  json.extract! game, :id, :scheduled_date, :opponent, :location, :user_id
  json.url game_url(game, format: :json)
end
