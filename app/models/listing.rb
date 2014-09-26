class Listing < ActiveRecord::Base
  
  before_create do |record|
    !record.video.downcase.include?("<script>")
  end
  
  validates :video, :description, presence: :true
  validates :video, format: {
         #with: /\Ahttps:\/\/www.youtube.com\//,
         with: /\A(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})/,
         message: "Must be a youtube video url and have https in url."
       }
  
  belongs_to :club_player
end
