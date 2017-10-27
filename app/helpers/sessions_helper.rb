module SessionsHelper

  def log_in(user_id)
    session[:user_id] = user_id
  end

  def set_user_name_into_session(user_name)
    session[:user_name] = user_name
  end

  def set_roles_into_session(roles)
    session[:roles] = roles
  end
  def current_user
    if session[:user_id]
      @current_user ||= session[:user_name]
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def check_user_logged_in
    redirect_to login_url if !logged_in?
  end
end
