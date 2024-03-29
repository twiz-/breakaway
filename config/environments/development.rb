Breakaway::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false
  
  #From Devise
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  
  # send email through postmark in development
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
       address: "smtp.postmarkapp.com",
       port: 2525, 
       domain: "54footy.com",
       user_name: ENV['PostMarkKeyID'],
       password: ENV['PostMarkKeyID'],
       authentication: 'plain', 
       enable_starttls_auto: true
  }

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  #send the actualy email in development
  config.action_mailer.perform_deliveries = true
  

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log
  
  # if having trouble deploying to heroku, only 
  # mentioned for rails 3.2
  # config.assets.initialize_on_precompile = false

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
end
