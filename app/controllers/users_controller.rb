class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :require_login
  before_filter :check_user_is_admin, only: [:index, :edit]
  # GET /users

  def pending_requests
    @requests = current_user.pending_requests
    respond_to do |format|
      format.html
      format.js
    end
  end

  def cc_requests
    @requests = current_user.cc_requests
    respond_to do |format|
      format.html
      format.js
    end
  end

  def index
    @users = User.all
  end

  # GET /users/1
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :role, :user_code, :balance)
    end
end
