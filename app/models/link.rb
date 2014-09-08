class Link < ActiveRecord::Base
  belongs_to :club_player
  
  def generate_short_link
    self.slug = SecureRandom.urlsafe_base64(6)
    self.save
  end
  
  def display_slug
    ENV["BASE_URL"] + 't/' + self.slug
  end
  
end
