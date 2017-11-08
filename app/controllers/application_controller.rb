class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper
  include ApplicationHelper

  def require_login
    unless current_user
      redirect_to login_url
    end
  end

end
