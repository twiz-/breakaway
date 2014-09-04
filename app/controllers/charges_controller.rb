class ChargesController < ApplicationController
  
  before_filter :authenticate_club_player!
  
  def new
    
  end
  
  def create
    
    #in cents
    @amount = 17000
    
    customer = Stripe::Customer.create(
    :email => current_club_player.email,
    :card => params[:stripeToken]    
    )
    
    charge = Stripe::Charge.create(
    :customer => customer.id, 
    :amount => @amount,
    :description => "54footy 3+ video customer",
    :currency => 'usd'
    )
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to upgrade_path
  end  
end
