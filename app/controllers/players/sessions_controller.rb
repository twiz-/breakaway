class Players::SessionsController < Devise::SessionsController
  before_action :check_abuse, only: [:create]
  
  def new
    super
  end
  
  private
  def check_abuse
    if current_club_player.disabled == true
      sign_out(current_club_player)
      redirect_to root_path, notice: "Looks like you might be violating some terms. What gives? Your account is under review. If you think this is a mistake contact support with questions."
    end
  end
end