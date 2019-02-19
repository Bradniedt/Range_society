class Destination < ApplicationRecord
  validates_presence_of :name, :location

  has_many :user_destinations
  has_many :users, through: :user_destinations
end
