class ProfilesController < ApplicationController
  def index
  end
  def show
    @player = Player.find_by_profile_name(params[:id])
    
    if @player
      @listings = @player.listings
      @games = @user.games
      respond_to do |format|
          format.html
          format.csv {send_data Game.to_csv(@games)}
      end
      return action: :show
    else 
      render file: "public/404", status: 404, formats: [:html]
    end
  end
end
