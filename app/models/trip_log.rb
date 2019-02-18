class TripLog < ApplicationRecord
  verifies_presence_of :title, :miles
  belongs_to :user
end
