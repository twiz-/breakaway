# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'date'
#
# #setup randomness
#
dates_for_games      = [Date.today + 10,Date.today + 15,Date.today + 12,Date.today - 1,Date.today + 12,Date.today + 4,Date.today - 3 , ]
opponenets_for_games = ["Milan", "Real Madrid", "Real Sociedad", "Getafe", "Manchester City", "Danville Mustangs", "Inter", "Fulham"]
time_for_games       = ["9:00AM", "10:00AM", "11:00AM", "12:00PM", "1:00PM", "2:00PM", "3:00PM", "4:30PM", "2:30PM", "7:00PM"]
location_for_games   = ["San Siro", "Wembley", "Cherry Island", "Toon Village", "Grayland Stadium", "Craven Cottage", "Bernabeu", "Whitehart Lane", "Emirates"]

#
 kaka    = ClubPlayer.create({first_name: "Ricardo", last_name: "Kaka", profile_name: "kaka", password: "password1", password_confirmation: "password1", email: "thing@example.com", grad_year: "2016", position: "Midfielder", club_team: "AC Milan",gender: "male", formation: "4-3-3", confirmed_at: Time.now})
 dani    = ClubPlayer.create({first_name: "Dani", last_name: "Alves", profile_name: "d_alves", password: "password1", password_confirmation: "password1", email: "thing1@example.com", grad_year: "2015", position: "Defender", club_team: "Barcelona",gender: "male", formation: "4-3-3", confirmed_at: Time.now})
 zlatan  = ClubPlayer.create({first_name: "Zlatan", last_name: "Ibrahimovic", profile_name: "zlatan", password: "password1", password_confirmation: "password1", email: "thing2@example.com", grad_year: "2017", position: "Striker", club_team: "PSG",gender: "male", formation: "4-3-2-1", confirmed_at: Time.now})
 pirlo   = ClubPlayer.create({first_name: "Andrea", last_name: "Pirlo", profile_name: "pass_out", password: "password1", password_confirmation: "password1", email: "thing3@example.com", grad_year: "2017", position: "Midfielder", club_team: "Juventus", gender: "male", formation: "4-4-2", confirmed_at: Time.now})
 brek    = ClubPlayer.create({first_name: "Brek", last_name: "Shea", profile_name: "bshea", password: "password1", password_confirmation: "password1", email: "thing4@example.com", grad_year: "2018", position: "Midfielder", club_team: "Stoke", gender: "male", formation: "4-5-1", confirmed_at: Time.now})
 higuain = ClubPlayer.create({first_name: "Gonzala", last_name: "Higuan", profile_name: "gonzo", password: "password1", password_confirmation: "password1", email: "thing5@example.com", grad_year: "2015", position: "Striker", club_team: "Napoli",gender: "male", formation: "4-4-2", confirmed_at: Time.now})
 gatuso  = ClubPlayer.create({first_name: "Generro", last_name: "Gatuso", profile_name: "pitbull", password: "password1", password_confirmation: "password1", email: "thing6@example.com", grad_year: "2018", position: "Midfielder", club_team: "AC Milan",gender: "male", formation: "4-4-2", confirmed_at: Time.now})
 wayne   = ClubPlayer.create({first_name: "Wayne", last_name: "Rooney", profile_name: "r10", password: "password1", password_confirmation: "password1", email: "thing7@example.com", grad_year: "2015", position: "Striker", club_team: "Manchester United",gender: "male", formation: "4-3-1-2", confirmed_at: Time.now})
 vincent = ClubPlayer.create({first_name: "Vincent", last_name: "Kompany", profile_name: "vkomp", password: "password1", password_confirmation: "password1", email: "thing8@example.com", grad_year: "2016", position: "Defender", club_team: "Manchester City",gender: "male", formation: "4-4-2", confirmed_at: Time.now})
 cesc    = ClubPlayer.create({first_name: "Cesc", last_name: "Fabregas", profile_name: "fab10", password: "password1", password_confirmation: "password1", email: "thing9@example.com", grad_year: "2017", position: "Midfielder", club_team: "Chelsea",gender: "male", formation: "4-4-2", confirmed_at: Time.now})

kaka.listings.create(video: "https://www.youtube.com/watch?v=xNkDcfhJFB4", description: "My performance at Surf Cup Nov 28th-30th", club_player_id: kaka.id)
kaka.listings.create(video: "https://www.youtube.com/watch?v=P4TQ2HHL56k", description: "Vs Nomads league game in August", club_player_id: kaka.id)
kaka.listings.create(video: "https://www.youtube.com/watch?v=Hbd5VO1YDJc", description: "My games at Dallas Cup", club_player_id: kaka.id)

8.times do
  kaka.games.create(scheduled_date: dates_for_games.sample, opponent: opponenets_for_games.sample, location: location_for_games.sample, scheduled_time: time_for_games.sample, club_player_id: kaka.id)  
end

 dani.listings.create(video: "https://www.youtube.com/watch?v=DSZmTJ_NFuI", description: "Group play at copa america against uruguay", club_player_id: dani.id)
 dani.listings.create(video: "https://www.youtube.com/watch?v=x9G6jSHA8G4", description: "My best goals from the season", club_player_id: dani.id)
 dani.listings.create(video: "https://www.youtube.com/watch?v=t42aKnd5opo", description: "A display of my ability to get up and down the line", club_player_id: dani.id)
 
 8.times do
   dani.games.create(scheduled_date: dates_for_games.sample, opponent: opponenets_for_games.sample, location: location_for_games.sample, scheduled_time: time_for_games.sample, club_player_id: dani.id)  
 end

zlatan.listings.create(video: "https://www.youtube.com/watch?v=zhmL_007Igw", description: "My home game against St Etienne", club_player_id: zlatan.id)
zlatan.listings.create(video: "https://www.youtube.com/watch?v=YpVxgEt_T20", description: "League cup final against Nantes", club_player_id: zlatan.id)
zlatan.listings.create(video: "https://www.youtube.com/watch?v=XYan94S8slU", description: "My goals through the first ten games", club_player_id: zlatan.id)

8.times do
  zlatan.games.create(scheduled_date: dates_for_games.sample, opponent: opponenets_for_games.sample, location: location_for_games.sample, scheduled_time: time_for_games.sample, club_player_id: zlatan.id)  
end

pirlo.listings.create(video: "https://www.youtube.com/watch?v=H7dl3Y_6d-4", description: "All my free kicks from this year", club_player_id: pirlo.id)
pirlo.listings.create(video: "https://www.youtube.com/watch?v=jqChBpuP8ao", description: "Playing center Mid against Milan", club_player_id: pirlo.id)
pirlo.listings.create(video: "https://www.youtube.com/watch?v=M99HmXSAnDw", description: "Italian Cup final 1 goal 2 assists", club_player_id: pirlo.id)

8.times do
  pirlo.games.create(scheduled_date: dates_for_games.sample, opponent: opponenets_for_games.sample, location: location_for_games.sample, scheduled_time: time_for_games.sample, club_player_id: pirlo.id)  
end

brek.listings.create(video: "https://www.youtube.com/watch?v=wbuHYKdFMUc", description: "My goal against Cost Rica in the final minutes", club_player_id: brek.id)
brek.listings.create(video: "https://www.youtube.com/watch?v=qD0C3MyJrPY", description: "My defensive work rate this season", club_player_id: brek.id)
brek.listings.create(video: "https://www.youtube.com/watch?v=ywp3DhbMn9U", description: "Highlights through the first 10 games;7 goals, 8 assists", club_player_id: brek.id)

8.times do
  brek.games.create(scheduled_date: dates_for_games.sample, opponent: opponenets_for_games.sample, location: location_for_games.sample, scheduled_time: time_for_games.sample, club_player_id: brek.id)  
end

higuain.listings.create(video: "https://www.youtube.com/watch?v=eCEl_6N3bmk", description: "My free kicks from around the edge of 18", club_player_id: higuain.id)
higuain.listings.create(video: "https://www.youtube.com/watch?v=Oqq1hsFQc18", description: "Defensive corner kicks this year", club_player_id: higuain.id)
higuain.listings.create(video: "https://www.youtube.com/watch?v=3nd-KOcRPOg", description: "Playing center mid against Napoli", club_player_id: higuain.id)

8.times do
  higuain.games.create(scheduled_date: dates_for_games.sample, opponent: opponenets_for_games.sample, location: location_for_games.sample, scheduled_time: time_for_games.sample, club_player_id: higuain.id)  
end

gatuso.listings.create(video: "https://www.youtube.com/watch?v=-LVV34wfuM4", description: "My best tackles from the first games of the season", club_player_id: gatuso.id)
gatuso.listings.create(video: "https://www.youtube.com/watch?v=DiEEKruHucw", description: "Three takeaways at crucials times in our first home match", club_player_id: gatuso.id)
gatuso.listings.create(video: "https://www.youtube.com/watch?v=zz0sOpV3dXI", description: "Me holding the shape of our back line", club_player_id: gatuso.id)

8.times do
  gatuso.games.create(scheduled_date: dates_for_games.sample, opponent: opponenets_for_games.sample, location: location_for_games.sample, scheduled_time: time_for_games.sample, club_player_id: gatuso.id)  
end

wayne.listings.create(video: "https://www.youtube.com/watch?v=DCmDYMDZVWE", description: "Offensive highlights from highscool season. 16 goals 14 assists", club_player_id: wayne.id)
wayne.listings.create(video: "https://www.youtube.com/watch?v=3krCImbggkU", description: "Seminfinal against Getafe in the FA Cup final", club_player_id: wayne.id)
wayne.listings.create(video: "https://www.youtube.com/watch?v=Rm5pJ732qDk", description: "Playing holding cm down a man against Fulham", club_player_id: wayne.id)

8.times do
  wayne.games.create(scheduled_date: dates_for_games.sample, opponent: opponenets_for_games.sample, location: location_for_games.sample, scheduled_time: time_for_games.sample, club_player_id: wayne.id)  
end

vincent.listings.create(video: "https://www.youtube.com/watch?v=7NWcz8dKduQ", description: "Clearing everything that comes in my general direction", club_player_id: vincent.id)
vincent.listings.create(video: "https://www.youtube.com/watch?v=zIWS5Wfi6c8", description: "Breaking up plays in the FA cup final", club_player_id: vincent.id)
vincent.listings.create(video: "https://www.youtube.com/watch?v=fQId7EktS9c", description: "Full game highlights against US in World Cup", club_player_id: vincent.id)

8.times do
  vincent.games.create(scheduled_date: dates_for_games.sample, opponent: opponenets_for_games.sample, location: location_for_games.sample, scheduled_time: time_for_games.sample, club_player_id: vincent.id)  
end

cesc.listings.create(video: "https://www.youtube.com/watch?v=yxW5nG0fxKY", description: "Playing the false 9 in a game against New Castle", club_player_id: cesc.id)
cesc.listings.create(video: "https://www.youtube.com/watch?v=440qkxGopjc", description: "Ever single goal while at Barcelona", club_player_id: cesc.id)
cesc.listings.create(video: "https://www.youtube.com/watch?v=bnHsH3izZhI", description: "Highlights of my passes in the first 10 games of the season", club_player_id: cesc.id)

8.times do
  cesc.games.create(scheduled_date: dates_for_games.sample, opponent: opponenets_for_games.sample, location: location_for_games.sample, scheduled_time: time_for_games.sample, club_player_id: cesc.id)  
end
