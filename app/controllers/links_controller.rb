class LinksController < ApplicationController
  
  def show_profile
    if params[:slug]
      @link = Link.find_by(slug: params[:slug])
      if redirect_to @link.given_profile_url
        @stat = Stat.new(clicker: request.remote_ip ,link_id: @link.id)
        @stat.save
        @link.clicks += 1
        @link.save
      end
    end
  end  
end
