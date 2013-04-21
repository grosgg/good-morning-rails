class WeatherkeysController < ApiController

  # GET /weatherkeys.json
  def index
    respond_with current_user.weatherkey
  end

end
