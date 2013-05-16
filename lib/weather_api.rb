require 'httparty'
require 'json'

module WeatherApi
  def WeatherApi.conditions(key, country, town)
    response = HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/#{country}/#{town}.json")
    response = JSON.parse(response.body)
    response["current_observation"]
  end

  def WeatherApi.astronomy(key, country, town)
    response = HTTParty.get("http://api.wunderground.com/api/#{key}/astronomy/q/#{country}/#{town}.json")
    response = JSON.parse(response.body)
    response["moon_phase"]
  end

  def WeatherApi.hourly(key, country, town)
    response = HTTParty.get("http://api.wunderground.com/api/#{key}/hourly/q/#{country}/#{town}.json")
    response = JSON.parse(response.body)
    response["hourly_forecast"].slice!(12,24)
    response["hourly_forecast"]
  end

  def WeatherApi.forecast10day(key, country, town)
    response = HTTParty.get("http://api.wunderground.com/api/#{key}/forecast10day/q/#{country}/#{town}.json")
    response = JSON.parse(response.body)
    response["forecast"].delete("simpleforecast")
    response["forecast"]["txt_forecast"]["forecastday"].slice!(8,12)
    response["forecast"]
  end

end
