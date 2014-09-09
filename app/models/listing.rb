class Listing < ActiveRecord::Base
  validates :video, :description, presence: :true
  
  belongs_to :club_player
end
