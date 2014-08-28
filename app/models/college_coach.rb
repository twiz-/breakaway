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
   has_many :friends, through: :user_friendships
end
