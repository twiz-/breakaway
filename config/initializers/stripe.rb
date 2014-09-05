Rails.configuration.stripe = {
  :publishable_key => ENV['TEST_STRIPE_KEY_P'],
  :secret_key      => ENV['TEST_STRIPE_KEY_S']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

REGISTRATION_AMOUNT = 170 * 100