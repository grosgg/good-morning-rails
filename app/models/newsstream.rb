class Newsstream < ActiveRecord::Base
  belongs_to :user
  attr_accessible :url, :title, :user
end
