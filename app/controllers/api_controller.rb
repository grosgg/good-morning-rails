class ApiController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  private

  def record_not_found
    render :json => { :errors => ["Record not found."] },  :success => false, :status => :not_found
  end
end
