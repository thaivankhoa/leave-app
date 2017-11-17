class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  #NEW ACTION

  def deny
    @request = Request.find(params[:id])
    
    respond_to do |format|
      @request.deny_request
      format.js { @current_item = @request }
    end
  end

  def approve
    @request = Request.find(params[:id])
    
    respond_to do |format|
      @request.approve_request
      format.js { @current_item = @request }
    end
  end

  # GET /requests
  def index
    @requests = Request.all
  end

  # GET /requests/1
  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /requests/new
  def new
    @request = Request.new

    1.times { @duration = @request.durations.build }

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /requests/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /requests
  def create
    @request = Request.new(request_params)
    @request.user = current_user

    if @request.save
      # create review association
      reviewers = request_params[:reviewer].split(", ")

      reviewers.each do |reviewer|
        @request.reviewers << User.where(:name => reviewer).first
      end
      # create cc association
      ccers = request_params[:ccer].split(", ")

      ccers.each do |ccer|
        @request.cc_users << User.where(:name => ccer).first
      end

      redirect_to user_path(current_user), notice: 'Request was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /requests/1
  def update
    # clear the reviewers before update new association
    @request.reviewers.each do |reviewer|
      Permission.where(:user_id => reviewer.id, :request_id => @request.id).first.delete
    end

    #clear the ccers before update new association
    @request.cc_users.each do |ccer|
      Cc.where(:user_id => ccer.id, :request_id => @request.id).first.delete
    end

    if @request.update(request_params)
      @request.return_to_pending_state
      # create review association
      reviewers = request_params[:reviewer].split(", ")

      reviewers.each do |reviewer|
        @request.reviewers << User.where(:name => reviewer).first
      end
      # create cc association
      ccers = request_params[:ccer].split(", ")

      ccers.each do |ccer|
        @request.cc_users << User.where(:name => ccer).first
      end

      redirect_to user_path(current_user), notice: 'Request was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /requests/1
  def destroy
    @request.destroy
    redirect_to user_path(current_user), notice: 'Request was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def request_params
      params.require(:request).permit(:id, :reviewer, :ccer, :request_type, :reason, :status, :user_id, durations_attributes: [:id, :first_date, :last_date, :duration_type, :request_id, :_destroy])
    end
end
