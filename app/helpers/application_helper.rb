module ApplicationHelper
  def url_with_protocol(url)
    url ? /^http/i.match(url) ? url : "http://#{url}" : ''
  end

  def current_user_is_admin?
    if session[:roles]
      return session[:roles].include?(GlobalConstants::ADMIN)
    end
    false
  end

  def check_user_is_admin
      if !current_user_is_admin?
        redirect_to root_url
      end
  end

  def format_date(date)
    date ? date.strftime("%Y-%m-%d") : ''
  end

  def format_datetime(date)
    date ? date.strftime("%Y-%m-%d %H:%M:%S") : ''
  end

  def user_can_edit_this_request?(request)
    current_user.role == "admin" || current_user == request.user 
  end

  def user_can_delete_this_request?(request)
    current_user.role == "admin" || current_user == request.user 
  end

  def user_can_review_this_request?(request) 
    request.reviewers.where(:user_code => current_user.user_code).count != 0
  end

end
