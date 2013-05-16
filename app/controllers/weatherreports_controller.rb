require 'weather_api'

class WeatherreportsController < ApiController

  # GET /weatherreports/home.json
  def home
    key = current_user.weatherkey.api_key
    country = current_user.country
    town = current_user.town

    conditions = WeatherApi.conditions(key, country, town)
    #logger.debug conditions

    results = {:conditions => conditions}
    #logger.debug results
    respond_with results
  end

  # GET /weatherreports/weather.json
  def full
    key = current_user.weatherkey.api_key
    country = current_user.country
    town = current_user.town

    astronomy = WeatherApi.astronomy(key, country, town)
    hourly = WeatherApi.hourly(key, country, town)
    forecast = WeatherApi.forecast10day(key, country, town)

    results = {
        :astronomy => astronomy,
        :hourly => hourly,
        :forecast => forecast,
    }
    #logger.debug results
    respond_with results
  end

end
