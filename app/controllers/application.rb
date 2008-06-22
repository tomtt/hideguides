# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  before_filter :login_required
  before_filter :get_fireeagle_location
  
  filter_parameter_logging "password"

  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :secret => 'ef6a2bba33fae773b05878aaee5455c8'

  def get_fireeagle_location
    fireeagle = YAML.load(File.open(File.join(RAILS_ROOT, 'config', 'fireeagle.yml')))
    client = FireEagle::Client.new(:consumer_key => fireeagle['consumer_key'],
                                   :consumer_secret => fireeagle['consumer_secret'])
    client.get_request_token()
    fireeagle_token = FireeagleToken.find_or_create_by_user_id(current_user.id)
    fireeagle_token.update_attributes(:token => client.request_token.token,
                                      :secret => client.request_token.secret)
    redirect_to client.authorization_url
    true
  end
end
