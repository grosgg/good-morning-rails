class ApiController < ApplicationController
  before_filter :allow_cross_domain_access
  before_filter :authenticate_user!
  respond_to :json

  skip_before_filter :authenticate_user!, :only => :options

  def allow_cross_domain_access
    headers["Access-Control-Allow-Origin"] = "*"
    headers["Access-Control-Allow-Methods"] = "GET, PUT, POST, DELETE, OPTIONS"
    headers["Access-Control-Allow-Headers"] = "X-Requested-With, Content-Type"
    #headers["Access-Control-Max-Age"] = 86400
  end

  def options
    head(:ok)
  end

  private

  def record_not_found
    render :json => { :errors => ["Record not found."] },  :success => false, :status => :not_found
  end
end
