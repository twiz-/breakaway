class LinksController < ApplicationController
  
  def show_profile
    if params[:slug]
      @link = Link.find_by(slug: params[:slug])
      if redirect_to @link.given_profile_url
        @link.clicks += 1
        @link.save
      end
    end
  end  
end
