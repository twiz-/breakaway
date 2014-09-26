class CollegeCoach < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  validates :email, format: {
         with: /.edu\z/,
         message: "Must use your current .edu school email address."
       }
       
  has_many :user_friendships
  has_many :friends, through: :user_friendships #, class_name: 'ClubPlayer'
  
  def friend_already?(player)
    !friendship(player).blank?
  end
  
  def friendship(player)
    user_friendships.where(friend_id: player.id).first
  end
  
  def future_favorite_games
    query = ["SELECT * FROM games INNER JOIN user_friendships ON games.club_player_id = user_friendships.friend_id WHERE user_friendships.college_coach_id = ? AND games.scheduled_date > ? ORDER BY games.scheduled_date ASC", self.id, Date.today.advance(days: -1) ]
    Game.find_by_sql(query)
  end
  
  def full_name
    "Coach " + self.last_name
  end
end
