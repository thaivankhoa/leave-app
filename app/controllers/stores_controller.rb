class StoresController < ApplicationController
  before_filter :require_login
  def index
  end

  def company_dashboard
  	@requests = Request.all
  	respond_to do |format|
  		format.html
  		format.js
  	end
  end
end
