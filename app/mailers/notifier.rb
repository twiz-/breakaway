class Notifier < ActionMailer::Base
  include Devise::Controllers::UrlHelpers #
  include Devise::Mailers::Helpers
  helper :application # gives access to all helpers defined within 
  
  default from: "tony@54footy.com"
  
  def contact_club_coach(college_coach, message, club_player)    
    @college_coach = college_coach
    @message       = message
    @club_player   = club_player    
    mail(to: "tony@54footy.com", subject: "Coach #{@college_coach.last_name} from #{@college_coach.email} ")        
  end
  
end
