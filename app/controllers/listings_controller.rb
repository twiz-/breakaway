class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_club_player!, only: [:new, :edit, :create, :update, :destroy]
  before_action :check_listing_total, only: [:new, :create]

  # GET /listings
  # GET /listings.json
  def index
    @listings = current_club_player.listings.order('created_at DESC').all    
  end
  
  # GET /listings/new
  def new
    @listing = current_club_player.listings.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = current_club_player.listings.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to dashboard_path, notice: 'Listing was successfully created.' }
        format.json { render action: 'show', status: :created, location: @listing }
      else
        format.html { render action: 'new' }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    if params[:listing] && params[:listing].has_key?(:user_id)
            params[:listing].delete(:user_id)
    end
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to dashboard_path, notice: 'Listing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.json { head :no_content }
    end
  end

  private
  
  def check_listing_total
    if current_club_player.listings.count >= 3 &&  !current_club_player.subscribed?
      redirect_to( dashboard_path, alert: "You're currently only able to 3 uploaded videos at this time, #{ view_context.link_to "Here", upgrade_path, id: 'flash-listing-upgrade'} you can upgrade your account to continue adding more videos.".html_safe )
    end
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = current_club_player.listings.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        render file: 'public/404', status: :not_found
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:video, :description)
    end

end
