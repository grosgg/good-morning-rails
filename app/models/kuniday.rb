class Kuniday < ActiveRecord::Base
  attr_accessible :date, :weekday, :week, :year, :am, :pm, :comment
end
