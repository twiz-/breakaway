class ClubPlayer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  
  
  after_destroy do |club_player|
    club_player.cancel_subscription_plan if club_player.subscribed?
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_many :user_friendships, foreign_key: :friend_id, dependent: :destroy
  has_many :friends, through: :user_friendships, dependent: :destroy       
  
  validates :first_name, :last_name, :profile_name, :gender, :grad_year, :position, :club_team, :formation, presence: :true
  validates :profile_name, uniqueness: :true
  validates :profile_name, format: {
        with: /\A[a-zA-Z0-9_-]+\z/,
        message: "must be formatted correctly."
      }
  
  has_many :listings, dependent: :destroy
  has_many :games, dependent: :destroy
  
  has_one :subscription, dependent: :destroy
  has_one :link, dependent: :destroy
  
  def full_name
    self.first_name + "  " + self.last_name
  end
  
  def subscribed?
    !subscription.blank?
  end
  
  def disabled?
    self.disabled == true
  end
  
  def cancel_subscription_plan
    user = Stripe::Customer.retrieve(self.subscription.stripe_customer_id)
    plan = user.subscriptions["data"].first["id"]
    user.subscriptions.retrieve(plan).delete
    self.subscription.destroy
  end
  
end
