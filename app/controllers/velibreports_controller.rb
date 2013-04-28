require 'open-uri'

class VelibreportsController < ApiController

  caches_page :show, :expires_in => 2.minutes

  # GET /velibstations/1.json
  def show
    begin
      #respond_with current_user.velibstations.find(params[:id])
      respond_with open('http://www.velib.paris.fr/service/stationdetails/paris/' + params[:id]).read
    rescue
      return record_not_found
    end
  end

end
