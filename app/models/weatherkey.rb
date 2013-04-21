class Weatherkey < ActiveRecord::Base
  belongs_to :user
  attr_accessible :api_key, :user
end
