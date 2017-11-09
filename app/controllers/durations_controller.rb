class DurationsController < ApplicationController
  before_action :set_duration, only: [:show, :edit, :update, :destroy]

  # GET /durations
  def index
    @durations = Duration.all
  end

  # GET /durations/1
  def show
  end

  # GET /durations/new
  def new
    @duration = Duration.new
  end

  # GET /durations/1/edit
  def edit
  end

  # POST /durations
  def create
    @duration = Duration.new(duration_params)

    if @duration.save
      redirect_to @duration, notice: 'Duration was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /durations/1
  def update
    if @duration.update(duration_params)
      redirect_to @duration, notice: 'Duration was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /durations/1
  def destroy
    @duration.destroy
    redirect_to durations_url, notice: 'Duration was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_duration
      @duration = Duration.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def duration_params
      params.require(:duration).permit(:first_date, :last_date, :duration_type, :request_id)
    end
end
