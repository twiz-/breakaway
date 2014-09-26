class LinksController < ApplicationController
  after_action :log_visit
  
  def show_profile
    if params[:slug]
      @link = Link.find_by(slug: params[:slug])
      redirect_to @link.given_profile_url
    end
  end  
  
  private
  
  def log_visit
    @stat = Stat.new(clicker: request.remote_ip , link_id: @link.id)
    @stat.save
    @link.clicks += 1
    @link.save
  end
end
