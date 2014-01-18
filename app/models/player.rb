class Player < User
  
  has_many :listings
  has_many :games
end
