module ApplicationHelper
  def url_with_protocol(url)
    url ? /^http/i.match(url) ? url : "http://#{url}" : ''
  end

  def current_user_is_admin?
    current_user.role == "admin"
  end

  def check_user_is_admin
      if !current_user_is_admin?
        flash[:notice] = "Sorry, you don't have permisson to do this "
        redirect_to root_url
      end
  end

  def permission_to_edit_user
    unless current_user.id == params[:id] || current_user_is_admin?
      flash[:notice] = "Sorry, you don't have permisson to do this "
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
    current_user_is_admin? || current_user == request.user 
  end

  def user_can_delete_this_request?(request)
    current_user_is_admin? || current_user == request.user 
  end

  def user_can_review_this_request?(request) 
    request.reviewers.where(:user_code => current_user.user_code).count != 0
  end

end
