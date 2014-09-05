class ChargesController < ApplicationController
  
  before_filter :authenticate_club_player!
  
  def new
    
  end
  
  def create        
    customer = Stripe::Customer.create(
    :email => current_club_player.email,
    :card => params[:stripeToken]    
    )
    
    new_customer_subscription = Stripe::Customer.retrieve(customer.id)
    new_customer_subscription.subscriptions.create(:plan => "a32a5b2ec70410bfe2")
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to upgrade_path
  end  
end
