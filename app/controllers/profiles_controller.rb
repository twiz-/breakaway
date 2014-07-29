class ProfilesController < ApplicationController
  def index
    @search = Player.search(params[:q])
    @profiles = @search.result
    
    
  end
  def show
    @player = Player.find_by_profile_name(params[:profile_name])
    
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
