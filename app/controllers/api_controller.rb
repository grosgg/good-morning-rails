class ApiController < ApplicationController
  before_filter :allow_cross_domain_access
    def allow_cross_domain_access
      response.headers["Access-Control-Allow-Origin"] = "*"
      response.headers["Access-Control-Allow-Methods"] = "GET, PUT, POST, DELETE"
    end
  before_filter :authenticate_user!
  respond_to :json

  private

  def record_not_found
    render :json => { :errors => ["Record not found."] },  :success => false, :status => :not_found
  end
end
