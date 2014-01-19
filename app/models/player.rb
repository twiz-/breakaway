class Player < User
  validates :first_name, :last_name, :profile_name, :grad_year, :position, :club_team, :formation, presence: :true
  validates :profile_name, uniqueness: :true
  validates :profile_name, format: {
        with: /\A[a-zA-Z0-9_-]+\z/,
        message: "must be formatted correctly."
      }
  
  has_many :listings
  has_many :games
end
