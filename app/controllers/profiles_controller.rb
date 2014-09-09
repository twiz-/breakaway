class ProfilesController < ApplicationController

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
    
end
