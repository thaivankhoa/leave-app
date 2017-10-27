class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  require "uri"
  require "net/http"
  def new
    if current_user
      redirect_to root_url
    end
  end

  def create
    request_params = {
      email: params[:session][:username],
      password: params[:session][:password]
    }
    response = Net::HTTP.post_form(URI.parse(GlobalConstants::AUTH_USER_URL), request_params)
    response = JSON.parse response.body
    if response["status"] == 'OK'
      log_in response["user"]["id"]
      set_user_name_into_session response["user"]["name"]
      set_roles_into_session response["user"]["roles"]
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid Username/Password!'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_url
  end
end
