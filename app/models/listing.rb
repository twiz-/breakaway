class Listing < ActiveRecord::Base
  validates :video, :description, presence: :true
  validates :video, format: {
         with: /\Ahttps:\/\/www.youtube.com\//,
         message: "Must be a youtube video url."
       }
  
  belongs_to :club_player
end
