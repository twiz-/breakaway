Rails.configuration.stripe = {
  :publishable_key => ENV['LIVE_STRIPE_PUB_KEY'],
  :secret_key      => ENV['LIVE_STRIPE_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

REGISTRATION_AMOUNT = 170 * 100