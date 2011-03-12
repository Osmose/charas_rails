# Load the rails application
require File.expand_path('../application', __FILE__)

# Require lib helpers
require File.expand_path('../../lib/paper_clip_helper.rb', __FILE__)

# Initialize the rails application
Charas::Application.initialize!