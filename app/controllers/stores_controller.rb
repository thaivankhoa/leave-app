class StoresController < ApplicationController
  before_filter :require_login, only: :index
  def index
  end

  def company_dashboard
  	@requests = Request.all
  end
end
