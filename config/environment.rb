# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Breakaway::Application.initialize!

config.action_mailer.default_url_options = { :host => 'http://murmuring-sands-2665.herokuapp.com/' }
