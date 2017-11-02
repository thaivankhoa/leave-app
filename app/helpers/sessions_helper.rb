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

  def set_user_email_into_session(user_email)
    session[:user_email] = user_email
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.where(user_code: session[:user_id]).first
    end
  end

  # def current_user_name
  #   session[:user_name]
  # end

  def current_user_email
    session[:user_email]
  end

  # def current_user_code
  #   session[:user_id]
  # end

  # def current_user_role
  #   session[:roles].first
  # end

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
