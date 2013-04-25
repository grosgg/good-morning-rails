class Velibstation < ActiveRecord::Base
  belongs_to :user
  attr_accessible :velib_station_id, :title, :user
end
