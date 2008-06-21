# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  before_filter :login_required

  filter_parameter_logging "password"

  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :secret => 'ef6a2bba33fae773b05878aaee5455c8'

  @fireeagle = YAML.load(File.open(File.join(RAILS_ROOT, 'config', 'fireeagle.yml')))
  debugger
   a=2
   
end
