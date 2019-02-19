class Destination < ApplicationRecord
  validates_presence_of :name, :url, :location
end
