class ChargesController < ApplicationController
  
  before_filter :player_already_subscribed?  
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
    
    subscription = Subscription.new
    subscription.club_player_id           = current_club_player.id
    subscription.stripe_token             = params[:stripeToken]
    subscription.amount                   = REGISTRATION_AMOUNT
    subscription.email                    = current_club_player.email
    subscription.stripe_customer_id       = customer.id
    subscription.created_at               = Date.today
    subscription.stripe_subscription_name = "a32a5b2ec70410bfe2"
    subscription.save
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to upgrade_path
  end  
  
  private
  
  def player_already_subscribed?
    redirect_to(dashboard_path, notice: "You are already subscribed, no need to subscribe again :)") if current_club_player.subscribed? 
  end
    
end
