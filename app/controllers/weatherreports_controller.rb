require 'weather_api'

class WeatherreportsController < ApiController

  # GET /weatherreports.json
  def index
    key = current_user.weatherkey.api_key
    country = 'France'
    town = 'Paris'

    conditions = WeatherApi.conditions(key, country, town)
    #logger.debug conditions
    astronomy = WeatherApi.astronomy(key, country, town)
    #logger.debug astronomy

    results = {:conditions => conditions, :astronomy => astronomy}
    #logger.debug results
    respond_with results
  end

end
