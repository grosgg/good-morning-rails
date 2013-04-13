class Bookmark < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :title, :url, :user
end
