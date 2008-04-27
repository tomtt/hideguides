# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def logged_in_message
    if logged_in?
      "You are logged in as #{current_user.login}. #{link_to 'Logout.', logout_path}"
    else
      link_to("Login", login_path)
    end
  end

  def if_logged_in(&block)
    if logged_in?
      concat(capture(&block), block.binding)
    end
  end
end
