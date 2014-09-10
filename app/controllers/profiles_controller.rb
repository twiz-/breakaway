class ProfilesController < ApplicationController
  
    before_action :find_player, only: [:email_club_coach]

  def index
    current_friend_ids = current_college_coach.try(:friend_ids)
 
    unless current_friend_ids.blank?
      @search = ClubPlayer.where("id NOT IN (?)", current_friend_ids).search(params[:q])
    else
      @search = ClubPlayer.search(params[:q])
    end
    @profiles = @search.result.paginate(page: params[:page], per_page: 15).order('created_at DESC')
    
    respond_to do |format|
      format.html
      format.js
    end   
  end
  
  
  def show
    @thing = params[:profile_name]
    @player = ClubPlayer.find_by_profile_name(params[:profile_name])
    
    if @player
      @listings = @player.listings
      @games = @player.games
      respond_to do |format|
        format.html
        format.csv {send_data Game.to_csv(@games)}
      end
      return
      render action: :show
    else 
      render file: "public/404", status: 404, formats: [:html]
    end
  end
    
  def email_club_coach        
    club_player = ClubPlayer.find_by_profile_name(params[:profile_name]).full_name    
    message = params[:message]    
    notifier = Notifier.contact_club_coach(current_college_coach,message,club_player)    
    if notifier.deliver
      redirect_to profile_path(params[:profile_name]), notice: "Good your email has been sent and you'll receive a copy"
    else
      redirect_to profile_path(params[:profile_name]), notice: "The msg couldn't be deliverd please try again later. If it happens again contact support"
    end    
  end    
  
  private 
  def find_player
    @player = ClubPlayer.find_by_profile_name(params[:profile_name])
  end
end
