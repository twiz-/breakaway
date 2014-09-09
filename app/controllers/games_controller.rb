class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_filter :check_permission, only: [:edit, :update, :destroy]
  before_filter :player_can_play, only: [:show, :new, :edit, :update, :create, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :game_no_show
  
  
  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = current_club_player.games.new
  end

  # GET /games/1/edit
  def edit
   
  end

 
  def create
    @game = current_club_player.games.new(game_params)

    respond_to do |format|
      if @game.save
        @games = current_club_player.games
        format.html { redirect_to dashboard_path, notice: 'Game was successfully created.' }
        format.json { render action: 'show', status: :created, location: @game }
      else
        format.html { render action: 'new' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        @games = current_club_player.games
        format.html { redirect_to dashboard_path, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:scheduled_date, :scheduled_time, :opponent, :location, :club_player_id)
    end
    
    def check_permission
        handle_no_access if current_club_player != @game.club_player
    end
    def player_can_play
      redirect_to root_path, notice: "Sign in first my friend" unless current_club_player && club_player_signed_in?
    end
    def game_no_show
      logger.error "Tried to show a game that did not exist"
      redirect_to root_path, notice: "This game does not exist"
    end
end
