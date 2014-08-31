class ClubPlayer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_many :user_friendships, foreign_key: :friend_id
  has_many :friends, through: :user_friendships       
  
  validates :first_name, :last_name, :profile_name, :grad_year, :position, :club_team, :formation, presence: :true
  validates :profile_name, uniqueness: :true
  validates :profile_name, format: {
        with: /\A[a-zA-Z0-9_-]+\z/,
        message: "must be formatted correctly."
      }
  
  has_many :listings
  has_many :games
  
  def full_name
    self.first_name + "  " + self.last_name
  end
  
end
