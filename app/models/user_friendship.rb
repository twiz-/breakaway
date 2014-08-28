class UserFriendship < ActiveRecord::Base
  belongs_to :club_player
  belongs_to :college_coach
  belongs_to :friend, class_name: 'ClubPlayer', foreign_key: 'friend_id'
  
end
