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
  has_many :favorite_games, class_name: 'Game',  through: :friends, source: :friends
  
  def friend_already?(player)
    !friendship(player).blank?
  end
  
  def friendship(player)
    user_friendships.where(friend_id: player.id).first
  end
  
  def future_favorite_games
    self.favorite_games.where("scheduled_date > ?", DateTime.now).order(scheduled_date: :asc)
  end
end
