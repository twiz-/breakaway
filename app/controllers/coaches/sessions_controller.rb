class Coaches::SessionsController < Devise::SessionsController
  before_filter :check_abuse, only: [:create]
  
  private
  def check_abuse
    if current_college_coach.try(:disabled) == true
      sign_out(current_college_coach)
      redirect_to root_path, notice: "Looks like you're not a college coach at the email you provided. What gives? Your account is under review. If you think this is a mistake contact support with questions."
    end
  end
  
end